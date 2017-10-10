class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event, dependent: :destroy
  has_one :profile


  def profile?
    profile.present? && profile.persisted?
  end

  def full_name
    return profile.full_name if profile?
    current_user.email
  end

end
