class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.text :headline
      t.text :category
      t.text :creator
      t.text :img

      t.timestamps
    end
  end
end
