class GameController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if session[:user_id].nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    @account = account_get
    check_end_game
    @message = session[:message] || ''
  end

  def account_get
    Account.find_by(id: session[:user_id])
  end

  def check_end_game
    result = account_get.check_win_lose

    if result == ''
      @is_lose = false
    else
      session[:message] = result
      @is_lose = true
    end
  end

  def start_new_game
    account_get.init_stats

    session[:message] = ''
    redirect_to '/game'
  end

  def go_job
    session[:message] = account_get.go_job
    redirect_to '/game'
  end

  def rest
    session[:message] = account_get.rest
    redirect_to '/game'
  end

  def watch_serial
    session[:message] = account_get.watch_serial
    redirect_to '/game'
  end

  def drink_with_marginals
    session[:message] = account_get.drink_with_marginals
    redirect_to '/game'
  end

  def sleep
    session[:message] = account_get.sleep
    redirect_to '/game'
  end

  def sing
    session[:message] = account_get.sing
    redirect_to '/game'
  end
end
