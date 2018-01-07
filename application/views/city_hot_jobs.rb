module ThxSeafood
  module Views
  
    class CityHotJobsView
      def initialize(city_hot_jobs)
        @city_hot_jobs = city_hot_jobs
      end

      def none?
        @city_hot_jobs.none?
      end

      def any?
        @city_hot_jobs.any?
      end

      def taipei
        @city_hot_jobs.taipei { |city_job| HotJob.new(city_job) }
      end 
      
      def new_taipei
        @city_hot_jobs.new_taipei { |city_job| HotJob.new(city_job) }
      end

      def taoyuan
        @city_hot_jobs.taoyuan { |city_job| HotJob.new(city_job) }
      end

      def hsinchu
        @city_hot_jobs.hsinchu { |city_job| HotJob.new(city_job) }
      end

      def taichung
        @city_hot_jobs.taichung { |city_job| HotJob.new(city_job) }
      end

      def tainan
        @city_hot_jobs.tainan { |city_job| HotJob.new(city_job) }
      end

      def kaohsiung
        @city_hot_jobs.kaohsiung { |city_job| HotJob.new(city_job) }
      end

    end
  
  end
end
