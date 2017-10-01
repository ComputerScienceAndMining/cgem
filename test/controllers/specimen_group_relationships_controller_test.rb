require 'test_helper'

class SpecimenGroupRelationshipsControllerTest < ActionController::TestCase
  setup do
    @specimen_group_relationship = specimen_group_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specimen_group_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specimen_group_relationship" do
    assert_difference('SpecimenGroupRelationship.count') do
      post :create, specimen_group_relationship: { specimen_group_id: @specimen_group_relationship.specimen_group_id, specimen_id: @specimen_group_relationship.specimen_id }
    end

    assert_redirected_to specimen_group_relationship_path(assigns(:specimen_group_relationship))
  end

  test "should show specimen_group_relationship" do
    get :show, id: @specimen_group_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specimen_group_relationship
    assert_response :success
  end

  test "should update specimen_group_relationship" do
    patch :update, id: @specimen_group_relationship, specimen_group_relationship: { specimen_group_id: @specimen_group_relationship.specimen_group_id, specimen_id: @specimen_group_relationship.specimen_id }
    assert_redirected_to specimen_group_relationship_path(assigns(:specimen_group_relationship))
  end

  test "should destroy specimen_group_relationship" do
    assert_difference('SpecimenGroupRelationship.count', -1) do
      delete :destroy, id: @specimen_group_relationship
    end

    assert_redirected_to specimen_group_relationships_path
  end
end
