FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user # これによりmessageが作成されるとユーザーのインスタンスも作成される。
    association :room # これによりmessageが作成されるとルームのインスタンスも作成される。

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end