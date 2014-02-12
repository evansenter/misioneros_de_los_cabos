class AddAddressToUser < ActiveRecord::Migration
  def change
    create_table :addresses do |table|
      table.belongs_to :user
      table.string :address_1
      table.string :address_2
      table.string :city
      table.string :state
      table.string :country
      table.timestamps
    end
  end
end
