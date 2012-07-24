require 'spec_helper'

describe "Vendors viewing" do
  with_and_without_js do

    describe "vendors index" do
      it "displays vendors" do
        @vendors = []
        3.times {@vendors << create(:vendor)}
        visit root_path
        within("#vendors") do
          @vendors.each do |vendor|
            page.should have_content(vendor.name)
          end
        end
      end
    end

    describe "vendor show" do
      before(:each) do
        @nokia_e51 = create(:nokia_e51)
        @nokia_6089 = create(:nokia_6089)
        @asus_j101 = create(:asus_j101)
        Rails.application.reload_routes!
        visit root_path
        click_link @nokia_e51.vendor.name
      end

      it "displays phones with images by vendor" do
        within('.phones') do
          page.should have_content(@nokia_e51.name)
          page.should have_selector("img[src*='#{@nokia_e51.image}']")
          page.should have_content(@nokia_6089.name)
          page.should have_selector("img[src*='#{@nokia_6089.image}']")
        end
      end

      it "does not display phones by another vendor" do
        within('.phones') do
          page.should have_no_content(@asus_j101.name)
          page.should have_no_selector("img[src*='#{@asus_j101.image}']")
        end
      end
    end

  end
end