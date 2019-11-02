class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id]=@user.id
      redirect_to root_path
    else
      errors=@user.errors.messages.map do |k,v|
        v.map do |s|
          "#{k} #{s}"
        end
      end
      @errors=errors.flatten
      render 'users/new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :email, :phone, :password)
    end
end
