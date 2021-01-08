require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Account, type: :model do
  describe '.Base' do
    it 'load_from_slot' do
      (account = build(:account)).init_stats
      (slot = Slot.new).base_init
      account.load_from_slot(slot)
      expect(account.money).to eq 5000
    end

    it 'set_from_account' do
      (account = build(:account)).init_stats
      (slot = Slot.new).base_init
      slot.set_from_account(account, 'saved_game')
      expect(slot.money).to eq 5000
    end

    it 'verivy password' do
      (account = build(:account)).init_stats
      account.new_password('1')

      expect(account.check_password('1')).to eq true
    end

    it 'victory_game' do
      (account = build(:account)).init_stats
      account.money = 50_000
      expect(account.check_win_lose).to eq \
        'You win! Now Valera can buy notebook and work at home, drinking while working.'
    end

    it 'defeat_game' do
      (account = build(:account)).init_stats
      account.happiens = -10
      expect(account.check_win_lose).to eq 'You defeated! Valera got depressed.'
    end

    it 'continue_game' do
      (account = build(:account)).init_stats
      account.happiens = 5
      account.money = 5000
      expect(account.check_win_lose).to eq ''
    end

    it 'fix_stats' do
      (account = build(:account)).init_stats
      account.happiens = 15
      account.apply_stats(-30, 0, 30, 1250)
      expect(account.happiens).to eq 10
    end
  end

  describe '.GameActions' do
    it 'go_job_success' do
      (account = build(:account)).init_stats
      expect(account.go_job).to eq "Unloved job brings Valera a stable income. At least when he's not drunk."
    end

    it 'go_job_failed' do
      (account = build(:account)).init_stats
      account.mana = 80
      expect(account.go_job).to eq 'You cannot go job: you are drunk.'
    end

    it 'rest' do
      (account = build(:account)).init_stats
      expect(account.rest).to eq 'Valera got some rest.'
    end

    it 'watch_serial' do
      (account = build(:account)).init_stats
      expect(account.watch_serial).to eq 'Watching a good serial cheers up Valera.'
    end

    it 'drink_with_marginls_success' do
      (account = build(:account)).init_stats
      expect(account.drink_with_marginals).to eq 'Valera sometimes like drink glass of vodka with his marginal-friends.'
    end

    it 'drink_with_marginls_failed' do
      (account = build(:account)).init_stats
      account.money = 1499
      expect(account.drink_with_marginals).to eq "You don't have enough money have a drink with your marginal-friends."
    end

    it 'sleep' do
      (account = build(:account)).init_stats
      expect(account.sleep).to eq 'Valera slept well and is ready for new achievements.'
    end

    it 'sing_bonus' do
      (account = build(:account)).init_stats
      account.mana = 80
      account.money = 0
      account.sing
      expect(account.money).not_to eq 0
    end

    it 'sing_no_bonus' do
      (account = build(:account)).init_stats
      expect(account.sing).to eq "This time, no one appreciated Valera's singing."
    end
  end
end
