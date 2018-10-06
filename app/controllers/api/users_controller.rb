class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      # @user.session_token = session[:session_token]
      # use helper from ApplicationController, to log user in.
      sign_in(@user)
      render json: '/api/session'
      # render @user object
      # {id: 5
      # }

      # { name: bulbausor
      # item: sword}
    else

    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
