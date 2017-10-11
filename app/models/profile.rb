class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  def full_name
  "#{first_name} #{last_name}"
  end

  def self.by_initial(letter)
      where("first_name LIKE ?", "#{letter}%").order(:first_name)
    end


end
