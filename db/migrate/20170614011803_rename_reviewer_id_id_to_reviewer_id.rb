class RenameReviewerIdIdToReviewerId < ActiveRecord::Migration
  def change
  	rename_column :books, :reviewer_id_id, :reviewer_id
  end
end
