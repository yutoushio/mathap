# -*- coding: utf-8 -*-
class Line < ApplicationRecord
  has_many :line_numbers, dependent: :destroy
  has_many :line_memories, dependent: :destroy
  validates :title, presence: true, length: {minimum: 2 , message: '短すぎます'}
  validates :body, presence: true
end
