class AddTitleToUploads < ActiveRecord::Migration
  def change
    change_table :uploads do |table|
      table.string :title
    end
  end
end
