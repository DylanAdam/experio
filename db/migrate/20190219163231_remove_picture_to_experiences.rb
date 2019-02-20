class RemovePictureToExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :picture
  end
end
