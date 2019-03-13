class Address < ApplicationRecord
  belongs_to :country
  belongs_to :addressable, polymorphic: true

  validates :country, presence: true

  def to_s
    "#{type}: #{country}, #{city}"
  end
end
