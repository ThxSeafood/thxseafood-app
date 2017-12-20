# frozen_string_literal: true

module ThxSeafood
  module Views
    # View object for colelction of Github projects
    class AllProjects
      def initialize(all_jobs)
        @all_jobs = all_jobs
      end

      def none?
        @all_jobs.jobs.none?
      end

      def any?
        @all_jobs.jobs.any?
      end

      def collection
        @all_jobs.jobs.map { |job| Project.new(job) }
      end
    end
  end
end
