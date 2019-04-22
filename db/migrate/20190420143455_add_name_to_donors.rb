class AddNameToDonors < ActiveRecord::Migration[5.1]
  def change
    add_column :donors, :name, :string
  end
end
