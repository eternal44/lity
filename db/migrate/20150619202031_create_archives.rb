class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :lift_name
      t.integer :lift_weight
      t.string :video_link

      t.timestamps null: false
    end
  end
end
