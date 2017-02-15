class Comment < ApplicationRecord
  belongs_to :user
  def self.search(search)
    where("body LIKE ?", "%#{search.downcase}%")

  end
  validates :body, presence: true, length: { maximum: 300 }
end
