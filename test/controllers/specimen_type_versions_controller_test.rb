require 'test_helper'

class SpecimenTypeVersionsControllerTest < ActionController::TestCase
  setup do
    @specimen_type_version = specimen_type_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimen_type_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specimen_type_version" do
    assert_difference('SpecimenTypeVersion.count') do
      post :create, specimen_type_version: { data: @specimen_type_version.data, name: @specimen_type_version.name, specimen_type_id: @specimen_type_version.specimen_type_id }
    end

    assert_redirected_to specimen_type_version_path(assigns(:specimen_type_version))
  end

  test "should show specimen_type_version" do
    get :show, id: @specimen_type_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specimen_type_version
    assert_response :success
  end

  test "should update specimen_type_version" do
    patch :update, id: @specimen_type_version, specimen_type_version: { data: @specimen_type_version.data, name: @specimen_type_version.name, specimen_type_id: @specimen_type_version.specimen_type_id }
    assert_redirected_to specimen_type_version_path(assigns(:specimen_type_version))
  end

  test "should destroy specimen_type_version" do
    assert_difference('SpecimenTypeVersion.count', -1) do
      delete :destroy, id: @specimen_type_version
    end

    assert_redirected_to specimen_type_versions_path
  end
end
