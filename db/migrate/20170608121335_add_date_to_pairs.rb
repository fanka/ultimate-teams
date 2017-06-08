class AddDateToPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :pair_date, :date
  
  end
end
