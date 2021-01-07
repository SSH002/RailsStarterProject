class Account < ApplicationRecord
  def init(name, password)
    self.login = name
    self.password = SHA3::Digest::SHA384.new.update password

    init_stats
    self.wins = 0
    self.defeates = 0

    save
  end

  def check_password(checked_password)
    SHA3::Digest::SHA384.new.update(checked_password) == password
  end

  def new_password(new_password)
    self.password = SHA3::Digest::SHA384.new.update new_password

    save
  end

  def load_from_slot(slot)
    self.mana = slot.mana
    self.happiens = slot.happiens
    self.fatigue = slot.fatigue
    self.money = slot.money
  end

  def init_stats
    self.mana = 30
    self.happiens = 5
    self.fatigue = 0
    self.money = 5000

    save
  end

  def apply_stats(mana, happiens, fatigue, money)
    self.mana += mana
    self.happiens += happiens
    self.fatigue += fatigue
    self.money += money

    if self.mana.negative?
      self.mana = 0
      self.happiens -= 1
    end
    self.mana = 100 if self.mana > 100

    if self.fatigue > 100
      self.fatigue = 100
      self.happiens -= 1
    end
    self.fatigue = 0 if self.fatigue.negative?

    self.happiens = 10 if self.happiens > 10

    save
  end

  def check_win_lose
    if self.money > 30_000
      self.wins += 1
      save

      'You win! Now Valera can buy notebook and work at home, drinking while working.'
    elsif self.happiens < -9
      self.defeates += 1
      save

      'You loose! You got depressed.'
    else
      ''
    end
  end

  def go_job
    if mana > 60
      'You cannot go job: you are drunk.'
    else
      apply_stats(-30, 0, 30, 1250)

      "Unloved job brings Valera a stable income. At least when he's not drunk."
    end
  end

  def rest
    apply_stats(-10, 1, -30, 0)

    'Valera got some rest.'
  end

  def watch_serial
    apply_stats(-10, 2, -15, 0)

    'Watching a good series cheers up Valera.'
  end

  def drink_with_marginals
    if self.money >= 1500
      apply_stats(50, 2, -30, 1500)
      'Valera sometimes like to drink a glass of vodka with his marginal-friends.'
    else
      "You don't have enough money to have a drink with your marginal-friends."
    end
  end

  def sleep
    apply_stats(50, 0, -70, 0)

    'Valera slept well and is ready for new achievements.'
  end

  def sing
    if self.mana >= 40
      bonus = rand(50..450)
      apply_stats(-15, 1, 10, bonus)

      "You have earned #{bonus} money for beautiful singing!"
    else
      apply_stats(-15, 1, 10, 0)

      "This time, no one appreciated Valera's singing."
    end
  end
end
