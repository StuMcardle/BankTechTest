require 'statement'
require 'account'

describe Statement do

  before :each do
    @statement = Statement.new
    @account = Account.new(@statement)
  end

  after :each do
    @transactions = 0
  end

  it 'transactions array starts out empty' do
    expect(@statement.transactions.length).to eq(0)
  end

  it 'transactions array stores transactions' do
    @account.deposit(500)
    @account.withdraw(200)
    @account.withdraw(100)
    expect(@statement.transactions.length).to eq(3)
  end

  it 'prints out the transactions in the Statement' do
    @account.deposit(500)
    @account.withdraw(200)
    @statement.create_statement
    @statement.stub(:create_statement).and_return('Here is your statement')
    expect(@statement.create_statement).to eq('Here is your statement')
  end

end