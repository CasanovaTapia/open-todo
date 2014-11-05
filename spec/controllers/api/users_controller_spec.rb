require 'spec_helper'

describe Api::UsersController do

  before do
    User.destroy_all
  end

  describe "create" do
    it "creates and returns a new user from email and password params" do
      params = { 'new_user' => { 'email' => 'test@example.com', 'password' => 'testpass' } }

      expect{ post :create, params }
        .to change{ User.where(params['new_user']).count }
        .by 1

      JSON.parse(response.body).should == params['new_user']
    end

    it "returns an error when not given a password" do
      post :create, { email: 'testuser' }
      response.should be_error
    end

    it "returns an error when not given a email" do
      post :create, { password: 'testpass' }
      response.should be_error
    end
  end

  describe "index" do

    before do
      (1..3).each{ |n| User.create( id: n, email: "name#{n}", password: "pass#{n}" ) }
    end

    it "lists all emails and ids" do
      get :index

      JSON.parse(response.body).should ==
        { 'users' =>
          [
            { 'id' => 1, 'email' => 'name1' },
            { 'id' => 2, 'email' => 'name2' },
            { 'id' => 3, 'email' => 'name3' }
          ]
        }
    end
  end
end
