require "test_helper"

class VndasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vnda = vndas(:one)
  end

  test "should get index" do
    get vndas_url
    assert_response :success
  end

  test "should get new" do
    get new_vnda_url
    assert_response :success
  end

  test "should create vnda" do
    assert_difference("Vnda.count") do
      post vndas_url, params: { vnda: {  } }
    end

    assert_redirected_to vnda_url(Vnda.last)
  end

  test "should show vnda" do
    get vnda_url(@vnda)
    assert_response :success
  end

  test "should get edit" do
    get edit_vnda_url(@vnda)
    assert_response :success
  end

  test "should update vnda" do
    patch vnda_url(@vnda), params: { vnda: {  } }
    assert_redirected_to vnda_url(@vnda)
  end

  test "should destroy vnda" do
    assert_difference("Vnda.count", -1) do
      delete vnda_url(@vnda)
    end

    assert_redirected_to vndas_url
  end
end
