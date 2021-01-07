class GameController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @account = get_account
    check_end_game
    @warning = session[:last_warn] || ''
  end

  def rules
    render plain: 'Access error', status: :unauthorized unless session[:user_id].nil?
  end

  def get_account
    Account.find_by(id: session[:user_id])
  end

  def check_end_game
    result = get_account.check_win_lose

    if result == ''
      @is_lose = false
    else
      session[:last_warn] = result
      @is_lose = true
    end
  end

  def start_new_game
    get_account.init_stats

    session[:last_warn] = ''
    redirect_to '/game'
  end

  def go_job
    session[:last_warn] = get_account.go_job
    redirect_to '/game'
  end

  def rest
    session[:last_warn] = get_account.rest
    redirect_to '/game'
  end

  def watch_serial
    session[:last_warn] = get_account.watch_serial
    redirect_to '/game'
  end

  def drink_with_marginals
    session[:last_warn] = get_account.drink_with_marginals
    redirect_to '/game'
  end

  def sleep
    session[:last_warn] = get_account.sleep
    redirect_to '/game'
  end

  def sing
    session[:last_warn] = get_account.sing
    redirect_to '/game'
  end
end
