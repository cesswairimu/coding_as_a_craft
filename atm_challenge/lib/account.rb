class Account
  attr_accessor :pin, :account_status, :balance, :exp_date
  def new
    @account = Account.new
    set_expire_date
  end
  def initialize
    # @pin = pin
     @account_status = :active
    # @balance = balance
    @exp_date = Date.today.next_year(5).strftime("%m/%y")

  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end

end

