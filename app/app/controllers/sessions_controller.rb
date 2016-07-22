# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController

  def new
  end
#Tworzenie nowej sesji logowania. Komunikat o sukcesie albo ewentualnym błędzie.
  def create
  	user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url :notice => "Zalogowałeś się"
    else
      flash.now.alert = "Błędne hasło lub email"
      render "new"
    end
  end

  #Wylogowanie się.
  def destroy
  	session[:user_id] = nil
    redirect_to root_url, :notice => "Wylogowałeś się!"
  end

end
