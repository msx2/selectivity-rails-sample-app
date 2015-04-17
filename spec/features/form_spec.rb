require 'rails_helper'

describe 'Form', type: :feature, js: true do
  it 'fills in the form' do
    visit root_path

    selectivity_select('Cyprus', from: '#test_multiple_select')
    selectivity_select('Russia', from: '#test_multiple_select')
    selectivity_unselect('Cyprus', from: '#test_multiple_select')
    selectivity_unselect('Russia', from: '#test_multiple_select')
    selectivity_select('United Kingdom', from: '#test_multiple_select')
    selectivity_select('Spain', from: '#test_multiple_select')

    selectivity_select('Germany', from: '#test_single_select')
    selectivity_unselect('Germany', from: '#test_single_select')
    selectivity_select('Poland', from: '#test_single_select')
  end
end
