class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

         has_many :items
         has_many :orders
         has_many :messages
         has_one :street
         has_many :sns_credentials
         has_one :card, dependent: :destroy

         def self.from_omniauth(auth)
          sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
          user = User.where(email: auth.info.email).first_or_initialize(
            nickname: auth.info.name,
              email: auth.info.email
          )
          if user.persisted?
            sns.user = user
            sns.save
          end
          { user: user, sns: sns }
         end

         with_options presence: true,format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/
          } do
         validates :first_name
         validates :last_name
         end

         with_options presence: true,format: { with:/\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/} do
         validates :first_name_kana
         validates :last_name_kana
         end

         with_options presence: true do
         validates :nickname
         validates :birthday
        end

    
        validates :password,format: { with:/(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/} 
      
end
