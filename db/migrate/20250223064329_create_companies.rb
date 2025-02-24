class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.boolean :active
      t.date :deleted_at

      t.timestamps
    end
  end
end
