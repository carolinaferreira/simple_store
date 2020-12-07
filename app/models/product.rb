class Product < ApplicationRecord
    validates :cost, presence: true
    validates :name, length: { minimum: 4}
end
