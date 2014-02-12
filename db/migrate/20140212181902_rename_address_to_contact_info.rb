class RenameAddressToContactInfo < ActiveRecord::Migration
  def change
    rename_table :addresses, :contact_infos
    
    change_table :contact_infos do |table|
      table.string  :phone_number
      table.integer :unit_number
      table.string  :zip
    end
  end
end
