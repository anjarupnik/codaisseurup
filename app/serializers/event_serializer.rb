class EventSerializer < ActiveModel::Serializer
  attributes :name, :description, :location, :price, :capacity, :includes_food,
    :includes_drinks, :starts_at, :ends_at, :active

  has_many :registrations
end
