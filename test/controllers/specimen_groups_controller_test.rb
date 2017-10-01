require 'test_helper'

class SpecimenGroupsControllerTest < ActionController::TestCase
  setup do
    @specimen_group = specimen_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimen_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specimen_group" do
    assert_difference('SpecimenGroup.count') do
      post :create, specimen_group: { description: @specimen_group.description, name: @specimen_group.name, work_order_id: @specimen_group.work_order_id }
    end

    assert_redirected_to specimen_group_path(assigns(:specimen_group))
  end

  test "should show specimen_group" do
    get :show, id: @specimen_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specimen_group
    assert_response :success
  end

  test "should update specimen_group" do
    patch :update, id: @specimen_group, specimen_group: { description: @specimen_group.description, name: @specimen_group.name, work_order_id: @specimen_group.work_order_id }
    assert_redirected_to specimen_group_path(assigns(:specimen_group))
  end

  test "should destroy specimen_group" do
    assert_difference('SpecimenGroup.count', -1) do
      delete :destroy, id: @specimen_group
    end

    assert_redirected_to specimen_groups_path
  end
end
