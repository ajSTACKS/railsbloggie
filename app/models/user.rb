class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # you have to be human email sent, locks the user out given the number of times logged try, time out a user by default, integrate third party logged in via fb twitt,telegram etc. you have to do customization in all of these
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
