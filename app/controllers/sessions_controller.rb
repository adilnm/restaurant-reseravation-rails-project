class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user=User.new
    end
  end

  def create
    if auth
      oauth_email=auth['info']['email']
      oauth_name=auth['info']['name']
      if user=User.find_by(email:oauth_email)
        session[:user_id]=user.id
        redirect_to root_path

      else
        user=User.new(email:oauth_email, name:oauth_name)
        user.save(validate: false)
          # (validate: false) is used to bypass validations when login in through facebook
          session[:user_id]=user.id
          redirect_to root_path

      end
    else
      user=User.find_by(:name=>params[:user][:name])
      if user && user.authenticate(params[:user][:password])
        session[:user_id]=user.id
        redirect_to root_path
      else
        flash[:errors] = "You have entered an invalid username and/or password"
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  def auth
    request.env['omniauth.auth']
  end

end
