class ChangeColumnTypePhysicalStats < ActiveRecord::Migration[7.2]
  def change
    change_column :physical_stats, :gender, :integer
    change_column :physical_stats, :activity_lvl, :integer
  end
end
