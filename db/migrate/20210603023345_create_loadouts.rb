class CreateLoadouts < ActiveRecord::Migration[5.2]
  def change
    create_table :loadouts do |t|
      t.string :type
      t.text :description
      t.string :primary
      t.string :secondary
      t.string :heavy
      t.string :character_class
    end
  end
end
