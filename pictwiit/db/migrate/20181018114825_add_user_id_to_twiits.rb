class AddUserIdToTwiits < ActiveRecord::Migration
  def change
    add_column :twiits, :user_id, :integer
  end
end
