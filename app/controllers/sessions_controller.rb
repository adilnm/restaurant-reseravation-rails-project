class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user=User.new
    end
  end

  def create
    user=User.find_by(:name=>params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id]=user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
