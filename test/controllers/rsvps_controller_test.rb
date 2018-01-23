require 'test_helper'

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rsvp = rsvps(:one)
  end

  test "should get index" do
    get rsvps_url, as: :json
    assert_response :success
  end

  test "should create rsvp" do
    assert_difference('Rsvp.count') do
      post rsvps_url, params: { rsvp: { comment: @rsvp.comment, email: @rsvp.email, plus_one: @rsvp.plus_one, plus_one_entree: @rsvp.plus_one_entree } }, as: :json
    end

    assert_response 201
  end

  test "should show rsvp" do
    get rsvp_url(@rsvp), as: :json
    assert_response :success
  end

  test "should update rsvp" do
    patch rsvp_url(@rsvp), params: { rsvp: { comment: @rsvp.comment, email: @rsvp.email, plus_one: @rsvp.plus_one, plus_one_entree: @rsvp.plus_one_entree } }, as: :json
    assert_response 200
  end

  test "should destroy rsvp" do
    assert_difference('Rsvp.count', -1) do
      delete rsvp_url(@rsvp), as: :json
    end

    assert_response 204
  end
end
