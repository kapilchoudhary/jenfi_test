class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.decimal :weight
      t.decimal :volume
      t.integer :status, default: 0
      t.references :user, foreign_key:true
      t.references :train, foreign_key:true

      t.timestamps
    end
  end
end
