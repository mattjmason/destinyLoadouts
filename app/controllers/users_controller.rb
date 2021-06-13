class UsersController < ApplicationController
    get '/signup' do 
        if logged_in?
            redirect to '/loadouts'
        else 
        erb :'users/signup'
        end
      end
    
    post '/signup' do 
        user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        if user.save 
            session[:user_id] = user.id
            redirect to '/loadouts'
        else 
            erb :'users/signup'
        end
    end


      get '/login' do 
        if logged_in?
            redirect  to '/loadouts'
        else
            erb :'/users/login'
        end
      end

      post '/login' do 
        @current_user = User.find_by(:username => params[:username])
        if @current_user && @current_user.authenticate(params[:password])
            session[:user_id] = @current_user.id
            redirect to '/loadouts'
        else 
            if @current_user
                erb :'users/login'
            else 
                erb :'users/login'
            end
        end
    end
get '/logout' do 
    if logged_in?
        session.clear
        redirect to '/'
    else 
        redirect to '/'
    end
end
    

end