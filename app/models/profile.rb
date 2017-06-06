class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_picture, presence: true

  mount_uploader :profile_picture, ImageUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
