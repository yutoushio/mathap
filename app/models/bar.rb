# -*- coding: utf-8 -*-
class Bar < ApplicationRecord
  has_many :bar_numbers, dependent: :destroy
  has_many :memories, dependent: :destroy
  validates :title, presence: true, length: {minimum: 2 , message: '短すぎます'}
  validates :body, presence: true

end
