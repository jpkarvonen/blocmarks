class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :title, length: { minimum: 1, maximum: 100 }, presence: true
end
