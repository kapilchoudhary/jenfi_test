class Parcel < ApplicationRecord
  belongs_to :user
  belongs_to :train, optional: true
  validates :weight, :volume, numericality: true
  validate :check_user, on: :create

  enum status: { to_be_shipped:0, shipping:1, shipped:2, withdrawn:3 }

  def check_user
    unless User.find(user_id).role == "parcel_owner"
      errors.add(:base, "You have not access to submit parcel!")
    end
  end
end
