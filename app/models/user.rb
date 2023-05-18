class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :parcels
  has_many :trains
  enum role: { parcel_owner:0, train_operator:1, post_master:2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
