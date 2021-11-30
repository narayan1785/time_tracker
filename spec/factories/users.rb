FactoryBot.define do
  
  factory :user do
    id {1}
    email {"test@user.com"}
    password {"test123"}
    first_name {"Test"}
    last_name {"user"}
  end

  factory :user_new, class: User do
    id {1}
    email {"user_new@user.com"}
    password {"test123"}
    first_name {"user"}
    last_name {"new"}
  end

end

