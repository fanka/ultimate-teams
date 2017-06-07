class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_picture, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
