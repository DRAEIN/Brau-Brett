class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
     rename_column :jobs, :Ort, :ort
  
  end
end
