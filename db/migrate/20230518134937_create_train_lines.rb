class CreateTrainLines < ActiveRecord::Migration[7.0]
  def change
    create_table :train_lines do |t|
      t.references :line, foreign_key:true
      t.references :train, foreign_key:true

      t.timestamps
    end
  end
end
