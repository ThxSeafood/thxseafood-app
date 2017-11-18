# frozen_string_literal: true

require 'roda'
require 'slim'

module ThxSeafood
  # Web App
  class App < Roda
    # plugin :render, engine: 'slim', views: 'presentation/views'
    plugin :render, views: 'presentation/views'
    plugin :assets, css: 'style.css', path: 'presentation/assets'

    route do |routing|
      routing.assets
      app = App

      # GET / request
      routing.root do
        jobs_json = ApiGateway.new.all_jobs
        all_jobs = ThxSeafood::JobsRepresenter.new(OpenStruct.new)
                                                .from_json jobs_json
        view 'home', locals: { jobs: all_jobs.jobs }
      end

      # routing.on 'repo' do
      #   routing.post do
      #     gh_url = routing.params['github_url'].downcase
      #     halt 400 unless (gh_url.include? 'github.com') &&
      #                     (gh_url.split('/').count > 2)
      #     ownername, reponame = gh_url.split('/')[-2..-1]
      #     ApiGateway.new.create_repo(ownername, reponame)
      #   end
      # end
    end
  end
end
