class AddEmailToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :email, :string
  end
end
