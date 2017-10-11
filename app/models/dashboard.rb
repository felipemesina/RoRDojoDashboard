class Dashboard < ActiveRecord::Base
  validates :branch, :street, :city, :state, presence: true
  validates :state, length: { is: 2 }
  has_many :students, dependent: :destroy
end
