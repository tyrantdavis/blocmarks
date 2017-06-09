class Bookmark < ActiveRecord::Base
  belongs_to :topic
  delegate :user, to: :topic

  has_many :likes, dependent: :destroy

end
