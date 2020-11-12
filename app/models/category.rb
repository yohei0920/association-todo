class Category < ApplicationRecord
    has_many :todos, dependent: :destroy
    validates :title, presence: true
end
