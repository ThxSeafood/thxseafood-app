# frozen_string_literal: true

module ThxSeafood
  module Views

    class Project
      def initialize(job)
        @job= job
      end

      def NAME
        @job.name
      end

      def LINK
        @job.link
      end

      def COMPANY
        job.company
      end


    end
  end
end
