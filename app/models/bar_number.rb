class BarNumber < ApplicationRecord
  belongs_to :bar
    validates :number, presence: true
end
