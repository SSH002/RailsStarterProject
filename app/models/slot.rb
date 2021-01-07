class Slot < ApplicationRecord
  def set_from_account(account, slot_name)
    self.account_id = account.id
    self.name = slot_name
    self.mana = account.mana
    self.happiens = account.happiens
    self.money = account.money
    self.fatigue = account.fatigue
  end

  def base_init
    self.account_id = 0
    self.name = ''
    self.mana = 0
    self.happiens = 0
    self.money = 0
    self.fatigue = 0
  end
end

class Slot < ApplicationRecord
end
