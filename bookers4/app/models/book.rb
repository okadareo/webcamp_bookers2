class Book < ApplicationRecord
  # Adds: Associations 1(User):N(Book)
  belongs_to :user

  # Varidation
  validates :title,
            presence: true
  validates :body,
            presence: true,
            length: { minimum: 0, maximum: 200 }
end
