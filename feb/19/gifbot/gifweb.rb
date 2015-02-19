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
    g.to_json
  end
end

Gifweb.run!