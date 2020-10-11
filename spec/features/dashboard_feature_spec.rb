require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  scenario 'show map with positions' do
    visit '/show'
    expect(page).to have_content('Show positions')
  end
end