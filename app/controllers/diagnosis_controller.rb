class DiagnosisController < ApplicationController
  def start
    # 診断ロジックの最初のステップをここに記述
    redirect_to questions_path # 仮に質問ページにリダイレクトする例
  end
end