class Client < ApplicationRecord
    has_many :projects, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    before_destroy :check_for_active_projects

    private
    def check_for_active_projects
        if projects.where(status: "active").exists?
            errors.add(:base, "Cannot delete client with active projects")
            throw :abort
        end
  end
end
