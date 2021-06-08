class LoadoutsController < ApplicationController
    get '/loadouts' do 
        @user = current_user
        @loadouts = Loadout.all
        erb :'/loadouts/index'
    end
     

end