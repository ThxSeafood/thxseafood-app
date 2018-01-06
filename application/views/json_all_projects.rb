# frozen_string_literal: true

require 'json'

module ThxSeafood
  module Views
    # View object for colelction of Github projects
    class JsonAllProjects
      def initialize(jobs_json)
        @jobs_json = jobs_json    # String
      end

      def none?
        if @jobs_json
          return false
        else
          return true
        end
      end

      def any?
        if @jobs_json
          return true
        else
          return false
        end
      end

      def getString
        @jobs_json
      end

      def getEncodeString
        Base64.urlsafe_encode64(@jobs_json)
      end

      def getJSON
        JSON.parse(@jobs_json)   # Hash
      end

      # def collection
      #   @all_jobs.jobs.map { |job| Project.new(job) }
      # end
    end
  end
end
