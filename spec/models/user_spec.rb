require_relative '../spec_helper'

describe User do
  let!(:user) do
    User.create!(
      name: "Some Person",
      email: "some_person123456@mail.com",
      handle: "someperson123456",
      password: "123456"
    )
  end

  it "should have a name" do
    expect(user.name).to eq "Some Person"
  end
  it "should have an email" do
    expect(user.email).to eq "some_person123456@mail.com"
  end
  it "should have a handle" do
    expect(user.handle).to eq "someperson123456"
  end
  it "should have a password" do
    expect(user.password).not_to be_nil
    expect(user.password).not_to eq ""
  end

  it "should a have a unique handle" do
    expect do
      User.create!(
        name: "Jerry Somebody",
        email: "some_person654321@mail.com",
        handle: "someperson123456",
        password: "654321"
      )
    end.to raise_error ActiveRecord::RecordInvalid
  end

  it "should a have a unique email" do
    expect do
      User.create!(
        name: "Jerry Somebody",
        email: "some_person123456@mail.com",
        handle: "someperson654321",
        password: "654321"
      )
    end.to raise_error ActiveRecord::RecordInvalid
  end


end
