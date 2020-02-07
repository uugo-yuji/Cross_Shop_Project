class CreateBoardAreaRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :board_area_relations do |t|
      t.references :board, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
