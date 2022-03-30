class Admin < ApplicationRecord

  before_save { self.name = name.downcase }
  validates :name, presence: true

  has_secure_password validations: true
end
