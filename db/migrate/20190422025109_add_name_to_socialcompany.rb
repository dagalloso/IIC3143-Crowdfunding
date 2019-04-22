class AddNameToSocialcompany < ActiveRecord::Migration[5.1]
  def change
    add_column :socialcompanies, :name, :string, null:false
  end
end
