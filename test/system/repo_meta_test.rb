require "application_system_test_case"

class RepoMetaTest < ApplicationSystemTestCase
  setup do
    @repo_metum = repo_meta(:one)
  end

  test "visiting the index" do
    visit repo_meta_url
    assert_selector "h1", text: "Repo Meta"
  end

  test "creating a Repo metum" do
    visit repo_meta_url
    click_on "New Repo Metum"

    fill_in "Description", with: @repo_metum.description
    fill_in "Repo", with: @repo_metum.repo_id
    fill_in "User", with: @repo_metum.user_id
    click_on "Create Repo metum"

    assert_text "Repo metum was successfully created"
    click_on "Back"
  end

  test "updating a Repo metum" do
    visit repo_meta_url
    click_on "Edit", match: :first

    fill_in "Description", with: @repo_metum.description
    fill_in "Repo", with: @repo_metum.repo_id
    fill_in "User", with: @repo_metum.user_id
    click_on "Update Repo metum"

    assert_text "Repo metum was successfully updated"
    click_on "Back"
  end

  test "destroying a Repo metum" do
    visit repo_meta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repo metum was successfully destroyed"
  end
end
