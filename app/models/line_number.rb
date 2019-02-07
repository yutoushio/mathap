class LineNumber < ApplicationRecord
  belongs_to :line
  validates :number, presence: true
end
