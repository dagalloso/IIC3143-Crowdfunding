class AddNameToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :name, :string, null: false
  end
end
