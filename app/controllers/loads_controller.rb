class LoadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    if session[:user_id].nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    saves_list = Slot.where(account_id: session[:user_id]).all
    @save_names_list = []

    saves_list&.each do |it|
      @save_names_list.append(it.name)
    end
  end

  def create
    selected_save_name = params[:load_form][:saves_list]
    saves_list = Slot.where(account_id: session[:user_id]).all

    saves_list&.each do |it|
      next unless it.name == selected_save_name

      user = Account.find_by(id: session[:user_id])
      user.load_from_slot(it)
      user.save
    end

    session[:last_warn] = ''
    redirect_to '/game'
  end
end
