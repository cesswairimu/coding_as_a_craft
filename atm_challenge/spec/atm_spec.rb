require './lib/atm.rb'
describe Atm do
  let(:account) { instance_double('Account', pin: 1234, exp_date: '04/17', account_status: :active) }
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
    subject.withdraw(50,1234, account)
    expect(subject.funds).to eq 950
  end
  it 'allows withdrawal if bank has enough funds' do
    expected_output ={ status: true, message: 'Success!!', date: Date.today, amount: 45 }
    expect(subject.withdraw(45,1234, account)).to eq(expected_output)
  end

  it "rejects withdrawal if bank has insufficient funds" do
    expected_output = { status: false, message: 'You have insufficient funds!!', date: Date.today }
    expect(subject.withdraw(105, 1234, account)).to eq(expected_output)
  end

  it "rejects withdrawal if ATM has insufficient funds" do
    subject.funds = 50
    expected_output = { status: false, message: 'Insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, 1234, account)).to eq(expected_output)
end
  it 'rejects withdrawal if Atm is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: 'ATM Card Expired!!', date: Date.today }
    expect(subject.withdraw(6, 1234, account)).to eq(expected_output)
  end
  it 'rejects withdrawal if account is disabled' do
    allow(account).to receive(:account_status).and_return(:disabled)
    expected_output = { status: false, message: 'Your account is disabled!!', date: Date.today }
    expect(subject.withdraw(5, 1234, account)).to eq(expected_output)

  end
end

