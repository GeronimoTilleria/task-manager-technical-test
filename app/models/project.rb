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
    return 0 if tasks.empty?
    completed = tasks.where(done: true).size
    ((completed.to_f / tasks.count) * 100).round
  end
  
end
