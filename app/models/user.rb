class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :unicorns, dependent: :destroy

  has_one_attached :photo

  validates :pseudo, presence: true, uniqueness: { case_sensitive: false }

end
