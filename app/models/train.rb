class Train < ApplicationRecord
  has_many :parcels
  has_many :train_lines
  has_many :lines, through: :train_lines
  belongs_to :users, optional: true

  validates :name, presence: true
  validates :total_weight, :total_volume, :cost, numericality: true
  validate :check_user, on: :create

  enum status: { available:0, booked:1, left:2, arrived:3, withdrawn: 4}   

  def check_user
    unless  self.user.role == "train_operator"
      errors.add(:base, "You have not access to create a train!")
    end
  end
end
