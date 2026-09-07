class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  def index
    @tickets = Ticket.includes(:project).order(created_at: :desc)

    if params[:query].present?
      search = "%#{Ticket.sanitize_sql_like(params[:query])}%"
      @tickets = @tickets.where(
        "tickets.title LIKE ? OR tickets.description LIKE ?",
        search,
        search
      )
    end

    @tickets = @tickets.where(status: params[:status]) if params[:status].present?
    @tickets = @tickets.where(priority: params[:priority]) if params[:priority].present?

    @total_count = Ticket.count
    @open_count = Ticket.where(status: "Open").count
    @progress_count = Ticket.where(status: "In Progress").count
    @resolved_count = Ticket.where(status: "Resolved").count
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: "Ticket was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy!
    redirect_to tickets_path, notice: "Ticket was successfully destroyed.", status: :see_other
  end

  private

  def set_ticket
    @ticket = Ticket.find(params.expect(:id))
  end

  def ticket_params
    params.expect(ticket: [
      :title,
      :description,
      :status,
      :priority,
      :due_date,
      :project_id
    ])
  end
end
