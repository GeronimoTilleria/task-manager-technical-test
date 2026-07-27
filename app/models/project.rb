class Project < ApplicationRecord
  belongs_to :client

  has_many :tasks, dependent: :destroy

  enum :status, {
    active: "active",
    paused: "paused",
    completed: "completed"
  }

  validates :title, presence: true
  validates :status, presence: true

  def progress_percentage
    total_tasks = tasks.count

    return 0 if total_tasks.zero?

    completed = tasks.where(done: true).count
    ((completed.to_f / total_tasks) * 100).round
  end
  
end
