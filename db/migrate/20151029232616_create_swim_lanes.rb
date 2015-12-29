class CreateSwimLanes < ActiveRecord::Migration
  def change
    create_table :swim_lanes do |t|
      t.string :name
      t.integer :days
      t.integer :order
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
