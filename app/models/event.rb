class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at, :location
  serialize :attendance, Hash
  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  
  def to_s
    name
  end
  after_initialize :set_attendance

  # The attendance will be kept with a hash of the user's email to their
  # attendance to the event. The first value in the list is their response to 
  # the email (nil=no response, true=attending, false=not attending)
  # while the second is actual attendance (nil, false = not there, true = there)

  def set_attendance
    User.all.map(&:email).each do |email| 
      self.attendance[email] ||= [nil, nil]
    end
  end

  def past?
    start_at.past? and end_at.past?
  end
  
  has_event_calendar :start_at_field  => 'start_at', :end_at_field => 'end_at'
end
