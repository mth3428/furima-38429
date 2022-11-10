require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    context "出品できるとき" do
      it "全ての項目が正しく入力されている時" do
        expect(@item).to be_valid
      end
    end
    context "出品できないとき" do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名がないと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "商品の説明がないと出品できない" do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it "カテゴリーが空だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "商品の状態が状態が空だと出品できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition must be other than 1"
      end
      it "配送料の負担が空だと出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge must be other than 1"
      end
      it "発送元の地域が空だと出品できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area must be other than 1"
      end
      it "発送までの日数が空だと出品できない" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date must be other than 1"
      end
      it "販売価格が空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "販売価格が300円より下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "販売価格が9999999円より大きいと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "ユーザーが紐づいていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
