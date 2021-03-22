class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :question_1
      t.string :question_2
      t.string :question_3
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
