class AccountsController < ApplicationController
  def new
    unless session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @warning = ''
  end

  def create
    if params[:form_account][:name] == '' || params[:form_account][:password] == ''
      @warning = 'Invalid name or password!'
      render 'new'
    elsif !Account.find_by(login: params[:form_account][:name]).nil?
      @warning = 'User with this name already exists!'
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
