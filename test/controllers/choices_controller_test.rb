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
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
    get choices_edit_url
    assert_response :success
  end

>>>>>>> daf2e205ee3cf838ce7b3551f459031db470a272
=======
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
>>>>>>> e52d662471eb215d8ab2afdc47dc8c2ea03a9c65
end
