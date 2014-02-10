class GenerateNoticesTable < ActiveRecord::Migration
  def change
    create_table :notices do |table|
      table.string     :title
      table.text       :body
      table.belongs_to :user
      table.timestamps
    end
  end
end
