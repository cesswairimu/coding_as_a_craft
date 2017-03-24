class Atm
  attr_accessor :funds
  def initialize
    @funds = 1000
  end
  def withdraw(amount, pin, account)
    case 
    when insufficient_funds_account(amount, account)
    { status: false, message: 'You have insufficient funds!!', date: Date.today }
    when insufficient_funds_atm(amount, account)
    { status: false, message: 'Insufficient funds in ATM', date: Date.today }
    when incorrect_pin(pin, account.pin)
    { status: false, message: 'Incorrect Pin', date: Date.today }
    when card_expired(account.exp_date)
      { status: false, message: 'ATM Card Expired!!', date: Date.today }
    when account.account_status == :disabled
      { status: false, message: 'Your account is disabled!!', date: Date.today }
    else
      transaction(amount, account)
    end
  end

  private
  def insufficient_funds_account(amount, account)
    amount > account.balance

  end

  def transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    {status: true, message: "Success!!", date: Date.today, amount: amount, bills: add_bills(amount)}
  end

  def add_bills(amount)
    denominations = [20,10,5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0 #while amount is not subracted to zero from bill
        amount -= bill #subtract bill from amount
        bills << bill #push into the bills array
      end
    end
    bills
  end
  def insufficient_funds_atm(amount, account)
    @funds < amount
  end
  def incorrect_pin(pin, actual_pin)
    pin != actual_pin
  end
  def card_expired(exp_date)
    Date.strptime(exp_date,'%m/%y')<Date.today
  end
end

