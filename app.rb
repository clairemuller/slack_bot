require 'sinatra'
require 'rack'
require 'github_api'
require 'byebug'
require 'dotenv/load'
require 'faraday'
require 'json'

# start local server with shotgun
# use ngrok to expose
# http://1c4e8b5a.ngrok.io

class App < Sinatra::Base

  get '/' do
    # this installs the app in a new workspace using Slack's OAuth 2.0
    # Slack sends code, app responds with post request, Slack responds with access token
    if params['code']
      client_id = ENV['CLIENT_ID']
      client_secret = ENV['CLIENT_SECRET']
      code = params['code']
      url = 'https://slack.com/api/oauth.access'

      resp = Faraday.post(url, "client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
      parsed = JSON.parse resp.body

      if parsed['access_token']
        token = parsed['access_token']
        'slack bot added!'
      elsif parsed['error']
        "something went wrong: #{parsed['error']}"
      end
    end
  end

end
