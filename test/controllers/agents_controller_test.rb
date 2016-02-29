require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agents)
  end

  test "should create agent" do
    assert_difference('Agent.count') do
      post :create, agent: { name: @agent.name, token: @agent.token }
    end

    assert_response 201
  end

  test "should show agent" do
    get :show, id: @agent
    assert_response :success
  end

  test "should update agent" do
    put :update, id: @agent, agent: { name: @agent.name, token: @agent.token }
    assert_response 204
  end

  test "should destroy agent" do
    assert_difference('Agent.count', -1) do
      delete :destroy, id: @agent
    end

    assert_response 204
  end
end
