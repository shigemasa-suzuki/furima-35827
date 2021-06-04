class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true,format: { with:/\A[一-龥ぁ-ん]/} do
         validates :first_name
         validates :last_name
         end

         with_options presence: true,format: { with:/\A[ァ-ヶー－]+\z/} do
         validates :first_name_kana
         validates :last_name_kana
         end

         with_options presence: true do
         validates :nickname
         validates :birthday
        end

        with_options presence: true,format: { with:/\A[a-zA-Z0-9]+\z/} do
          validates :password
         end
end
