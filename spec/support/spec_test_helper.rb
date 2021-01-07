require 'rails_helper'
module SpecTestHelper
  def login_user
    account_user = Account.new
    account_user.health = 100
    account_user.tired = 0
    account_user.money = 0
    account_user.funny = 0
    account_user.mana = 0
    account_user.points = 0
    account_user.id = 1
    session[:user_id] = account_user.id
  end
end

RSpec.configure do |config|
  config.include SpecTestHelper, type: :controller
end
