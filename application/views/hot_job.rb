module ThxSeafood
  module Views
  
    class HotJobView
      def initialize(hot_job)
        @hot_job = hot_job
      end

      def rank
        @hot_job.rank
      end

      def name
        @hot_job.name
      end

      def link
        @hot_job.link
      end

      def company
        @hot_job.company
      end

      def lng
        @hot_job.lng
      end

      def lat
        @hot_job.lat
      end

      def address
        @hot_job.address
      end

      def address_no_descript
        @hot_job.address_no_descript
      end

      def user_query
        @hot_job.user_query
      end

      def city
        @hot_job.city
      end

    end
  
  end
end
