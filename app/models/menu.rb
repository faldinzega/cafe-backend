class Menu < ApplicationRecord
  has_many :orders, dependent: :destroy
end
