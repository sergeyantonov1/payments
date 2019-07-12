class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token
      t.string :secret
      t.boolean :expires
      t.datetime :expires_at
      t.belongs_to :user, null: false
    end

    add_index :providers, [:provider, :uid], unique: true
  end
end
