# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  name       :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :comments
  has_many :board_tag_relations
  has_many :tags, through: :board_tag_relations

  validates :name, presence: true, length: {maximum: 12}
  validates :title, presence: true, length: {maximum: 255}
  validates :body, presence: true, length: {maximum: 1290}
end
