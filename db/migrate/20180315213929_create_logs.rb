class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.belongs_to :card
      t.belongs_to :user
      t.string :unknown_card

      t.timestamps
    end
  end
end
