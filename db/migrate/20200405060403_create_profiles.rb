class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :pic, null: false
      t.string :text, null: false
      t.string :diver_lank
      t.string :dive_number
      t.timestamps
    end
  end
end
