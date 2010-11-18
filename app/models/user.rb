class User < ActiveRecord::Base
  # Include chosen devise modules. Others available are:
  # :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable

  # The only attributes we expect from a form, others will be protected by default.
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
