class Addblogposttousers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :blogpost
    end
  end
end
