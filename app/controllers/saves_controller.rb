class SavesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    return unless session[:user_id].nil?

    render plain: 'Error! You not authorized.', status: :unauthorized
  end

  def create
    user = Account.find_by(id: session[:user_id])

    if params[:save_form][:name_save] == ''
      @message = 'Invalid name save!'
      render 'new'
    else
      selected_save_name = params[:save_form][:name_save]
      saves_list = Slot.where(account_id: session[:user_id]).all

      saves_list&.each do |it|
        next unless it.name == selected_save_name

        rewrite_slot(it, user)
        return
      end
      create_new_slot(user)
    end
  end

  def rewrite_slot(slot, user)
    slot.set_from_account(user, params[:save_form][:name_save])
    slot.save
    redirect_to '/game'
  end

  def create_new_slot(user)
    slot = Slot.new
    slot.set_from_account(user, params[:save_form][:name_save])

    slot.save
    redirect_to '/game'
  end
end
