require './lib/statement'

class Account
  attr_accessor :balance

  START_BALANCE = 0

  def initialize(statement = Statement.new)
    @statement = statement
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount

    @statement.deposit_log(amount, @balance)
  end

  def withdraw(amount)
    raise "You cannot withdraw this amount as your balance is #{balance}" if exceeds_balance?(amount)

    @balance -= amount

    @statement.withdrawal_log(amount, @balance)
  end

  def print_statement
    @statement.create_statement
  end

  private

  def exceeds_balance?(amount)
    amount > @balance
  end
end