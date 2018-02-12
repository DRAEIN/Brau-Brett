class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :Titel
      t.text :Beschreibung
      t.string :Ort

      t.timestamps
    end
  end
end
