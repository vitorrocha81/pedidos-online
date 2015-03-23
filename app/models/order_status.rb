class OrderStatus
  STATUSES = %w(finished, pending, paid)

  def description
    @status
  end

  def ==(other_status)
    case
    when STATUSES
      @status == other_status
    when OrderStatus
      @status == other_status.description
    else
      raise
    end

  end
  private
  def initialize(status_description)
    @status = status_description
  end

  FINISHED = OrderStatus.new("finished")
  PENDING = OrderStatus.new("pending")
  PAID = OrderStatus.new("paid")
end
