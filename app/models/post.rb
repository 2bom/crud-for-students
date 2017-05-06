class Post < ActiveRecord::Base
    has_many :comments
    
    validates :email, :presence => { :message => "오류 - 이메일을 입력해주세요." }, format: { with: /@likelion.org/, message: "오류 - 멋쟁이 사자처럼 이메일을 입력해주세요." }
    validates :title, :presence => { :message => "오류 - 글 제목을 입력해주세요." }
    validates :content, :presence => { :message => "오류 - 글 내용을 입력해주세요." }
end
