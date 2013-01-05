class BlogPost < ActiveRecord::Base
  attr_accessible :body, :title, :posterid
  validates :body, presence: true
  validates :title, presence: true

  has_one :user
end
