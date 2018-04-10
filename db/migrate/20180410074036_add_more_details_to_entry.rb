class AddMoreDetailsToEntry < ActiveRecord::Migration[5.1]
  def up
    add_column :entries, :sunset, :integer
    add_column :entries, :sunrise, :integer
    add_column :entries, :icon, :string
    add_column :entries, :clouds, :string
    add_column :entries, :main, :string
  end

  def down
    drop_column :entries, :sunset
    drop_column :entries, :sunrise
    drop_column :entries, :icon
    drop_column :entries, :clouds
    drop_column :entries, :main
  end
end
