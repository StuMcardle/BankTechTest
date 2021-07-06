class Account
  attr_reader :balance

  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "You cannot withdraw this amount as your balance is #{balance}" if exceeds_balance?(amount)

    @balance -= amount
  end

  private

  def exceeds_balance?(amount)
    amount > @balance
  end
end