class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :released_on, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: RATINGS }
end
