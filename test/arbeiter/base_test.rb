require 'test_helper'
require 'beaneater'

class DummyCalculator
  include Gastarbeiter
  attr_reader :sum

  def add(value)
    @sum ||= 0
    @sum += value
  end

  def execute(params)
    add params['value']
  end
end

class BaseTest < Minitest::Test

  def setup
    @beanstalk = Beaneater::Pool.new(['localhost:11300'])
    @tube = @beanstalk.tubes[DummyCalculator.to_s]
    @tube.clear
    @tube.put({value: 1}.to_json)
    @tube.put({value: 11}.to_json)
    @tube.put({value: 3}.to_json)
    @tube.put({value: 2}.to_json)
  end

  def test_processing
    calc = DummyCalculator.new
    Thread.new do
      calc.register_and_process!(@beanstalk)
    end
    sleep 0.1 # give it some time to process jobs
    assert_equal 17, calc.sum
  end

end
