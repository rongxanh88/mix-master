class ChangePlaylists < ActiveRecord::Migration[5.1]
  def change
    remove_column :playlists, :list
    add_column :playlists, :name, :text
  end
end
