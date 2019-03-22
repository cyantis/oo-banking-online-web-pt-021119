class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
