class PurchaseRecordsController < ApplicationController

  def index
    @purchase_record = PurchaseRecordForm.new
  end




end
