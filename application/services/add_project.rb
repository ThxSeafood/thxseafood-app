# frozen_string_literal: true

require 'dry/transaction'

module ThxSeafood
  # Transaction to add Github project to API
  class AddProject
    include Dry::Transaction

    # step :validate_input
    step :add_project

    # def validate_input(input)
    #   if input.success?
    #     ownername, reponame = input[:url].split('/')[-2..-1]
    #     Right(ownername: ownername, reponame: reponame)
    #   else
    #     Left(input.errors.values.join('; '))
    #   end
    # end

    def add_project(input)
      ApiGateway.new.create_jobs(input[:query])
      Right(input)
    rescue StandardError => error
      Left(error.to_s)
    end
  end
end