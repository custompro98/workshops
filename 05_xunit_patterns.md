<!--Meta theme:solarized title:Learn RSpec 05-->

<!--sec 1.1-->
# Obscure Tests

<!--sec 1.2-->
## It is difficult to understand the test at a glance.

<!--sec 2.1-->
# Mystery Guest

<!--sec 2.2-->
## What is a mystery guest?

<!--sec 2.3-->
```ruby
it "downcases the location on save" do
  expect(user.location).to eq "default"
end
```

Note: The first thing you may find asking yourself is "Where does the user variable come from?"

<!--sec 2.4-->
```ruby
before do
  user = create(:user, location: 'default')
end
```

<!--sec 3.1-->
# Mystery Variables

<!--sec 3.2-->
## What is a mystery variable?

<!--sec 3.3-->
```ruby
it "downcases the location on save" do
  user = create(:user)

  expect(user.location).to eq "default"
end
```

Note: The first thing you may find asking yourself is "Why is the location set to 'default'"

<!--sec 3.4-->
```ruby
FactoryBot.define do
  factory :user do
    location 'default'
  end
end
```

<!--sec 4.1-->
# lets(:not)

<!--sec 4.2-->
## Why you should consider the cases for when you should and shouldn't use let statements

<!--sec 4.3-->
```ruby
let!(:person) {
  create :person,
  gender: female,
  date_of_birth: date_of_birth,
  city_of_birth: city,
  state_of_birth: state,
  country_of_birth: country,
  county_of_birth: county,
  number_of_dependents: dependents,
  nickname: nickname,
  materials_under_another_name: materials,
  alt_first_name: alt_first,
  alt_middle_name: alt_middle,
  alt_last_name: alt_last,
}

let(:person_presenter) {
  PersonPresenter.new(person)
}

describe '#person_presenter' do
  specify { person_presenter('birth_location').must_include city.name }
end
```

Note: In this example, each of the variables inside the let is another let that makes one or more calls to the database. Notice that this is a let!, so it will execute before each spec, adding 7 seconds for each test even if the other tests don't reference the data.

<!--sec 4.4-->
```ruby
describe '#person_presenter' do
  it "shows the birth location as the city" do
    city_name = "Raleigh"
    city = build_stubbed(:city, name: city_name)
    person = build_stubbed(:person, city_of_birth: city)

    presenter = PersonPresenter.new(person)

    presenter("birth_location").must_include city_name
  end
end
```