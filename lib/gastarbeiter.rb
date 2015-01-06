require 'gastarbeiter/version'
require 'json'

module Gastarbeiter

  # implement this method in classes
  def process(params)
  end

  # this blocks and process all incoming jobs
  def register_and_process!(beanstalk, tube_name = self.class)
    beanstalk.jobs.register(tube_name.to_s) do |job|
      execute(deserialize job.body)
    end
    beanstalk.jobs.process!
  end

  # override to change deserialization strategy
  def deserialize(body)
    JSON.parse(body)
  end

end
