require 'test_helper'

class SampleTypeVersionsControllerTest < ActionController::TestCase
  setup do
    @sample_type_version = sample_type_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sample_type_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sample_type_version" do
    assert_difference('SampleTypeVersion.count') do
      post :create, sample_type_version: { data: @sample_type_version.data, name: @sample_type_version.name, sample_type_id: @sample_type_version.sample_type_id }
    end

    assert_redirected_to sample_type_version_path(assigns(:sample_type_version))
  end

  test "should show sample_type_version" do
    get :show, id: @sample_type_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sample_type_version
    assert_response :success
  end

  test "should update sample_type_version" do
    patch :update, id: @sample_type_version, sample_type_version: { data: @sample_type_version.data, name: @sample_type_version.name, sample_type_id: @sample_type_version.sample_type_id }
    assert_redirected_to sample_type_version_path(assigns(:sample_type_version))
  end

  test "should destroy sample_type_version" do
    assert_difference('SampleTypeVersion.count', -1) do
      delete :destroy, id: @sample_type_version
    end

    assert_redirected_to sample_type_versions_path
  end
end
