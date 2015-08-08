require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, '../views'
#     enable :sessions
#     set :session_secret, "fwitter"
  end
  
  get '/' do
    require 'mechanize'
    mechanize = Mechanize.new
    page = mechanize.get('http://stackoverflow.com/')
    @title = page.title
    erb :index
  end
  
end