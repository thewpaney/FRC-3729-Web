class Issue < ActiveRecord::Base
  attr_accessible :description, :watchers, :parent, :subtasks, :name
  serialize :watchers, Array
  serialize :subtasks, Array
  validates :description, presence: true
  validates :name, presence: true
  
  #  belongs_to :parent, :class_name => 'Issue', :foreign_key => 'parent'
  #  has_many :children, :class_name => 'Issue', :foreign_key => 'parent'

  # @@tree_root = Tree::TreeNode.new("Issue Tree Root", nil)

  # def self.add_issue(i)
  #   # Check if issue has a parent
  #   if not i.parent.nil?
  #     # Find appropriate parent node
  #     parent = @@tree_root.detect {|issue| i.parent == issue.content.id }
  #     # Die if parent can't be found
  #     if parent.nil?
  #       return false
  #     else
  #       # Otherwise, insert it into le tree
  #       parent << Tree::TreeNode("#{i.id} - #{i.name}", i)
  #     end
  #   else
  #     # If no parent specified
  #   end
  # end

  # def self.tree_table_html
    
  # end

end
