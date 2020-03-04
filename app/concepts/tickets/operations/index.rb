module Tickets
  module Operations
    class Index < Trailblazer::Operation
      step :get_tickets
      step :paginate

      def get_tickets(ctx, **)
        ctx[:model] = Ticket.all
      end

      def paginate(ctx, model:, params:, **)
        pagy = Pagy.new(count: model.count(:all), page: params[:page], items: params[:items])

        ctx[:pagy] = pagy
        ctx[:model] = model.offset(pagy.offset).limit(pagy.items)
      end
    end
  end
end
