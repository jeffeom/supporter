class Request < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :department, presence: true
end
