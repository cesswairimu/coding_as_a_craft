require './lib/atm.rb'
describe Atm do
  let(:account) { instance_double('Account') }
  before do
    #add atrribute of balance and set it to 100
    allow(account).to receive(:balance).and_return(100)
    #allow account to receive new balance using setter method
    allow(account).to receive(:balance=)
  end

  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at a withdrawal' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end
  it 'allows withdrawal if bank has enough funds' do
    expected_output ={ status: true, message: 'Success!!', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, account)).to eq(expected_output)
  end
end

