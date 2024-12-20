class QuestionsController < ApplicationController
  def index
    @questions = [
      { id: 1, text: 'どんな味わいが好きですか？', options: ['フルーティー', '濃厚', '軽快'] },
      { id: 2, text: '甘口と辛口、どちらが好みですか？', options: ['甘口', '辛口'] },
      { id: 3, text: 'どんな料理と合わせたいですか？', options: ['魚料理', '肉料理', '和食全般'] }
    ]
  end

  def submit
    # ユーザーの回答をセッションやパラメータで受け取る
    user_answers = params[:answers]

    # 診断結果を計算してセッションに保存
    session[:user_answers] = user_answers
    redirect_to results_path
  end
end
