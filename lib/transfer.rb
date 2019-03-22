class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid?
      @sender.amount + @amount
      @receiver.amount - @amount
  end

  def reverse_transfer
    @sender.amount - @amount
    @receiver.amount + @amount
  end

end
