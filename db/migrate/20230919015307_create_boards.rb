class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name, null:false
      t.string :title, null:false
      t.text :body, null:false

      t.timestamps
    end
  end
end
