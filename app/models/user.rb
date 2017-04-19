class User < ActiveRecord::Base
  belongs_to :state
  has_secure_password
  has_many :events
  has_many :comments
  has_many :eventrosters
  has_many :events_attending, through: :eventrosters
  validates :name, :email, :city, presence: :true
  validates :email, uniqueness: :true
end
