class AddStudent1ToPair < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :student_1, :string
  end
end
