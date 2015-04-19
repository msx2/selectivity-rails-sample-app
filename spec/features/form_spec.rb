require 'rails_helper'

describe 'Form', type: :feature, js: true do
  ['320x480', '480x320', '480x800', '800x480', '768x1280', '1280x768', '1024x768', '1366x768'].each do |resolution|
    context "Given viewport resolution: #{resolution}" do
      before do
        width, height = resolution.split('x')
        page.driver.browser.manage.window.resize_to(width, height)
      end

      it 'uses Selectivity.js inputs' do
        visit root_path

        selectivity_select('Netherlands', from: '#test_multiple_select')
        selectivity_select('Cyprus', 'Russia', from: '#test_multiple_select')
        selectivity_unselect('Netherlands', from: '#test_multiple_select')
        selectivity_unselect('Russia', 'Cyprus', from: '#test_multiple_select')
        selectivity_select('United Kingdom', from: '#test_multiple_select')
        selectivity_select('Spain', from: '#test_multiple_select')

        selectivity_select('Germany', from: '#test_single_select')
        selectivity_unselect('Germany', from: '#test_single_select')
        selectivity_select('Poland', 'Germany', from: '#test_single_select') # will only select Poland
      end
    end
  end
end
