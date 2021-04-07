require 'rails_helper'

feature 'Professional accesses orders' do
  scenario 'successfully' do
    professional = create(:user, :professional)
    order = create(:order, latitude: -23.7171973, longitude: -46.8483318,
                    response: 'Sucesso')
    profile = create(:profile)

    login_as professional, scope: :user
    visit dashboard_path

    click_on 'Serviço automotivo'

    expect(page).to have_content(profile.name)
    expect(page).to have_content(profile.phone)
    expect(page).to have_content(profile.city)
    expect(page).to have_content(profile.neighborhood)
    expect(page).to have_content(profile.street)
    expect(page).to have_content(profile.zip_code)
    expect(page).to have_content(profile.state)
    expect(page).to have_content(order.question_1)
    expect(page).to have_content(order.question_2)
    expect(page).to have_content(order.question_3)
    expect(page).to have_content(order.response)
    expect(page).to have_content(order.latitude)
    expect(page).to have_content(order.longitude)
  end
end