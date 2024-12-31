class CreatePhysicalStats < ActiveRecord::Migration[7.2]
  def change
    create_table :physical_stats do |t|
      t.integer :age
      t.integer :gender
      t.float :height
      t.float :weight
      t.integer :activity_lvl
      t.integer :goal_calories

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
