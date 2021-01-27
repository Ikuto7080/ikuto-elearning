class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6}

  has_many :lessons, dependent: :destroy

  
    
    # Followed Users
    has_many :active_relationships, foreign_key: "follower_id",
    class_name: "Relationship",
    dependent: :destroy

    # user.active_relationships.followed_id -> user.followed_users
    has_many :followed_users, through: :active_relationships, source: :followed

    # Followers
    has_many :passive_relationships, foreign_key: "followed_id", # no conflict because they have different FK
                                    class_name: "Relationship", #able to use the same table
                                    dependent: :destroy

    has_many :followers, through: :passive_relationships, source: :follower



    def following?(other_user)
      active_relationships.find_by(followed_id: other_user.id)  
    end
    
    def follow(other_user)
      active_relationships.create!(followed_id: other_user.id)
    end
    
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end


  
end
