class Ticket < ApplicationRecord
  belongs_to :project

  STATUSES = [ "Open", "In Progress", "Resolved" ].freeze
  PRIORITIES = [ "Low", "Medium", "High", "Critical" ].freeze

  validates :title, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :priority, inclusion: { in: PRIORITIES }
end
