require 'spec_helper'

feature 'Adding tags' do

  scenario 'one tag via the new link form' do
    visit '/links/new'
    fill_in :url,   with: 'http://www.makersacademy.com/'
    fill_in :title, with: 'Makers Academy'
    fill_in :tags,  with: 'education'
    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('education')
  end

  scenario 'multiple tags via the new link form' do
    visit '/links/new'
    fill_in :url,   with: 'http://www.makersacademy.com/'
    fill_in :title, with: 'Makers Academy'
    fill_in :tags,  with: 'education, technology'
    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('education', 'technology')
  end

end
