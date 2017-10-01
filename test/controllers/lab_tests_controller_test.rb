require 'test_helper'

class LabTestsControllerTest < ActionController::TestCase
  setup do
    @lab_test = lab_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lab_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lab_test" do
    assert_difference('LabTest.count') do
      post :create, lab_test: { data: @lab_test.data, description: @lab_test.description, ended_at: @lab_test.ended_at, name: @lab_test.name, specimen_id: @lab_test.specimen_id, started_at: @lab_test.started_at, test_status_id: @lab_test.test_status_id, test_type_id: @lab_test.test_type_id, test_type_version_id: @lab_test.test_type_version_id, tested_by_id: @lab_test.tested_by_id, work_order_id: @lab_test.work_order_id }
    end

    assert_redirected_to lab_test_path(assigns(:lab_test))
  end

  test "should show lab_test" do
    get :show, id: @lab_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lab_test
    assert_response :success
  end

  test "should update lab_test" do
    patch :update, id: @lab_test, lab_test: { data: @lab_test.data, description: @lab_test.description, ended_at: @lab_test.ended_at, name: @lab_test.name, specimen_id: @lab_test.specimen_id, started_at: @lab_test.started_at, test_status_id: @lab_test.test_status_id, test_type_id: @lab_test.test_type_id, test_type_version_id: @lab_test.test_type_version_id, tested_by_id: @lab_test.tested_by_id, work_order_id: @lab_test.work_order_id }
    assert_redirected_to lab_test_path(assigns(:lab_test))
  end

  test "should destroy lab_test" do
    assert_difference('LabTest.count', -1) do
      delete :destroy, id: @lab_test
    end

    assert_redirected_to lab_tests_path
  end
end
