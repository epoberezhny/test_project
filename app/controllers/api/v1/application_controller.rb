module Api
  module V1
    class ApplicationController < ActionController::API
      private

      def _run_params(params)
        params.to_unsafe_h
      end
    end
  end
end
