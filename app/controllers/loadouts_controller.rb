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

    post 'loadouts' do 
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

end