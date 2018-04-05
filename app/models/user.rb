class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # you have to be human email sent, locks the user out given the number of times logged try, time out a user by default, integrate third party logged in via fb twitt,telegram etc. you have to do customization in all of these
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
