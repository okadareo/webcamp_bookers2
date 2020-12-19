class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Adds: Associations 1(User):N(Book)
  has_many :books, dependent: :destroy

  # Adds:
  attachment :profile_image

  # Adds: except email from devise
  # COMMENT OUT V
  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end
  # COMMENT OUT ^

  # Varidation

  validates :name,
    uniqueness: true,
    presence: true,
    length: { minimum: 2, maximum: 20 }
  validates :introduction,
            length: { maximum: 50 }
end
