require 'sinatra/base'
require "pry"

require "./db/setup"
require "./lib/all"

class Gifweb < Sinatra::Base
  get '/gifs' do
    Gif.order(created_at: :desc).to_json
  end

  get '/gifs/random' do
    # if params["tag"]
    #   Gif.random(params["tag"]).to_json
    # else
    #   Gif.random.to_json
    # end
    g = Gif.random params["tag"]
    redirect g.url
  end
end

Gifweb.run!