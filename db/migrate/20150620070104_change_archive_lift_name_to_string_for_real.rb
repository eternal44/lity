class ChangeArchiveLiftNameToStringForReal < ActiveRecord::Migration
  def change
  	change_column :archives, :lift_name, 'text USING CAST(lift_name AS text)'
  end
end
