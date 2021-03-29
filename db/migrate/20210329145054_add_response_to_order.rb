class AddResponseToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :response, :string
  end
end
