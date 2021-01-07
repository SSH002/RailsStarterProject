require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Slot, type: :model do
  describe '.Slot' do
    it 'base_init' do
      (slot = described_class.new).base_init
      expect(slot.happiens).to eq 5
    end

    it 'load_from_slot' do
      (account = build(:account)).init_stats
      account.money = 50_000

      (slot = described_class.new).base_init
      slot.set_from_account(account, 'saved_game')
      expect(slot.money).to eq 50_000
    end
  end
end
