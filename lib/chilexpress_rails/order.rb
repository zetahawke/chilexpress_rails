# This is a constructor class for orders
class Order
  attr_reader :track_number, :product, :service, :status, :receiver,
              :receiver_name, :datetime

  def initialize(attributes)
    @track_number   = attributes[:track_number]
    @product        = attributes[:product]
    @service        = attributes[:service]
    @status         = attributes[:status]
    @receiver       = attributes[:receiver]
    @receiver_name  = attributes[:receiver_name]
    @datetime       = attributes[:datetime]
  end
end
