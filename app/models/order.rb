class Order < ActiveRecord::Base
  belongs_to :users
  has_many :orders
  belongs_to :name, class_name: "User"
  belongs_to :email,   class_name: "User"

  validate :name , presence: true
  validate :email ,   presence: true

end
