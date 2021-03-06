class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Pedido criado com sucesso"
      redirect_to @order
    else
      flash.now[:error] = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:question_1, :question_2, :question_3,
                                  :response, :latitude, :longitude, :profile_id)
  end
end