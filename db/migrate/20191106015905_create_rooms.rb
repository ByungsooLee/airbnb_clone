class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.string :price
      t.text :description
      t.string :location
      t.boolean :has_heating
      t.boolean :has_tv
      t.boolean :has_kichen
      t.boolean :has_internet
      t.boolean :has_aircon
      t.string :home_type
      t.string :room_type
      t.integer :guest_count
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.boolean :is_active

      t.timestamps
    end
  end
end
