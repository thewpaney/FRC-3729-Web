class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at
  serialize :attendance, Hash
  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  # Attendees
  has_many :users

  def to_s
    name
  end
  has_event_calendar :start_at_field  => 'start_at', :end_at_field => 'end_at'
end
