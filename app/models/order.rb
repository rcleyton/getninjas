class Order < ApplicationRecord
  belongs_to :profile

  after_save :update_geolocation_async

  def update_geolocation_async
    OrdersJob.perform_later(id)
  end
end
