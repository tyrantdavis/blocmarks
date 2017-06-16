class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauthable_providers => [:amazon]

         def self.from_omniauth(auth_data)
           where(provider: auth_data.provider, uid: auth_data.uid).first_or_create do |user|
             user.provider = auth_data.provider
             user.uid = auth_data.uid
             user.email = auth_data.info.email
             user.password = Devise.friendly_token[6, 20]
           end
         end

         has_many :topics, dependent: :destroy
         has_many :bookmarks,  dependent: :destroy
         has_many :likes, dependent: :destroy

         # Virtual attribute for authenticating by either username or email
         # This is in addition to a real persisted field like 'username'
         attr_accessor :login

         before_save {self.email.downcase if email.present?}
         # before_save {self.name.capitalize if name.present?}
         before_save {self.role ||= :user}

         enum role: [:user, :admin]

         # validates :username, length: {minimum: 1, maximum: 100}, presence: true
         validates :email, presence: true, uniqueness: {case_sensitive: false},
         length: {minimum: 3, maximum: 254}
         validates :password, presence: true, length: {minimum: 6}


         def liked(bookmark)
           likes.where(bookmark_id: bookmark.id).first
         end

         protected
         def confirmation_required?
           false
         end

end
