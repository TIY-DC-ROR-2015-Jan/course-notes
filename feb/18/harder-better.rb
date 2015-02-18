require 'sinatra/base'
require 'pry'

def play sample
  system "afplay samples/#{sample}.mp3"
end

class MyApp < Sinatra::Base
  # Routes POST /first => action
  # post '/first' do
  #   "POSTed to /first"
  # end

  # delete '/second' do
  #   "DELETEd to /second"
  # end
  post '/harder' do
    if params[:v].to_i == 2 # they asked for v=2
      play "Harder2"
    else
      play "Harder1"
    end
  end

  post '/better' do
    play "Better1"
  end

  post '/faster' do
    play "Faster1"
  end

  post '/stronger' do
    play "Stronger1"
  end
end

MyApp.run! # if MyApp.app_name == $PROGRAM_NAME