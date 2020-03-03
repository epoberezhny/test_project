module Tickets
  module Services
    class MapParams
      def self.call(*args)
        new(*args).call
      end

      def initialize(params)
        @params = params.dup
      end

      def call
        map_param(from: %i[date_times response_due_date_time], to: :response_due_date_time)
        map_param(from: %i[service_area primary_service_area_code sa_code], to: :primary_service_area_code)
        map_param(from: %i[service_area additional_service_area_codes sa_code], to: :additional_service_area_codes)
        map_param(from: %i[excavation_info digsite_info well_known_text], to: :well_known_text)
        map_excavator_address

        @params
      end

      private

      def map_param(from:, to:, default: nil)
        return if @params.key?(to)

        @params[to] = @params.dig(*from) || default
      end

      def map_excavator_address
        excavator_params = @params[:excavator] || {}
        full_address = [
          excavator_params[:address],
          excavator_params[:city],
          excavator_params[:state],
          excavator_params[:zip]
        ].compact.join(', ')

        @params[:excavator] ||= {}
        @params[:excavator][:full_address] = full_address
      end
    end
  end
end
