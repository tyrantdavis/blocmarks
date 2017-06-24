class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:amazon]

         def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.provider = auth.provider
             user.uid = auth.uid
             user.email = auth.info.email
             user.password = Devise.friendly_token[6, 20]
           end
         end

         has_many :topics, dependent: :destroy
         has_many :likes, dependent: :destroy

         # Virtual attribute for authenticating by either username or email
         # This is in addition to a real persisted field like 'username'
         attr_accessor :login


         before_save {self.role ||= :user}

         enum role: [:user, :admin]


         def liked(bookmark)
           likes.where(bookmark_id: bookmark.id).first
         end

         protected
         def confirmation_required?
           false
         end

end
