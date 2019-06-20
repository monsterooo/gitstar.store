require 'test_helper'

class RepoMetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repo_metum = repo_meta(:one)
  end

  test "should get index" do
    get repo_meta_url
    assert_response :success
  end

  test "should get new" do
    get new_repo_metum_url
    assert_response :success
  end

  test "should create repo_metum" do
    assert_difference('RepoMetum.count') do
      post repo_meta_url, params: { repo_metum: { description: @repo_metum.description, repo_id: @repo_metum.repo_id, user_id: @repo_metum.user_id } }
    end

    assert_redirected_to repo_metum_url(RepoMetum.last)
  end

  test "should show repo_metum" do
    get repo_metum_url(@repo_metum)
    assert_response :success
  end

  test "should get edit" do
    get edit_repo_metum_url(@repo_metum)
    assert_response :success
  end

  test "should update repo_metum" do
    patch repo_metum_url(@repo_metum), params: { repo_metum: { description: @repo_metum.description, repo_id: @repo_metum.repo_id, user_id: @repo_metum.user_id } }
    assert_redirected_to repo_metum_url(@repo_metum)
  end

  test "should destroy repo_metum" do
    assert_difference('RepoMetum.count', -1) do
      delete repo_metum_url(@repo_metum)
    end

    assert_redirected_to repo_meta_url
  end
end
