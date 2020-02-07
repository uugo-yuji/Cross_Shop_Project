# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all

  has_many :board_tag_relations, dependent: :delete_all
  has_many :tags, through: :board_tag_relations

  has_many :board_area_relations, dependent: :delete_all
  has_many :areas, through: :board_area_relations

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
