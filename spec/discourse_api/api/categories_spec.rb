require 'spec_helper'

describe DiscourseApi::API::Categories do
  subject { current_client }

  describe "#categories" do
    before do
      stub_get(current_client, "http://localhost/categories.json").to_return(body: fixture("categories.json"), headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.categories
      expect(a_get(current_client, "http://localhost/categories.json")).to have_been_made
    end

    it "returns the requested categories" do
      categories = subject.categories
      expect(categories).to be_an Array
      expect(categories.first).to be_a Hash
    end
  end
end