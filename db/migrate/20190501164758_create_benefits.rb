class CreateBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :benefits do |t|
      t.string :title
      t.string :description
      t.integer :company_id

      t.timestamps
    end
  end
end
