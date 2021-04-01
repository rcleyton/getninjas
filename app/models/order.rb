class Order < ApplicationRecord
  belongs_to :profile
  validates :question_1, :question_2, :question_3, presence: true
  # validates :question_1, presence: { message: "Categoria não pode ficar em branco" }
  # validates :question_2, presence: { message: "Subcategoria não pode ficar em branco"}
  # validates :question_3, presence: { message: "Detalhes não pode ficar em branco" }

  after_save :update_geolocation_async

  def update_geolocation_async
    OrdersJob.perform_later(id)
  end
end
