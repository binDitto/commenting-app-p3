class Comment < ApplicationRecord
  belongs_to :user
  def self.search(search)
    where("body LIKE ?", "%#{search}%")
  
  end
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
end
