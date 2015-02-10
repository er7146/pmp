class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :carts
  
  validate :name ,   presence: true, uniqueness: true
  validate :email ,   presence: true, uniqueness: true
  
end
