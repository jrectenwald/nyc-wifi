require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
#     enable :sessions
#     set :session_secret, "fwitter"
  end
  
  get '/' do
    require 'mechanize'
    mechanize = Mechanize.new
    page = mechanize.get('https://nycopendata.socrata.com/Social-Services/NYC-Wi-Fi-Hotspot-Locations/a9we-mtpn?')
    @title = page.title
    erb :index
  end
  
end