require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
     user = build(:user, nickname: "")
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
     user = build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
     user = build(:user, password: "")
     user.valid?
     expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a last_name" do
     user = build(:user, last_name: "")
     user.valid?
     expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
     user = build(:user, first_name: "")
     user.valid?
     expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a kana_last_name" do
     user = build(:user, kana_last_name: "")
     user.valid?
     expect(user.errors[:kana_last_name]).to include("を入力してください")
    end

    it "is invalid without a kana_first_name" do
     user = build(:user, kana_first_name: "")
     user.valid?
     expect(user.errors[:kana_first_name]).to include("を入力してください")
    end

    it "is invalid without a birth_date" do
     user = build(:user, birth_date: "")
     user.valid?
     expect(user.errors[:birth_date]).to include("を入力してください")
    end
    
    

  end
end

# :nickname,              null: false
#     :email,              null: false, default: ""
#     :encrypted_password, null: false, default: ""
#       :last_name, null: false
#       :first_name, null: false
#       :kana_last_name, null: false
#       :kana_first_name, null: false
#       :birth_date,