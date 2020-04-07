class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string     :pic
      t.string     :text
      t.string     :diver_lank
      t.integer    :dive_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
