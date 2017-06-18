class RenameBookIdIdToBookId < ActiveRecord::Migration
  def change
  	rename_column :notes, :book_id_id, :book_id
  end
end
