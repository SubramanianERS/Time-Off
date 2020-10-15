class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.string :title
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
