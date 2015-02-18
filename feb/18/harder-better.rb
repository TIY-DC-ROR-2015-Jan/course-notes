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
  # post '/harder' do
  #   # ?v=2 as a query param
  #   if params[:v].to_i == 2 # they asked for v=2
  #     play "Harder2"
  #   else
  #     play "Harder1"
  #   end
  # end

  # post '/better' do
  #   play "Better1"
  # end
  # post '/better/:variant' do
  #   # version comes in as part of path
  #   if params[:variant].to_i == 2
  #     play "Better2"
  #   else
  #     play "Better1"
  #   end
  # end

  # post '/faster' do
  #   play "Faster1"
  # end

  # post '/stronger' do
  #   play "Stronger1"
  # end
  words = %w( After Better DoIt Ever Faster Harder Hour MakeIt MakesUs MoreThan Never Our Over Stronger WorkIs WorkIt )
  words.each do |w|
    post "/#{w.downcase}" do
      variant = params[:v] || 1
      play "#{w}#{variant}"
    end
  end

  # DANGER!!!
  # post '/:sample' do
  #   play params[:sample]
  # end
end

MyApp.run! # if MyApp.app_name == $PROGRAM_NAME