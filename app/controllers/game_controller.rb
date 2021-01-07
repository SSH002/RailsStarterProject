class GameController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      render plain: 'Access error', status: :unauthorized
      return
    end

    @account = account_get
    check_end_game
    @warning = session[:last_warn] || ''
  end

  def rules
    render plain: 'Access error', status: :unauthorized unless session[:user_id].nil?
  end

  def account_get
    Account.find_by(id: session[:user_id])
  end

  def check_end_game
    result = account_get.check_win_lose

    if result == ''
      @is_lose = false
    else
      session[:last_warn] = result
      @is_lose = true
    end
  end

  def start_new_game
    account_get.init_stats

    session[:last_warn] = ''
    redirect_to '/game'
  end

  def go_job
    session[:last_warn] = account_get.go_job
    redirect_to '/game'
  end

  def rest
    session[:last_warn] = account_get.rest
    redirect_to '/game'
  end

  def watch_serial
    session[:last_warn] = account_get.watch_serial
    redirect_to '/game'
  end

  def drink_with_marginals
    session[:last_warn] = account_get.drink_with_marginals
    redirect_to '/game'
  end

  def sleep
    session[:last_warn] = account_get.sleep
    redirect_to '/game'
  end

  def sing
    session[:last_warn] = account_get.sing
    redirect_to '/game'
  end
end
