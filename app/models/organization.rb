class Organization < ApplicationRecord
  # Associations
  belongs_to :user

  # Scopes
  scope :by_user, ->(user) { where(user_id: user.id) }

  # validations
  validates :name, :website, :country, :description, :founded, :industry, :employees_number, presence: true

end
