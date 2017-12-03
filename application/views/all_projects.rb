# frozen_string_literal: true

module ThxSeafood
  module Views
    # View object for colelction of Github projects
    class AllProjects
      def initialize(all_jobs)
        @all_jobs = all_repos
      end

      def none?
        @all_jobs.job.none?
      end

      def any?
        @all_jobs.job.any?
      end

      def collection
        @all_jobs.job.map { |job| Project.new(job) }
      end
    end
  end
end
