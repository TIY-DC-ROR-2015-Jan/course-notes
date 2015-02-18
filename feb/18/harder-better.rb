require 'sinatra/base'
require 'pry'

class MyApp < Sinatra::Base
  # Routes POST /first => action
  # post '/first' do
  #   "POSTed to /first"
  # end

  # delete '/second' do
  #   "DELETEd to /second"
  # end
  post '/harder' do
    system "afplay samples/Harder1.mp3"
  end

  post '/better' do
    system "afplay samples/Better1.mp3"
  end

  post '/faster' do
    system "afplay samples/Faster1.mp3"
  end

  post '/stronger' do
    system "afplay samples/Stronger1.mp3"
  end
end

MyApp.run! # if MyApp.app_name == $PROGRAM_NAME