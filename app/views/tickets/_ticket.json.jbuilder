json.extract! ticket, :id, :title, :description, :status, :priority, :due_date, :project_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
