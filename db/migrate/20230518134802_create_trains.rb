class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :name
      t.decimal :cost
      t.decimal :total_weight
      t.decimal :total_volume
      t.integer :status, default: 0
      t.string :assigned_line
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
