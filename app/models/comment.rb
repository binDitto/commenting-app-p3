class Comment < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
end
