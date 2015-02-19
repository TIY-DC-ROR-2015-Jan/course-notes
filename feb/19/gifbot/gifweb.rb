require 'sinatra/base'
require "pry"

require "./db/setup"
require "./lib/all"

class Gifweb < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, '3000'
  
  def current_user
    #username = headers["Authorization"]
    username = params["user"]
    User.find_by_name username
  end

  get '/gifs' do
    Gif.order(created_at: :desc).to_json
  end

  get '/gifs/random' do
    g = Gif.random params["tag"]
    redirect g.url
  end

  post '/gifs' do
    # views: 0
    # user_id: current_user.id
    g = current_user.gifs.create! url: params["url"]
    if params["tag"] # given a tag name
      g.add_tag params["tag"]
    end
    g.to_json
  end

  patch '/gifs/:id' do
    # params[:id] is the id from path
    # add tag from params to gif with given id
    g = Gif.find(params[:id])
    g.add_tag params["tag"]
    g.to_json
  end

  delete '/gifs/:id' do
    g = Gif.find params["id"]
    if current_user == g.user # allowed
      g.delete
      "Ok, deleted"
    else
      "Denied"
    end
  end
end

Gifweb.run!