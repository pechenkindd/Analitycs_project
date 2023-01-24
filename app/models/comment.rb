class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :new

  validates :body, presence: {
    message: 'не может быть пустым'
  }

end
