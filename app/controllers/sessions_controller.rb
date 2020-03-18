class SessionsController < ApplicationController
   def new
       
   end
   
   def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Felicitation pour cette INCROYABLE connexion !! "
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:danger] = "uuurrrhhhhh Identifiants incorrects mon gars !"
            render 'new' 
        end
   end
   
   def destroy
       session[:user_id] = nil
       flash[:success] = "Utilisateur deconnecté .. Au revoir !"
       redirect_to root_path
   end
   
end