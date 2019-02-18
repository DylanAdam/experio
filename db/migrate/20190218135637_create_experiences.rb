class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :price
      t.integer :capacity_min
      t.date :validity_date
      t.string :category
      t.references :user, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
