# frozen_string_literal: true

class Beer < ApplicationRecord
  include RatingAverage
  belongs_to :brewery
  has_many :ratings,
           dependent: :destroy
  def to_s
    "#{name} | #{brewery.name}"
  end

  def average
    if ratings.empty?
      return 0
    end

    ratings.map(&:score).sum / ratings.count.to_f
  end
end
