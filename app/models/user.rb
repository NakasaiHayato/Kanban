class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # nameカラムのバリデーション定義。空白禁止と最大20文字制限
  validates :name, presence: true, length: { maximum: 20 }
end
