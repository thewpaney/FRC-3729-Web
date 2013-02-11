class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :description
      t.string :name
      t.text :watchers # Array of Users?
      t.integer :parent
      t.text :subtasks # Array of integers
      t.timestamps
    end
  end
end
