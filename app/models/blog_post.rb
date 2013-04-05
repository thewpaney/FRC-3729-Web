class BlogPost < ActiveRecord::Base
  attr_accessible :body, :title
  validates :body, presence: true
  validates :title, presence: true

  belongs_to :user


end
