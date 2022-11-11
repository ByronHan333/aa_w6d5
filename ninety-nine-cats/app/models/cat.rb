class Cat < ApplicationRecord

  CAT_COLORS = ['black', 'brown', 'white']

  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: {in: %w(F M), message: "%{value} is not a valid sex"}
  validates :color, inclusion: { in: CAT_COLORS, message: "%{value} is not a valid color" }
  validate :birth_date_cannot_be_future

  def birth_date_cannot_be_future
    if birth_date > Date.today
      errors.add(:birth_date, "birth date cannot be future" )
    end
  end

end
