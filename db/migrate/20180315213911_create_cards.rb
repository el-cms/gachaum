class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :number, null: false
      t.belongs_to :user

      t.timestamps

      t.index :number, unique: true
    end
  end
end
