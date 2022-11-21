class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :purchase_record_item, only: [:index, :create]

  def index
    @purchase_record_form = PurchaseRecordForm.new
  end

  def create
    @purchase_record_form = PurchaseRecordForm.new(purchase_record_params)
    if @purchase_record_form.valid?
      pay_item
      @purchase_record_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_record_params
    params.require(:purchase_record_form).permit(:post_code, :delivery_area_id, :municipalities, :house_number, :building, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_record_params[:token],    
      currency: 'jpy'                 
    )
  end

  def purchase_record_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase_record.present?
      redirect_to root_path
    end
  end

end
