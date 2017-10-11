class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true

  def bargain?
     price < 30
   end

   def self.order_by_price
   order :price
 end




end
