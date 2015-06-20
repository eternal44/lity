class ChangeArchiveLiftNameToString < ActiveRecord::Migration
  def change
  	change_column :archives, :lift_name, :string
  end
end
