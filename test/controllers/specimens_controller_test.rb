require 'test_helper'

class SpecimensControllerTest < ActionController::TestCase
  setup do
    @specimen = specimens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specimen" do
    assert_difference('Specimen.count') do
      post :create, specimen: { code: @specimen.code, data: @specimen.data, remarks: @specimen.remarks, sample_id: @specimen.sample_id, specimen_type_id: @specimen.specimen_type_id, specimen_type_version_id: @specimen.specimen_type_version_id, prepared_by_id: @specimen.prepared_by_id }
    end

    assert_redirected_to specimen_path(assigns(:specimen))
  end

  test "should show specimen" do
    get :show, id: @specimen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specimen
    assert_response :success
  end

  test "should update specimen" do
    patch :update, id: @specimen, specimen: { code: @specimen.code, data: @specimen.data, remarks: @specimen.remarks, sample_id: @specimen.sample_id, specimen_type_id: @specimen.specimen_type_id, specimen_type_version_id: @specimen.specimen_type_version_id, prepared_by_id: @specimen.prepared_by_id }
    assert_redirected_to specimen_path(assigns(:specimen))
  end

  test "should destroy specimen" do
    assert_difference('Specimen.count', -1) do
      delete :destroy, id: @specimen
    end

    assert_redirected_to specimens_path
  end
end
