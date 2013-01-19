class Issue < ActiveRecord::Base
  attr_accessible :description
  serialize :watchers, Array
  serialize :parent_task, Issue
  serialize :subtasks, Array
  validates :description, presence: true

end
