class OrdersJob < ApplicationJob
  queue_as :default

  def perform(id)
    sleep 15
    order = Order.find(id)
    city = order.profile.city
    neighborhood = order.profile.neighborhood
    address = [neighborhood,city].compact.join(', ')
    results = Geocoder.search(address)

    if results.empty?
      order.response = "Geolocalização não encontrada. Entre em contato com o cliente."
      order.latitude = 0.0
      order.longitude = 0.0
    else
      lat_lon = results.first.coordinates
      order.response = "Sucesso"
      order.latitude = lat_lon[0]
      order.longitude = lat_lon[1]
    end
    
    order.save
  end
end
