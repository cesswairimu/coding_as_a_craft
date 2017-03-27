class Account
  attr_accessor :pin, :account_status, :balance, :exp_date
  def new
    @account = Account.new
    set_expire_date
  end
  def initialize(attr={ })
    set_owner(attr[:owner])
    # @pin = pin
     @account_status = :active
    # @balance = balance
    @exp_date = Date.today.next_year(5).strftime("%m/%y")

  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end
  private
  def set_owner(obj)
  obj == nil ? missing_owner : @owner = obj
  end
  def missing_owner
    raise 'An account owner required'
  end

end

