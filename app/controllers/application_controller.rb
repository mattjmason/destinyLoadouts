require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Infinity and Beyond"
  end

  get "/" do
    if logged_in?
      redirect to '/loadouts'
    else 
      erb :index
    end
  end

  helpers do 
    
  def logged_in?
    !!session[:user_id]
  end

  end
end
