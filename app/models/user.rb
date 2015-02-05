class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :orders ,
    class_name: "Orders", foreign_key: "user_id"
  has_many :order_type ,
    class_name: "orders", foreign_key: "type"

  validate :name ,   presence: true, uniqueness: true
  #validate :email ,   presence: true, uniqueness: true
  
end
