class User < ApplicationRecord
  enum status: { active: 'active', inactive: 'inactive' }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true, comparison: { less_than: Date.today }

end
