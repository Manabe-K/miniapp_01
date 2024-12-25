class SakeTag < ApplicationRecord
  belongs_to :sake
  belongs_to :tag
end
