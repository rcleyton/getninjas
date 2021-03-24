class OrdersJob < ApplicationJob
  queue_as :default

  def perform(id)
    sleep 15
    order = Order.find(id)
    city = order.profile.city
    state = order.profile.state
    address = [city, state].compact.join(', ')
    results = Geocoder.search(address)
    lat_lon = results.first.coordinates
    order.latitude = lat_lon[0]
    order.longitude = lat_lon[1]
    order.save
  end
end
