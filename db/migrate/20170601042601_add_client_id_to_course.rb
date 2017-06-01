class AddClientIdToCourse < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :client, foreign_key: true
  end
end
