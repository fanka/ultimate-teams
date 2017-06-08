class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy

  def has_profile?
    profile.present?
  end

  def full_name
    profile.full_name
  end

  def is_admin?
    admin == true
  end

  def change_admin_status
    self.admin = !self.admin
    self.save
  end

end
