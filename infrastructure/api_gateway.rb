# frozen_string_literal: true

require 'http'

module ThxSeafood
  class ApiGateway
    class ApiResponse
      HTTP_STATUS = {
        200 => :ok,
        201 => :created,
        202 => :processing,
        204 => :no_content,

        403 => :forbidden,
        404 => :not_found,
        400 => :bad_request,
        409 => :conflict,
        422 => :cannot_process,

        500 => :internal_error
      }.freeze

      attr_reader :status, :message

      def initialize(code, message)
        @code = code
        @status = HTTP_STATUS[code]
        @message = message
      end

      def ok?
        HTTP_STATUS[@code] == :ok
      end

      def processing?
        HTTP_STATUS[@code] == :processing
      end
    end

    def initialize(config = ThxSeafood::App.config)
      @config = config
    end

    def all_jobs
      call_api(:get, 'jobs')
    end

    def jobs(jobname)
      call_api(:get, ['jobs', jobname])
    end

    def create_jobs(jobname)
      call_api(:post, ['jobs', jobname])
    end

    def delete_all_jobs
      call_api(:delete, 'jobs')
    end

    def get_top_jobs(topnum)
      call_api(:get, ['hot', topnum])
    end


    def call_api(method, resources)
      url_route = [@config.API_HOST, @config.API_VER, resources].flatten.join'/'

      result = HTTP.send(method, url_route)
      raise(result.to_s) if result.code >= 300
      ApiResponse.new(result.code, result.to_s)
    end
  end
end