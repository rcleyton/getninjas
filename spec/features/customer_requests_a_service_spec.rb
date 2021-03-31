require 'rails_helper'

feature 'Customer requests a service' do
  xscenario 'successfully' do
    customer = create(:user, :customer)
    order = create(:order)

    login_as customer, scope: :user
    visit dashboard_path
    click_on 'Solicitar orçamento'

    fill_in 'Informe a categoria do serviço', with: order.question_1
    fill_in 'Informe a subcategoria do serviço', with: order.question_2
    fill_in 'Informe os detalhes do serviço', with: order.question_3
    click_on 'Criar'

    expect(page).to have_content(order.question_1)
    expect(page).to have_content(order.question_3)
    expect(page).to have_content(order.question_3)
  end
end