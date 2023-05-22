class Line < ApplicationRecord
  has_many :train_lines
  has_many :trains, through: :train_lines
  enum status: { available:0, engaged:1 }   
end
