class Event < ActiveRecord::Base
  belongs_to :state
  belongs_to :user
  has_many :eventrosters
  has_many :attendees, through: :eventrosters, source: :user
  validates :name, :date, :city, presence: :true
end
