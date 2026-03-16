class CreateAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airports do |t|
      t.string :code
      t.integer :terminals
      t.string :name
      t.string :city
      t.string :country
      t.boolean :active, default: true
      t.boolean :international, default: false

      t.timestamps
    end
  end
end
