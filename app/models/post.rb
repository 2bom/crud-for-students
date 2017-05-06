class Post < ActiveRecord::Base
    has_many :comments
    
    validates :email, presence: true
    validates :title, presence: true
    validates :content, presence: true
end
