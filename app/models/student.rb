class Student < ActiveRecord::Base
  belongs_to :dashboard

  validates :first_name, :last_name, :email, presence: true

  def self.with_dashboard student_id
self.joins(:dashboard).where("students.id = ?", student_id).select(:id, :first_name, :last_name, :email, :branch, :dashboard_id, :created_at).first
end

def self.cohort student
self.where("id != ? AND dashboard_id = ? AND DATE(created_at) = ?", student.id, student.dashboard_id, student.created_at.strftime("%Y-%m-%d"))
end


end
