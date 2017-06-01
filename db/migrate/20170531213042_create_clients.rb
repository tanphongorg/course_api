class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name, index: true
      t.string :domain
      t.string :password_digest

      t.timestamps
    end
  end
end
