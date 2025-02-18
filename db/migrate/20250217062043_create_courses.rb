class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.references :college, null: false, foreign_key: true
      t.string :duration
      t.string :eligibility
      t.string :full_form

      t.timestamps
    end
  end
end
