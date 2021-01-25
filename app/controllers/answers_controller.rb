class AnswersController < ApplicationController
  before_action :find_category
  def index

  end

  def new
    @words =  @category.words.paginate(page:params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @word = @category.words.find(params[:word_id])
    @answers = @lesson.answers.build(answer_params)

    if @lesson.save
      unless params[:page].empty?
        redirect_to new_category_lesson_answer_url(@category, @lesson, page: params[:page])
      else
        result = 0
        @lesson.answers.each do |answer|
          if answer.choice.correct_ans?
            result += 1
          end # The end of if 
          @lesson.update_attributes(:result =>result, :is_completed => true)
          @lesson.create_activity(user_id: current_user.id)
        end # end of each do
        redirect_to category_lesson_url(@category, @lesson)
      end # end of unless
    end # end of if
  end # end of create

  private
  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end
