class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :roles
  has_many :wikis, through: :roles

  has_many :invoices
  
  def make_premium
    self.update_attribute(:premium, true)
  end 
end
