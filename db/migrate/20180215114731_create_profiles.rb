class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :Name
      t.string :Titel
      t.text :Beschreibung

      t.timestamps
    end
  end
end
