class FixColumName < ActiveRecord::Migration[5.2]
  def change
    rename_column :holidays, :start, :start_date
    rename_column :holidays, :end, :end_date
  end
end
