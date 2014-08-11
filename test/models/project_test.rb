require "test_helper"

describe Project do
  let(:project) { Project.new }

  it "must be valid" do
    project.must_be :valid?
  end
end
