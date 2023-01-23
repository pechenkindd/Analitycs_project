FactoryBot.define do
  factory :comment do
    user_email { "MyString" }
    body { "MyText" }
  end

	factory(:user) do
		email { "jane.doe@hey.com" }
		password { "SecretPassword123" }
	end
end