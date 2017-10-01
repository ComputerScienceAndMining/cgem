require 'test_helper'

class TestTypeVersionsControllerTest < ActionController::TestCase
  setup do
    @test_type_version = test_type_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_type_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_type_version" do
    assert_difference('TestTypeVersion.count') do
      post :create, test_type_version: { data: @test_type_version.data, description: @test_type_version.description, name: @test_type_version.name, test_type_id: @test_type_version.test_type_id }
    end

    assert_redirected_to test_type_version_path(assigns(:test_type_version))
  end

  test "should show test_type_version" do
    get :show, id: @test_type_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_type_version
    assert_response :success
  end

  test "should update test_type_version" do
    patch :update, id: @test_type_version, test_type_version: { data: @test_type_version.data, description: @test_type_version.description, name: @test_type_version.name, test_type_id: @test_type_version.test_type_id }
    assert_redirected_to test_type_version_path(assigns(:test_type_version))
  end

  test "should destroy test_type_version" do
    assert_difference('TestTypeVersion.count', -1) do
      delete :destroy, id: @test_type_version
    end

    assert_redirected_to test_type_versions_path
  end
end
