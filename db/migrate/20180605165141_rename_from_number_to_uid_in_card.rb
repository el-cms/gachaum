class RenameFromNumberToUidInCard < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :number, :uid
  end
end
