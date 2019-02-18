class AddDurationToExperience < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :duration, :string
  end
end
