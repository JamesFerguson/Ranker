Factory.define :user do |u|
  u.email { Forgery::Internet.email_address }
  u.password  { "1234567890" }
  u.password_confirmation { "1234567890" }
end