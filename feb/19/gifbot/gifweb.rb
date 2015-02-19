require 'sinatra/base'
require "pry"

require "./db/setup"
require "./lib/all"

class Gifweb < Sinatra::Base
  get '/gifs' do
    Gif.order(created_at: :desc).to_json
  end
end

Gifweb.run!