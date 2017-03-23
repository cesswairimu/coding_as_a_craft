class Atm
  attr_accessor :funds
  def initialize
    @funds = 1000
  end
  def withdraw(amount, account)
    case 
    when insufficient_funds(amount, account)
      return
    else
      transaction(amount, account)
    end
  end

  private
  def insufficient_funds(amount, account)
    amount > account.balance
  end
  def transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    {status: true, message: "Success!!", date: Date.today, amount: amount}
  end
end
