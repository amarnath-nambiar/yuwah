class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :role
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
