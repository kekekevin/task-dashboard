class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :time_zone
      t.string :description

      t.timestamps null: false
    end
  end
end
