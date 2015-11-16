require 'rails_helper'

describe 'Form', type: :feature, js: true do
  after do
    Capybara.use_default_driver
  end

  [:selenium, :selenium_chrome].each do |selenium_driver|
    context "Given selenium JavaScript driver: #{selenium_driver}" do
      before do
        Capybara.current_driver = selenium_driver
      end

      ['320x480', '480x320', '480x800', '800x480', '768x1280', '1280x768', '1024x768', '1366x768'].each do |resolution|
        context "Given viewport resolution: #{resolution}" do
          before do
            width, height = resolution.split('x')
            page.driver.browser.manage.window.resize_to(width, height)
          end

          it 'uses Selectivity.js inputs' do
            visit root_path

            selectivity_select('Netherlands', from: 'Multiple select list')
            selectivity_select('Cyprus', 'Russia', from: '#test_multiple_select')
            selectivity_unselect('Netherlands', from: 'Multiple select list')
            selectivity_unselect('Russia', 'Cyprus', from: '#test_multiple_select')
            selectivity_select('United Kingdom', from: 'Multiple select list')
            selectivity_select('Spain', from: '#test_multiple_select')

            selectivity_select('Germany', from: 'Single select list')
            selectivity_unselect('Germany', from: '#test_single_select')
            selectivity_select('Poland', 'Germany', from: '#test_single_select') # will only select Poland

            selectivity_select('Active', from: '#test_active_or_not')
          end
        end
      end
    end
  end

  context 'Given poltergeist JavaScript driver' do
    before do
      Capybara.current_driver = :poltergeist
    end

    it 'uses Selectivity.js inputs' do
      visit root_path

      selectivity_select('Netherlands', from: 'Multiple select list')
      selectivity_select('Cyprus', 'Russia', from: '#test_multiple_select')
      selectivity_unselect('Netherlands', from: 'Multiple select list')
      selectivity_unselect('Russia', 'Cyprus', from: '#test_multiple_select')
      selectivity_select('United Kingdom', from: 'Multiple select list')
      selectivity_select('Spain', from: '#test_multiple_select')

      selectivity_select('Germany', from: 'Single select list')
      selectivity_unselect('Germany', from: '#test_single_select')
      selectivity_select('Poland', 'Germany', from: '#test_single_select') # will only select Poland

      selectivity_select('Active', from: '#test_active_or_not')
    end
  end
end
