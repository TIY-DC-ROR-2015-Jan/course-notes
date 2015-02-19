require 'sinatra/base'
require "pry"

require "./db/setup"
require "./lib/all"

class Gifweb < Sinatra::Base
  get '/gifs' do
    Gif.order(created_at: :desc).to_json
  end

  get '/gifs/random' do
    g = Gif.random params["tag"]
    redirect g.url
  end

  post '/gifs' do
    # views: 0
    g = Gif.create! url: params["url"]
    if params["tag"] # given a tag name
      g.add_tag params["tag"]
    end
    g.to_json
  end

  patch '/gifs/:id' do
    # params[:id] is the id from path
    # add tag from params to gif with given id
    Gif.find(params[:id]).add_tag params["tag"]
  end
end

Gifweb.run!