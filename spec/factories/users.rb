FactoryBot.define do

  factory :user do
    nickname              {"タカ"}
    email                 {"kkk@gmail.com"}
    password              {"1234qwer"}
    password_confirmation {"1234qwer"}
    last_name             {"宮本"}
    first_name            {"隆史"}
    kana_last_name        {"ミヤモト"}
    kana_first_name       {"タカシ"}
    birth_date            {"2020-03-13"}
  end

end