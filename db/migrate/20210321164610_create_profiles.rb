class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :zip_code
      t.string :state

      t.timestamps
    end
  end
end
