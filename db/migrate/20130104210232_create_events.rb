class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :attendance
      t.datetime :date

      t.timestamps
    end
  end
end
