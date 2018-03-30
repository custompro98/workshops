<!--Meta theme:solarized title:Learn RSpec 02-->

<!--sec 1.1-->
# What does an RSpec test look like?

<!--sec 1.2-->
```ruby
describe 'some class name' do
  it 'works correctly' do
    expect(1 + 1).to eq 2
  end
end
```

Note:
describe is used to set up the RSpec test and gives us access to the RSpec DSL
it is a function that takes a description and a block (which is the actual test)
<!--sec 2.1-->
## Great! We have RSpec up and working, let's test a method

<!--sec 2.2-->
```ruby
class TestClass
  def add_one_to(num)
    num + 1
  end
end

describe TestClass do
  it 'works correctly' do
    # Setup
    class = TestClass.new
    
    # Exercise
    result = class.add_one_to(1)
  
    # Verify
    expect(result).to eq 2
  end
end
```

<!--sec 2.3-->
```ruby
class TestClass
  def add_one_to(num)
    num + 1
  end
end

describe TestClass do
  it 'works correctly' do
    expect(subject.add_one_to(1)).to eq 2
  end
end
```

<!--sec 2.4-->
## ...where did subject come from?

<!--sec 2.5-->
`subject` is an RSpec helper that creates a new object of the class being described

<!--sec 2.6-->
## How do we know a test is passing for the reason I expect?

<!--sec 2.7-->
A common practice is to make a test fail by changing the expectation

Note:
This also let's us be sure the test will fail if something changes

<!--sec 3.1-->
## What if my test needs more context than I can put in a single line?

<!--sec 3.2-->
`context` 

<!--sec 3.3-->
```ruby
class TestClass
  def add_one_to(num)
    num + 1
  end
end

describe TestClass do
  context 'when adding one to one' do
    it 'works correctly' do
      expect(subject.add_one_to(1)).to eq 2
    end
  end
end
```

Note:
Like describe and it, context is also a function that takes a description and a block
You can also nest contexts and describes as deeply as you'd like
It's common to try to make the contexts and describes read well when read together because of how it's ouput from the console

<!--sec 4.1-->
## Neat, what if I need to set up some conditions for my test?

<!--sec 4.2-->
That's what a `before` does!

<!--sec 4.3-->
```ruby
class TestClass
  def add_one_to(num)
    num + 1
  end
end

describe TestClass do
  context 'when adding one to one' do
    before do
      @num = 1
    end

    it 'works correctly' do
      expect(subject.add_one_to(@num)).to eq 2
    end
  end
end
```

Note:
A before can be used to do more useful things like log in as a user or navigate to a page

<!--sec 4.4-->
Be careful though! Notice how in the context of the spec, we don't know what @num is
```ruby
it 'works correctly' do
  expect(subject.add_one_to(@num)).to eq 2
end
```

Note:
This is called a "Mystery Guest". In this case it's harmless, but imagine if this was line 300+ of a large spec file with lots of let and before blocks.

<!--sec 5.1-->
## Okay, how about if I need data for my test?

<!--sec 5.2-->
## `let` and `let!`

<!--sec 5.3-->
```ruby
class TestClass
  def add_one_to(num)
    num + 1
  end
end

describe TestClass do
  context 'when adding one to one' do
    let(:num) { 1 }

    it 'works correctly' do
      expect(subject.add_one_to(num)).to eq 2
    end
  end
end
```

Note:
The difference between let and let! is that the let! will be run no matter what, where regular let isn't evaluated until it's used

<!--sec 6.1-->
[Next Steps](learn-rspec-03.html)
