require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get choices_index_url
    assert_response :success
  end

  test "should get new" do
    get choices_new_url
    assert_response :success
  end

  test "should get edit" do
    get edit_choice_url(@choice)
    assert_response :success
  end

  test "should update choice" do
    patch choice_url(@choice), params: { choice: { choices: @choice.choices, correct_ans: @choice.correct_ans, word_id: @choice.word_id } }
    assert_redirected_to choice_url(@choice)
  end

  test "should destroy choice" do
    assert_difference('Choice.count', -1) do
      delete choice_url(@choice)
    end

    assert_redirected_to choices_url
  end
end
