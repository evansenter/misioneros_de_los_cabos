class AddNameToContactInfo < ActiveRecord::Migration
  def change
    add_column :contact_infos, :full_name, :string
  end
end
