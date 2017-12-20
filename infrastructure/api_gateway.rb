# frozen_string_literal: true

require 'http'

module ThxSeafood
  class ApiGateway
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
    def call_api(method, resources)
      url_route = [@config.api_url, resources].flatten.join'/'

      result = HTTP.send(method, url_route)
      raise(result.to_s) if result.code >= 300
      result.to_s
    end
  end
end