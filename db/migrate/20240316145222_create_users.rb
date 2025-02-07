class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :phone
      t.string :headline
      t.string :about
      t.string :city
      t.string :type
      t.date :deleted_at

      t.timestamps
    end
  end
end
