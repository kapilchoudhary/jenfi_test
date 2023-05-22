class AddColumnToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :remaining_weight_capacity, :decimal
    add_column :trains, :remaining_volume_capacity, :decimal
    change_column(:trains, :assigned_line, :integer)  
  end
end
