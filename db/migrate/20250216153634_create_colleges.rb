class CreateColleges < ActiveRecord::Migration[7.1]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.integer :established_year
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
