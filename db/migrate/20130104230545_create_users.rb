class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :first
      t.string :last
      t.string :pass
      t.text :credentials
      t.string :email

      t.timestamps
    end
  end
end
