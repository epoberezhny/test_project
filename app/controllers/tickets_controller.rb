class TicketsController < ApplicationController
  def index
    run Tickets::Operations::Index

    @pagy = result[:pagy]
  end
end
