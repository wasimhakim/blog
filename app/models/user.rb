class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :timeoutable, :trackable

  # 
  # Associations
  # 
  has_one :page
  has_many :posts

  # 
  # methods
  # 
  def admin?
    false
  end

end
