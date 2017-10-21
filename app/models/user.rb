class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :name, presence: true

  has_many :groups, through: :members
  has_many :members
  has_many :messages


  FactoryGirl.define do

  factory :user do
    nickname              "abe"
    email                 "kkk@gmail.com"
    password              "00000000"
    password_confirmation "00000000"
  end

end

end
