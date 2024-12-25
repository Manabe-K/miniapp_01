class Tag < ApplicationRecord
  has_many :sake_tags
  has_many :sakes, through: :sake_tags
end
