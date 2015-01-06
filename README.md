# Gastarbeiter

Cheap workers for your Beanstalk tubes.


## Installation

Update your application's Gemfile:

```ruby
gem 'gastarbeiter'
```


## Implement the worker

```ruby
class Ranker

  include Gastarbeiter    # 1. Include the Gastarbeiter module

  def execute(params)
    puts params           # 2. Implement the worker logic
  end

end
```

## Run the processing

```ruby
conn = Beaneater::Pool.new(['localhost:11300'])
Ranker.new.register_and_process!(conn, 'ranker')
```

This would block and process all jobs put on the 'ranker' tube.


## Licence

Copyright (c) 2015 Dejan Simic

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
