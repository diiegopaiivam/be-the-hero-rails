class Incident < ApplicationRecord
  validates :title, :description, :value, :ong, presence: true
  belongs_to :ong
end
