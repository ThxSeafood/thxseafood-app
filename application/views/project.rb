# frozen_string_literal: true

module ThxSeafood
  module Views

    class Project
      def initialize(job)
        @job= job
      end

      def name
        @job.name
      end

      def link
        @job.link
      end

      def company
        @job.company
      end

      def lng
        @job.lon
      end
      
      def lat
        @job.lat
      end

      def address
        @job.address
      end

      def addr_no_descript
        @job.addr_no_descript
      end

      def description
        @job.description
      end

      def user_query
        @job.user_query
      end
    end
  end
end
