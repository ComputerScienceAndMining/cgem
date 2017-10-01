require 'test_helper'

class SpecimenTypesControllerTest < ActionController::TestCase
  setup do
    @specimen_type = specimen_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimen_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specimen_type" do
    assert_difference('SpecimenType.count') do
      post :create, specimen_type: { data: @specimen_type.data, name: @specimen_type.name }
    end

    assert_redirected_to specimen_type_path(assigns(:specimen_type))
  end

  test "should show specimen_type" do
    get :show, id: @specimen_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specimen_type
    assert_response :success
  end

  test "should update specimen_type" do
    patch :update, id: @specimen_type, specimen_type: { data: @specimen_type.data, name: @specimen_type.name }
    assert_redirected_to specimen_type_path(assigns(:specimen_type))
  end

  test "should destroy specimen_type" do
    assert_difference('SpecimenType.count', -1) do
      delete :destroy, id: @specimen_type
    end

    assert_redirected_to specimen_types_path
  end
end
