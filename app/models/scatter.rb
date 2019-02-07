# -*- coding: utf-8 -*-
class Scatter < ApplicationRecord
  has_many :scat_numbers, dependent: :destroy
  has_many :scata_numbers, dependent: :destroy
  validates :title, presence: true, length: {minimum: 2 , message: '短すぎます'}
  validates :body, presence: true
end
