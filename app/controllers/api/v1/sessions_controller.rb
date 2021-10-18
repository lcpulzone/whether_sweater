class Api::V1::SessionsController < ApplicationController
  def create
    found_user = User.find_by(email: params[:email])
    
    if found_user && found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      render json: UsersSerializer.new(found_user), status: 200
    else
      render json: { error: 'Your email and/or password are incorrect' }, status: 400
    end
  end
end
