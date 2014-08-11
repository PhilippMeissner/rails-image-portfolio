require 'test_helper'

describe StaticController do

  it "should get home" do
    get :home
    assert_response :success
  end

end
