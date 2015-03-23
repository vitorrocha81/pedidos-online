class OrderStatus
  STATUSES = %w(finished, pending, paid)

  def description
    @status
  end

  def ==(other_status)
    case other_status
    when OrderStatus
      @status == other_status.description
    when "finished", "pending", "paid" #STATUSES
      @status == other_status
    else
      raise "#{other_status} it's not a valid status"
    end
  end

  private

  def initialize(status_description)
    @status = status_description
  end

  FINISHED = OrderStatus.new("finished")
  PENDING  = OrderStatus.new("pending")
  PAID     = OrderStatus.new("paid")
end
