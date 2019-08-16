require 'sinatra'
require 'rack'
require 'github_api'
require 'byebug'
require 'dotenv/load'

# start local server with shotgun
# use ngrok to expose
# http://1c4e8b5a.ngrok.io

class App < Sinatra::Base

  get '/' do
    'testing!'
  end

end
