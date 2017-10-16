class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true

  def bargain?
     price < 30
   end

   def self.order_by_price
    order :price
  end

 def self.order_by_name
   order(name: :asc)
 end

 scope :published, -> { where(active: true) }
 scope :starts_before_ends_after, ->(starts_at, ends_at) {
  where('starts_at < ? AND ends_at > ?', starts_at, ends_at)
}
scope :starts_on_date, ->(starts_at){
  where('starts_at == ? ', starts_at)
}
scope :ends_on_date, ->(ends_at){
  where('ends_at == ? ', ends_at)
}


end
