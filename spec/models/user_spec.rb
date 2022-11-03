require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザーの新規登録" do
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
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password"
    end
    it "family_nameが空だと登録はできない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank", "Family name is invalid"
    end
    it "first_nameが空だと登録はできない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
    end
    it "family_name_kanaが空だと登録はできない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank", "Family name kana is invalid"
    end
    it "first_name_kanaが空だと登録はできない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana is invalid"
    end
    it "birthdayが空だと登録はできない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank", "Birthday is invalid"
    end
  end
end
