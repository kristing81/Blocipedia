class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :roles
  has_many :wikis, through: :roles

  has_many :invoices
  
  def make_premium
    self.update_attribute(:premium, true)
  end 

  def collaborator?
   role == 'collaborator'
  end
 
 def premium_user?
   role == 'premium_user'
 end

 def admin?
  role == 'admin'
 end
end
