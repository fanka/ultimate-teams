class AddFirstNameToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :user_id, :bigint
  end
end
