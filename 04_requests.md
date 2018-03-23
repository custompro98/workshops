<!--Meta theme:solarized title:Learn RSpec 04-->

<!--sec 1.1-->
# Request specs

<!--sec 1.2-->
## What's different from the unit specs we wrote?

<!--sec 1.3-->
A request spec is used to test the endpoints in a Rails API

Note:
This API has a simple model structure, being only users, bookmakrs, and tags
This should be small enough to get us going but large enough to allow for any exploration on our own
<!--sec 1.4-->
Let's start by building one for /bookmarks

<!--sec 2.1-->
## So how do we set it up?

<!--sec 2.2-->
```ruby
# spec/requests/get_bookmarks_spec.rb
require 'rails_helper'

describe 'Bookmarks', type: :request do
  describe 'GET /bookmarks' do
    before { get v1_bookmarks_path }

    it 'returns an empty array' do
      expect(json[:bookmarks]).to be_empty
    end
  end
end
```

<!--sec 2.3-->
## Why did it say `expected nil to respond to empty?`?

<!--sec 2.4-->
Because the correct headers weren't being sent

<!--sec 2.5-->
Let's handwave over this for now (unless anyone has any objections)

Note:
This application has user authentication, only returning bookmarks that belong to the user
We need to create a user to be logged in, so we'll use a helper that's already written for us 

<!--sec 2.6-->
```ruby
require 'rails_helper'

describe 'Bookmarks', type: :request do
  describe 'GET /bookmarks' do
    it 'returns an empty array' do
      # Setup
      owner = create(:user)

      # Exercise
      get v1_bookmarks_path, headers: headers(owner) 

      # Verify
      expect(json[:bookmarks]).to be_empty
    end
  end
end
```

<!--sec 3.1-->
## ...now the user factory isn't generated?

<!--sec 3.2-->
```ruby
# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    first_name 'Tester'
    sequence(:last_name).to_s
    sequence(:email) { |n| "#{n}@example.com" }
    password 'password'
  end
end
```

Note:
We only want to populate fields that are marked as required in the database, that way we only create as much data as we need
We use sequences to generate random data, every time we create a user the sequence will increase by 1.  So that means evey user will have a unique last name and email address in this case

<!--sec 5.1-->
## But shouldn't we test what happens when this endpoint needs data?

<!--sec 5.2-->
```ruby
require 'rails_helper'

describe 'Bookmarks', type: :request do
  describe 'GET /bookmarks' do
    context 'there are no bookmarks for the user' do
      it 'returns an empty array' do
        owner = create(:user)

        get v1_bookmarks_path, headers: headers(owner) 

        expect(json[:bookmarks]).to be_empty
      end
    end

    context 'there is a bookmark for the user' do
      it 'returns the bookmark' do
        owner = create(:user)
        bookmark = create(:bookmark, user_id: owner.id)

        get v1_bookmarks_path, headers: headers(owner) 

        expect(json[:bookmarks].size).to eq 1
        expect(json[:bookmarks].first.id).to eq bookmark.id
      end
    end
  end
end
```

<!--sec 5.3-->
## Now this factory is missing?

<!--sec 5.4-->
```ruby
FactoryBot.define do
  factory :bookmark do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:url) { |n| "www.#{n}.com" }

    before(:create) do |bookmark|
      bookmark.user_id ||= create(:user).id
    end
  end
end
```

<!--sec 6.1-->
## Our tests passed! That was a lot of set up...

<!--sec 6.2-->
Requet specs often take longer to set up than unit tests, which is why there should be fewer than your request specs

<!--sec 6.3-->
![pyramid](images/test_pyramid.png)

Note:
The testing pyramid shows that we should have mostly unit tests as our foundation, hitting every happy and sad path
Next we should have our service (or integration) tests, these hit every happy path and maybe a few sad paths
And at the top we have our UI (or acceptance) tests, these hit the critical happy paths in our application

The speed decreases while the cost of the test in terms of computational power increases

<!--sec 7.1-->
[Next Steps](learn-rspec-05.html)
