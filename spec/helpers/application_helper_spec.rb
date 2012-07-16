require 'spec_helper'

describe ApplicationHelper do

  describe "link to page" do
    let(:page) {2}
    let(:label) {"Page2"}
    it "returns link tag to page for pager" do
      link = helper.link_to_page(2, label)
      link.should =~ /<a.*data-page="#{page}".*>#{label}<\/a>/
    end
  end

  describe "page title" do
    let(:title) {"Page title"}
    it "sets title for page" do
      helper.page_title(title)
      view.content_for(:title).should include(title)
    end
  end
end
