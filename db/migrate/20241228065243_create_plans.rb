class CreatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.date :apply_date

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
