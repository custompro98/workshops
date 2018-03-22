<!--Meta theme:solarized title:Learn RSpec 03-->

<!--sec 1.1-->
# What is a factory?

<!--sec 1.2-->
It's how we set up data in the database for a test

<!--sec 1.3-->
IMPORTANT: Each test should be isolated, which means we need to clean the database between each test

<!--sec 1.4-->
ALSO IMPORTANT: You should only use factories if you need to, for example to pass validations on that class.

<!--sec 2.1-->
## So what does one look like?

<!--sec 2.2-->
Well that depends, but we use FactoryBot (formerly FactoryGirl) so it looks like this:
```ruby
# spec/factories/user.rb
FactoryBot.define do
  factory :user do
    # Notice how there's nothing here. This is intentional.
    # The factory should only have the minimum required default values to allow the class to save.
    # Any additional attributes should be declared by your test or through traits.
    # This forces factories to be a la carte.
  end
end

# spec/test_spec.rb
describe 'User' do
  before do
    create(:user, first_name: 'Tester')
  end

  it 'works correctly' do
    expect(user.first_name).to eq 'Tester'
  end
end
```

<!--sec 3.1-->
## Great! Now let's get into some request specs
Clone the [Test API](https://github.com/custompro98/pocket-rails),  checkout the `learn_rspec` branch, and run `rake db:setup`
[Next Steps](learn-rspec-04.html)
