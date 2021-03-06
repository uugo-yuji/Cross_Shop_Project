# == Schema Information
#
# Table name: board_area_relations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  area_id    :integer          not null
#  board_id   :integer          not null
#
# Indexes
#
#  index_board_area_relations_on_area_id   (area_id)
#  index_board_area_relations_on_board_id  (board_id)
#
# Foreign Keys
#
#  area_id   (area_id => areas.id)
#  board_id  (board_id => boards.id)
#

class BoardAreaRelation < ApplicationRecord
  belongs_to :board
  belongs_to :area
end
