class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :summary
      t.string :description
      t.date :due_date
      t.references :swim_lane, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
