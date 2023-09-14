class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #def self.find_for_authentication(conditions)
  #  p "MY AUTH KEY"
  #  p authentication_keys
  #    conditions = ["username = ? or email = ?", conditions[authentication_keys.first], conditions[authentication_keys.first]]
  #      # raise StandardError, conditions.inspect
  #       super
  # end
      #
 def self.findname(x)
       where("parameterize(username) like ?",x)[0]
         end
  has_many :myfavs
end
