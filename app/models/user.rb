class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable
  
  has_many :resources, dependent: :destroy
  has_many :messages
  has_many :comments, dependent: :destroy
  has_many :parents
  has_many :students, through: :parents
end
