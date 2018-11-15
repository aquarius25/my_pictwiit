class RemoveNameFromTwiits < ActiveRecord::Migration
  def change
    remove_column :twiits, :name, :string
  end
end
