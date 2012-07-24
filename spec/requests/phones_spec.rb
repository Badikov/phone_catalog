require 'spec_helper'

describe "Phones viewing" do

  with_and_without_js do

    describe "show phone" do

      it "displays phone info" do
        nokia_e51 = create(:nokia_e51)
        Rails.application.reload_routes!
        visit root_path
        click_link nokia_e51.vendor.name
        wait_until{ find_link(nokia_e51.name).visible? }
        find_link(nokia_e51.name).click

        page.should have_content(nokia_e51.name)
        page.should have_content(nokia_e51.vendor.name)
        page.should have_content(nokia_e51.phone_type.name)
        page.should have_content(nokia_e51.case_type.name)
        page.should have_selector("img[src*='#{nokia_e51.image}']")
      end
    end

    describe "phones index" do
      before(:each) do
        @nokia_e51 = create(:nokia_e51)
        @nokia_6089 = create(:nokia_6089)
        @asus_j101 = create(:asus_j101)
        @phones = [@nokia_e51, @nokia_6089, @asus_j101]
        Rails.application.reload_routes!
        visit root_path
        click_link I18n.t("search")
      end

      it "has filter form" do
        within('form') do
          page.should have_selector("select[name='vendor_id']")
          page.should have_selector("select[name='phone_type_id']")
          page.should have_selector("input[type='radio'][name='contain_3g']")
        end
      end

      it "displays phones" do
        within('.phones') do
          @phones.each do |phone|
            page.should have_content(phone.name)
            page.should have_selector("img[src*='#{phone.image}']")
          end
        end
      end
    end

  end

  describe "filtering phones" do
    before(:each) do
      @nokia_e51 = create(:nokia_e51)
      @nokia_6089 = create(:nokia_6089)
      @asus_j101 = create(:asus_j101)
      @phones = [@nokia_e51, @nokia_6089, @asus_j101]
      Rails.application.reload_routes!
      visit root_path
      click_link I18n.t("search")
    end

    [false, true].each do |js_enabled|

      context "when javascript #{js_enabled ? "enabled" : "disabled"}", js: js_enabled do

        it "filter phones by params" do
          if js_enabled
            wait_until { find_field(I18n.t('phone.vendor')).visible? }
          end

          page.select @nokia_e51.vendor.name, from: I18n.t('phone.vendor')

          unless js_enabled
            click_button I18n.t('search')
          end

          within('.phones') do
            page.should have_content(@nokia_e51.name)
            page.should have_selector("img[src*='#{@nokia_e51.image}']")
            page.should have_content(@nokia_6089.name)
            page.should have_selector("img[src*='#{@nokia_6089.image}']")
            page.should have_no_content(@asus_j101.name)
            page.should have_no_selector("img[src*='#{@asus_j101.image}']")
          end
        end
      end

    end

  end
end