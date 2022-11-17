class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_record_form = PurchaseRecordForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new(purchase_record_params)
    if @purchase_record_form.valid?
      @purchase_record_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_record_params
    params.require(:purchase_record_form).permit(:post_code, :delivery_area_id, :municipalities, :house_number, :building, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
