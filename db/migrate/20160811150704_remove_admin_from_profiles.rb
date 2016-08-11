class RemoveAdminFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :admin, :boolean
  end
end
