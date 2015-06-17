class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.string :platform
      t.integer :user_id

      t.timestamps
    end
    
    add_index :devices, :user_id
  end
end
