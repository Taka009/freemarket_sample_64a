require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with nickname, email, password, last_name, firstname, kana_last_name, kana_first_name, birth_date" do
      user = build(:user)
      expect(user).to be_valid
     end

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

    # password, password_confirmationに関するバリデーションは、deviseのデフォルト機能として
    # 用意されているので、ファイル上に記述はないが、テストは必ず行う。
    it "is invalid without a password" do
     user = build(:user, password: "")
     user.valid?
     expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
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

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a email which does not have @" do
      user = build(:user, email: "test.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with a email which does not have domain" do
      user = build(:user, email: "test@")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is valid with a full-width last_name" do
      user = build(:user, last_name: "あア亜")
      expect(user).to be_valid
    end

    it "is invalid with a last_name which contains half-width character" do
      user = build(:user, last_name: "アｱ亜")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "is valid with a full-width first_name" do
      user = build(:user, first_name: "いイ井")
      expect(user).to be_valid
    end

    it "is invalid with a first_name which contains half-width character" do
      user = build(:user, first_name: "イｲ井")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end



    it "is valid with a full-width kana_last_name" do
      user = build(:user, kana_last_name: "ア")
      expect(user).to be_valid
    end

    it "is invalid with a kana_last_name which contains any other character" do
      user = build(:user, kana_last_name: "ア亜")
      user.valid?
      expect(user.errors[:kana_last_name]).to include("は不正な値です")
    end

    it "is valid with a full-width kana_first_name" do
      user = build(:user, kana_first_name: "イ")
      expect(user).to be_valid
    end

    it "is invalid with a kana_first_name which contains any other character" do
      user = build(:user, kana_first_name: "イ井")
      user.valid?
      expect(user.errors[:kana_first_name]).to include("は不正な値です")
    end

    it "is valid with a password which has more than 7 characters" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end

    it "is invalid with a password which has less than 6 characters" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

  end
end

