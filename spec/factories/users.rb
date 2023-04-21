FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' +Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    chinese_first         {person.first.kanji }
    chinese_last          {person.last.kanji }
    kana_first            {person.first.katakana }
    kana_last             {person.last.katakana }
    birth                 {Faker::Date.birthday} 
  end
  
end