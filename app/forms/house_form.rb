class HouseForm < YAAF::Form
  attr_accessor :id
  attr_writer :name, :address

  delegate :to_param,
    :persisted?,
    :model_name, to: :house

  before_validation :assign_house_attributes

  def initialize(attributes = {})
    super(attributes)

    @models = [house]
  end

  def name
    @name.presence || house.name
  end

  def address
    @address.presence || house.address
  end

  def house
    @house ||= House.find_or_initialize_by(id: id)
  end

  def house_attributes
    {
      name: name,
      address: address
    }
  end

  private

  def assign_house_attributes
    house.assign_attributes(house_attributes)
  end
end
