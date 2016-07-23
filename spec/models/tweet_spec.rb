require_relative '../spec_helper'

describe Tweet do
  let!(:user) do
    User.create!(
      name: "Some Person",
      email: "some_person123456@mail.com",
      handle: "someperson123456",
      password: "123456"
    )
  end
  let!(:tweet) do
    Tweet.create!(
      user: user,
      content: "I am testing a tweet. Can anybody hear me?"
    )
  end

  it "should have content" do
    expect(tweet.content).to eq "I am testing a tweet. Can anybody hear me?"
  end
  it "should have a user associated with it" do
    expect(tweet.user_id).to eq user.id
  end
end
