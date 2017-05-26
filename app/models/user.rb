class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         has_many :topics
         has_many :bookmarks, dependent: :destroy
         has_many :likes, dependent: :destroy

         protected
         def confirmation_required?
           false
         end

end
