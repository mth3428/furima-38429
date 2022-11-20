require 'rails_helper'

RSpec.describe PurchaseRecordForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_form = FactoryBot.build(:purchase_record_form, user_id: user.id, item_id: item.id)
  end
  
  describe "配送先情報の保存" do
    context "配送先情報が保存できるとき" do
      it "全ての項目が正しく入力されている時" do
        expect(@purchase_record_form).to be_valid
      end
      it "建物名が空でも保存できる" do
        @purchase_record_form.building = nil
        expect(@purchase_record_form).to be_valid
      end
    end

    context "配送先情報が保存できないとき" do
      it "user_idが紐づいていなければ保存できない" do
        @purchase_record_form.user_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "User can't be blank"
      end
      it "item_idが紐づいていなければ保存できない" do
        @purchase_record_form.item_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Item can't be blank"
      end
      it "郵便番号が空だと保存できない" do
        @purchase_record_form.post_code = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Post code can't be blank"
      end
      it "郵便番号にハイフンがなければ保存できない" do
        @purchase_record_form.post_code = 1112222
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Post code is invalid"
      end
      it "発送先の住所が空だと保存できない" do
        @purchase_record_form.delivery_area_id = 1
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Delivery area must be other than 1"
      end
      it "配送先の市区町村が空だと保存できない" do
        @purchase_record_form.municipalities = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Municipalities can't be blank"
      end
      it "配送先の番地が空だと保存できない" do
        @purchase_record_form.house_number = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "House number can't be blank"
      end
      it "配送先の電話番号が空だと保存できない" do
        @purchase_record_form.telephone_number = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Telephone number can't be blank"
      end
      it "配送先の電話番号にハイフンがあると保存できない" do
        @purchase_record_form.telephone_number = 000-1111-1111
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Telephone number is invalid"
      end
      it "配送先の電話番号が12桁以上あると保存できない" do
        @purchase_record_form.telephone_number = 000111122223
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include "Telephone number is invalid"
      end
    end
  end
  


end
