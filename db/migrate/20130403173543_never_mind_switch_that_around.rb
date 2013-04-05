class NeverMindSwitchThatAround < ActiveRecord::Migration
  def change
    change_table :blog_posts do |t|
      t.references :user
    end
  end
end
