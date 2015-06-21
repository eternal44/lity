class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :group_role

      t.timestamps null: false
    end
  end
end
