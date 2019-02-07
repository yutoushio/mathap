class Memory < ApplicationRecord
  belongs_to :bar
  validates :body,presence: true
end
