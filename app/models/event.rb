class Event < ActiveRecord::Base
  attr_accessible :name, :date
  serialize :attendance, Hash
  validates :name, presence: true
  validates :date, presence: true
  # Attendees
  has_many :users

  def to_s
    name
  end
end
