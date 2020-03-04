module Tickets
  module Operations
    class Show < Trailblazer::Operation
      step Model(Ticket, :find_by)
      step :decorate

      def decorate(ctx, model:, **)
        ctx[:model] = Tickets::Decorators::Show.new(model)
      end
    end
  end
end
