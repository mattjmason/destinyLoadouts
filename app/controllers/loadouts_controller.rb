class LoadoutsController < ApplicationController

    get '/loadouts' do 
        redirect_to_if_not_logged_in
        @user = current_user
        @loadouts = Loadout.all
        erb :'/loadouts/index'
    end
     
    get '/loadouts/new' do 
        redirect_to_if_not_logged_in
        erb :'/loadouts/new'
    end

    post '/loadouts' do 
        @loadout = current_user.loadouts.create(params)
        if @loadout.save
            redirect '/loadouts'
        else
            redirect '/loadouts/new'
        end
    end

    get '/loadouts/:id' do 
        @user = current_user
        @loadout = Loadout.find_by_id(params[:id])
        if @loadout
            erb :'/loadouts/show'
        else
            redirect '/loadouts'
        end
    end

    get '/loadouts/:id/edit' do 
        redirect_to_if_not_logged_in
        @loadout = Loadout.find_by_id(params[:id])
        erb :'/loadouts/edit'
      end
      
      
      patch '/loadouts/:id/edit' do 
        redirect_to_if_not_logged_in
        @loadout = Loadout.find_by_id(params[:id])
        if logged_in? && @loadout.user_id == current_user.id 
        @loadout.title = params[:title]
        @loadout.description = params[:description]
        @loadout.character_class = params[:character_class]
        @loadout.primary = params[:primary]
        @loadout.secondary = params[:secondary]
        @loadout.heavy = params[:heavy]
        @loadout.save 
        redirect "/loadouts/#{@loadout.id}"
      else
        redirect '/loadouts'
        end
      end
      
      delete '/loadouts/:id/delete' do
        @loadout = Loadout.find_by_id(params[:id])
        if logged_in? && @loadout.user_id == current_user.id
          @loadout.destroy
        end
          redirect '/loadouts'
      end
  



end