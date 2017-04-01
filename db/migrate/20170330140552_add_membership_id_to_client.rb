class AddMembershipIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :membership_id, :integer
  end
end
