class CreatePhysicalStats < ActiveRecord::Migration[7.2]
  def change
    create_table :physical_stats do |t|
      t.integer :age
      t.string :gender
      t.float :height
      t.float :weight
      t.string :activity_lvl
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
