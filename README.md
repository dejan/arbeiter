# Gastarbeiter

Cheap workers for your Beanstalk tubes.


## Installation

Update your application's Gemfile:

```ruby
gem 'gastarbeiter'
```


## Implement the worker

    class Ranker

      include Gastarbeiter      # 1. Include the Arbeiter module

      def execute(params)
        puts params         # 2. Implement worker logic
      end

    end


## Run the processing

    conn = Beaneater::Pool.new(['localhost:11300'])
    Ranker.new.register_and_process!(conn, 'ranker')

This would block and process all jobs put on the 'ranker' tube.

