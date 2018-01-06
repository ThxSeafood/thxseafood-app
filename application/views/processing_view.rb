# frozen_string_literal: true

module ThxSeafood
  module Views
    # View object to capture progress bar information
    class ProcessingView
      def initialize(result)
        @result = result
      end

      def ws_channel_id
        JSON.parse(@result.message)['message']['id']
      end

      def ws_host
        App.config.API_HOST
      end
    end
  end
end
