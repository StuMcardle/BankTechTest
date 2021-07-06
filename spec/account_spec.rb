require 'account'

describe Account do
  
  it 'checks that default balance is zero' do
    expect(subject.balance).to eq (0)
  end

  it 'can deposit amount into account' do
    expect{ subject.deposit(500) }.to change{ subject.balance }.by 500
  end

  it 'can withdraw amount from account' do
    expect{ subject.withdraw(200) }.to change{ subject.balance }.by -200
  end

end