class ProfilesController < ApplicationController
  def index
    if session[:user_id].nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    @message = ''
    @account = Account.find_by(id: session[:user_id])
  end

  def create
    @account = Account.find_by(id: session[:user_id])

    if params[:form_profile][:password] == ''
      @message = 'Invalid password!'
    else
      @account.new_password(params[:form_profile][:password])
      @message = 'Password changed successfully!'
    end

    render 'index'
  end
end
