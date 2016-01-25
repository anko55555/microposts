class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    
    # 名前
    validates :name, presence: true, length: { maximum: 50 }
    # email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
    has_secure_password
    
    # area
    validates :area, presence: true, length: { maximum: 30 }, on: :update
    # profile
    validates :profile, length: { maximum: 500 }
end
