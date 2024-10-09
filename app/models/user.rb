class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  scope :admin, -> { where(admin: true) }
  scope :not_admin, -> { where(admin: false) }
end
