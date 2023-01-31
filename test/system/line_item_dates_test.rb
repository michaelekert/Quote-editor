require 'application_system_test_case'

class LineItemDates < ApplicationSystemTestCase

  include ActionView::Helpers::NumberHelper
  setup do
    login_as users(:accountant)

    @quote = quotes(:first)
    @line_item_date = line_item_dates(:today)

    visit quote_path(@quote)
  end

  test "Creatin a new line item date" do
    assert_selector "h1", text: "First quote"

    click_on "New Date"
    assert_selector "h1", text: "First quote"
    fill_in "Date", with: Date.current + 1.day

    click_on "Create Date"
    assert_text I18n.l(Date.current + 1.day, format: :long)

  end

  test "Updating a line item date" do
    assert_selector "h1", text: "First quote"

    within id: dom_id(@line_item_date, :edit) do
      click_on "Edit"
    end

    assert_selector "h1", text: "First quote"
    fill_in "Date", with: Date.current + 1.day
    click_on "Update Date"
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Destroying a line item date" do
    assert_selector "h1", text: "First quote"
    assert_text I18n.l(Date.current, format: :long)
    accept_confirm do
      within id: dom_id(@line_item_date, :edit) do
        click_on "Delete"
      end
    end
    assert_no_text I18n.l(Date.current, format: :long)

    assert_text number_to_currency(@quote.total_price)
  end

end