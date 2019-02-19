class AddPhotoToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :photo, :string
  end
end
