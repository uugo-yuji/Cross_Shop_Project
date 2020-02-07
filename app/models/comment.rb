# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#
# Foreign Keys
#
#  board_id  (board_id => boards.id)
#

class Comment < ApplicationRecord
  belongs_to :board

  validates :comment, presence: true, length: { maximum: 1000 }
end
