ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/form'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split(', ').each do |t|
      link.tags << Tag.first_or_create(tag_name: t)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:something' do
    tag = Tag.first(tag_name: params[:something])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0
end
