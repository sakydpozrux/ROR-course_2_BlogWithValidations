class Micropost < ActiveRecord::Base
  validates :title, { presence: true,
                      length: { maximum: 24} }
  validates :content, { presence: true,
                        length: { in: 20..140 } }
end
