require "rails_helper"

RSpec.describe "Exchange currency process", :type => "features" do
  it exchange_value do
    visit '/'
    within ('#exchange_form') do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: 10
    end

    click_button 'CONVERTER'

    #save and open page

    expect(page).to have_content("value")

  end
end
