require "application_system_test_case"

class DenominationsTest < ApplicationSystemTestCase
  setup do
    @denomination = denominations(:one)
  end

  test "visiting the index" do
    visit denominations_url
    assert_selector "h1", text: "Denominations"
  end

  test "creating a Denomination" do
    visit denominations_url
    click_on "New Denomination"

    fill_in "Fifty", with: @denomination.fifty
    fill_in "Five", with: @denomination.five
    fill_in "Five hundred", with: @denomination.five_hundred
    fill_in "Hundred", with: @denomination.hundred
    fill_in "One", with: @denomination.one
    fill_in "Shop", with: @denomination.shop_id
    fill_in "Ten", with: @denomination.ten
    fill_in "Twenty", with: @denomination.twenty
    fill_in "Two", with: @denomination.two
    click_on "Create Denomination"

    assert_text "Denomination was successfully created"
    click_on "Back"
  end

  test "updating a Denomination" do
    visit denominations_url
    click_on "Edit", match: :first

    fill_in "Fifty", with: @denomination.fifty
    fill_in "Five", with: @denomination.five
    fill_in "Five hundred", with: @denomination.five_hundred
    fill_in "Hundred", with: @denomination.hundred
    fill_in "One", with: @denomination.one
    fill_in "Shop", with: @denomination.shop_id
    fill_in "Ten", with: @denomination.ten
    fill_in "Twenty", with: @denomination.twenty
    fill_in "Two", with: @denomination.two
    click_on "Update Denomination"

    assert_text "Denomination was successfully updated"
    click_on "Back"
  end

  test "destroying a Denomination" do
    visit denominations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Denomination was successfully destroyed"
  end
end
