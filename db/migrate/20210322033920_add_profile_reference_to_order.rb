class AddProfileReferenceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :profile, null: false, foreign_key: true
  end
end
