class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :host, null: false, index: true, foreign_key: { to_table: :users }
      t.string :adress, null: false
      t.string :description
      t.decimal :fee, null: false
      t.decimal :latitude, null: false, precision: 8, scale: 6
      t.decimal :longitude, null: false, precision: 9, scale: 6
      t.string :image, default: 'https://images.unsplash.com/photo-1581543591520-afa01e4d7e7b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80'

      t.timestamps
    end
  end
end
