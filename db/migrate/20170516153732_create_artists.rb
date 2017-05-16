class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.text :name
      t.text :image_path

      t.timestamps
    end
  end
end
