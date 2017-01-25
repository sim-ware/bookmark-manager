require 'spec_helper'

feature 'Viewing tagged links' do
  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag_name: 'education')])
    Link.create(url: 'http://www.bubblemania.com', title: 'Bubble Mania', tags: [Tag.first_or_create(tag_name: 'bubbles')])
    Link.create(url: 'http://www.bubblefrenzy.com', title: 'Bubble Frenzy', tags: [Tag.first_or_create(tag_name: 'bubbles')])
  end

  scenario 'on a dedicated tag page' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content 'Makers Academy'
      expect(page).to have_content 'Bubble Mania'
      expect(page).to have_content 'Bubble Frenzy'
    end
  end
end
