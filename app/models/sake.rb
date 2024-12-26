class Sake < ApplicationRecord
  has_many :sake_tags
  has_many :tags, through: :sake_tags

  mount_uploader :label_image, SakeImageUploader
  enum :label_genre, { 指定なし: 0, オシャレ: 1, 文字だけ: 2 }
  enum :prefecture, {
    北海道: 0, 青森県: 1, 岩手県: 2, 宮城県: 3, 秋田県: 4, 山形県: 5,
    福島県: 6, 茨城県: 7, 栃木県: 8, 群馬県: 9, 埼玉県: 10, 千葉県: 11,
    東京都: 12, 神奈川県: 13, 新潟県: 14, 富山県: 15, 石川県: 16, 福井県: 17,
    山梨県: 18, 長野県: 19, 岐阜県: 20, 静岡県: 21, 愛知県: 22, 三重県: 23,
    滋賀県: 24, 京都府: 25, 大阪府: 26, 兵庫県: 27, 奈良県: 28, 和歌山県: 29,
    鳥取県: 30, 島根県: 31, 岡山県: 32, 広島県: 33, 山口県: 34, 徳島県: 35,
    香川県: 36, 愛媛県: 37, 高知県: 38, 福岡県: 39, 佐賀県: 40, 長崎県: 41,
    熊本県: 42, 大分県: 43, 宮崎県: 44, 鹿児島県: 45, 沖縄県: 46
  }
  enum :type_of_sake, {
    大吟醸酒: 0, 吟醸酒: 1, 純米大吟醸: 2, 純米吟醸酒: 3, 特別純米酒: 4,
    純米酒: 5, 特別本醸造酒: 6, 本醸造酒: 7, 普通酒: 8
  }
  validates :prefecture, presence: true
  validates :type_of_sake, presence: true
  validates :price, presence: true
  validates :sake_meter_value, presence: true
  validates :label_genre, presence: true

  scope :within_sake_meter_value_range, ->(min, max) { where(sake_meter_value: min..max) }
end
