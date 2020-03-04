module Tickets
  module Operations
    class Create < Trailblazer::Operation
      step Model(Ticket, :new)
      step Contract::Build(constant: Tickets::Contracts::Create)
      step :transform_keys_in_params
      step :extract_params
      step Contract::Validate(skip_extract: true)
      step Rescue(ActiveRecord::RecordNotUnique) {
        step Contract::Persist()
      }

      def transform_keys_in_params(ctx, params:, **)
        ctx[:transformed_params] = params.deep_transform_keys { |key| key.to_s.underscore.to_sym }
      end

      def extract_params(ctx, transformed_params:, **)
        ctx['contract.default.params'] = Tickets::Services::MapParams.call(transformed_params)
      end
    end
  end
end
