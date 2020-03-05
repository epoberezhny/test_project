class TicketsController < ApplicationController
  def index
    run Tickets::Operations::Index

    @pagy = result[:pagy]
  end

  def show
    run Tickets::Operations::Show

    if result.success?
      @ticket = result[:model]
    else
      redirect_to action: :index
    end
  end
end
