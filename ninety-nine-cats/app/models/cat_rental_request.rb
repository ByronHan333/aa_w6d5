# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :bigint           not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
  validates :cat_id, :state_date, :end_date, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED), message: "%{value} is not a valid status"}

  belongs_to :cat,
  inverse_of :requests

  def overlapping_requests
    CatRentalRequest.where("end_date < start_date")
  end
end
