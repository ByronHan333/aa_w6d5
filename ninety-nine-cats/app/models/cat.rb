# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not nu

  has_many :requests,
  dependent: :destroy
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord

  CAT_COLORS = ['black', 'brown', 'white']

  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: {in: %w(F M), message: "%{value} is not a valid sex"}
  validates :color, inclusion: { in: CAT_COLORS, message: "%{value} is not a valid color" }
  validate :birth_date_cannot_be_future

  def birth_date_cannot_be_future
    if birth_date.nil? || birth_date > Date.today
      errors.add(:birth_date, "birth date cannot be future" )
    end
  end

end
