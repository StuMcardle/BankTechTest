require 'account'
require 'terminal-table'

class Statement
  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def print_balance(balance)
    "You have a balance of #{balance}"
  end

  def create_statement
    rows = []

    table = Terminal::Table.new rows: rows

    @transactions.each do |t|
      rows << [t[:date], t[:credit], t[:debit], t[:balance]]
    end

    table = Terminal::Table.new headings: %w(Date Credit Debit Balance), rows: rows

    puts table
  end

  def time
    Time.now.strftime("%d, %m, %Y")
  end

  def withdrawal_log(amount, balance)
    @transactions << { date: time, credit: 0, debit: amount, balance: balance }
  end
  
  def deposit_log(amount, balance)
    @transactions << { date: time, credit: amount, debit: 0, balance: balance }
  end
  
end