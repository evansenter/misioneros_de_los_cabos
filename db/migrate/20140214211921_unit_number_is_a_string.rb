class UnitNumberIsAString < ActiveRecord::Migration
  def change
    change_column :contact_infos, :unit_number, :string
  end
end
