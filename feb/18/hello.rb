require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/hi' do
    "Hello World!"
  end
end

MyApp.run! # if MyApp.app_name == $PROGRAM_NAME