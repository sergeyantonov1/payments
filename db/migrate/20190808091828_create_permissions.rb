class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :kind, null: false, default: :user
      t.belongs_to :user, null: false
      t.string :permitted_actions, null: false
    end

    add_index :permissions, %i[kind user_id], unique: true
  end
end
