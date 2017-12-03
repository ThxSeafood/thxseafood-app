# frozen_string_literal: true

require 'roda'
require 'slim'
require 'slim/include'


module ThxSeafood
  # Web App
  class App < Roda
    plugin :render, engine: 'slim', views: 'presentation/views'
    # plugin :render, views: 'presentation/views'
    plugin :assets, css: 'style.css', path: 'presentation/assets'
    plugin :flash
    use Rack::Session::Cookie, secret: config.SESSION_SECRET

    route do |routing|
      routing.assets
      app = App

      # GET / request
      routing.root do
        jobs_json = ApiGateway.new.all_jobs
        all_jobs = ThxSeafood::JobsRepresenter.new(OpenStruct.new).from_json jobs_json
        projects = Views::AllProjects.new(all_jobs)
        if projects.none?
          flash.now[:error] = 'No data in databse.'
        end
        if projects.any?
          flash.now[:notice] = 'Data is showing below'
        end
        view 'ThxSeafood', locals: { jobs: all_jobs.jobs }
        # view 'home', locals: { jobs_json: jobs_json }
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
