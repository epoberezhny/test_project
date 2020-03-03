module Api
  module V1
    class TicketsController < ApplicationController
      def create
        run Tickets::Operations::Create

        if result.success?
          render json: result[:model], include: :excavator, status: :created
        else
          render json: { errors: result['contract.default'].errors.messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
