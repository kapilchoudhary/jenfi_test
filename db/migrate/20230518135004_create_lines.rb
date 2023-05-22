class CreateLines < ActiveRecord::Migration[7.0]
  def change
    create_table :lines do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :train, foreign_key:true

      t.timestamps
    end
  end
end
