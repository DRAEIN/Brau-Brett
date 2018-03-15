class ChangeColoumnNameBack < ActiveRecord::Migration[5.0]
  def change

     rename_column :jobs, :ort, :Ort
  
  
  end
end
