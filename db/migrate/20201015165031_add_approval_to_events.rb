class AddApprovalToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :is_approved, :boolean
  end
end
