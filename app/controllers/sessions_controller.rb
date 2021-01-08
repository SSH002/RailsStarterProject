class SessionsController < ApplicationController
  def new
    unless session[:user_id].nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    @message = ''
  end

  def create
    user = Account.find_by(login: params[:form_account][:name])

    if !user.nil? && user.check_password(params[:form_account][:password])
      session[:user_id] = user.id
      redirect_to '/menu'
    else
      @warning = 'Incorrect name or password!'
      render 'new'
    end
  end
end
