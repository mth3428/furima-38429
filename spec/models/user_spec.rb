require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザーの新規登録" do
    context "登録ができるとき" do
      it '全ての項目が正しく入力されている時' do
        expect(@user).to be_valid
      end
    end
    context "登録ができないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "@が含まれていないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it "passwordが一致していないと登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "123abc"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが全角だと登録できない" do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "family_nameが空だと登録はできない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it "family_nameが半角文字が含まれている場合は登録できない" do
        @user.family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it "first_nameが空だと登録はできない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "first_nameが半角文字が含まれている場合は登録できない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "family_name_kanaが空だと登録はできない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it "family_name_kanaがカタカナ以外の文字が含まれていると登録できない" do
        @user.family_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
      it "first_name_kanaが空だと登録はできない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "first_name_kanaがカタカナ以外の文字が含まれていると登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "birthdayが空だと登録はできない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
