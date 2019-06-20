class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #  :lockable = the ability to lock an ID based on defined criteria such as too many consecutive login fails
  #  :omniauthable  is used to enable 3rd party authentications
  # created by command:     Bills-iMac:DevcampPortfolio williamfuson$ rails g devise:views
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end