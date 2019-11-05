class MerchandisesController < ApplicationController
  
  def index
    #最大10件表示する
    @merchandises = Merchandise.order(created_at: "DESC").limit(10)
  end

  def show
    @merchandise = Merchandise.find(merchandise_params[:id])
    @comment = Comment.new()
  end


  def merchandise_params
    params.permit(:id)
  end


end
