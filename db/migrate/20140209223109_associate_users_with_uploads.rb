class AssociateUsersWithUploads < ActiveRecord::Migration
  def change
    change_table :uploads do |table|
      table.belongs_to :user
      table.string :s3_url
    end
  end
end
