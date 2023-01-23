class New < ApplicationRecord
  belongs_to :theme
  has_many :comments
end
