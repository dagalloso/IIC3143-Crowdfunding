class AddRutToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :rut, :string, null:false
    add_index :companies, :rut, unique: true
  end
end
