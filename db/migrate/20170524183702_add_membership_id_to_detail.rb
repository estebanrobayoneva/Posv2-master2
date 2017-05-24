class AddMembershipIdToDetail < ActiveRecord::Migration
  def change
    add_column :details, :membership_id, :integer
  end
end
