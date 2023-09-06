# frozen_string_literal: true

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Associations
  has_many :organizations, dependent: :destroy

  # Validations
  # Email validations----------------
  validates :email, presence: true, length: {maximum: 254}, format: { with: URI::MailTo::EMAIL_REGEXP }
  
end
