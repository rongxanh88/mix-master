class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.integer :list

      t.timestamps
    end

    add_reference :playlists, :song, foreign_key: true
  end
end
