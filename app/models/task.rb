class Task < ActiveRecord::Base
  belongs_to :user

  scope :hide_completed, ->{ where(completed: false) }

  def expiration_date
    created_at + 7.days
  end

  def days_remaining
    ((expiration_date - Time.now)/86400).round
  end

  def self.delete_tasks
    where("created_at <= ?", Time.now - 7.days).destroy_all
    where(completed: true).destroy_all
  end

  validates :description, presence: true
end
