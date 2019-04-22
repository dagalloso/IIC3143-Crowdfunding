class ChangeColumnToDonors < ActiveRecord::Migration[5.1]
  def change
    change_column_null :donors, :name, false
  end
end
