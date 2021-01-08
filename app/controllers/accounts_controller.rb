class AccountsController < ApplicationController
  def new
    unless session[:user_id].nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    @message = ''
  end

  def create
    if params[:form_account][:name] == '' || params[:form_account][:password] == ''
      @message = 'Invalid name or password!'
      render 'new'
    elsif !Account.find_by(login: params[:form_account][:name]).nil?
      @message = 'User with this name already exists!'
      render 'new'
    else
      create_new_account
    end
  end

  def create_new_account
    account = Account.new
    account.init(params[:form_account][:name], params[:form_account][:password])
    session[:user_id] = account.id
    redirect_to '/menu'
  end
end
