class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true

  def overdue?
    due_date.present? &&
    due_date < Date.today &&
    !done?
  end
end
