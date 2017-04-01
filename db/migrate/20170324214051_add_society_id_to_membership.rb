class AddSocietyIdToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :society_id, :integer
  end
end
