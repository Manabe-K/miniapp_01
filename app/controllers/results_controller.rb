class ResultsController < ApplicationController
  def show
    user_answers = session[:user_answers]

    # 診断ロジック
    @recommended_sakes = recommend_sakes(user_answers)
  end

  private

  def recommend_sakes(answers)
    Sake.where(taste: answers[0], sweetness: answers[1]).limit(3)
  end
end
