class CreateLoadouts < ActiveRecord::Migration[5.2]
  def change
    create_table :loadouts do |t|
      t.string :title
      t.text :description
      t.string :character_class
      t.string :primary
      t.string :secondary
      t.string :heavy
      
    end
  end
end
