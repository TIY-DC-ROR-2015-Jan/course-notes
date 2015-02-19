require 'sinatra/base'

class Gifweb < Sinatra::Base
  get '/' do
    "OK"
  end
end

Gifweb.run!