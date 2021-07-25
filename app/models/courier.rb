class Courier < ApplicationRecord
  has_many :packages

  validates_presence_of :name, :email
end
