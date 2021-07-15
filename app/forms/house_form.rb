class HouseForm < YAAF::Form
  attr_accessor :id, :name, :address

  delegate :to_param,
    :persisted?,
    :model_name, to: :house

  def initialize(attributes = {})
    super(attributes)

    @models = [house]
  end

  def house
    @house ||= House.find_or_initialize_by(id: id).tap do |house|
      house.name = name
      house.address = address
    end
  end
end
