class PagesController < ApplicationController
  def home
    # ランダムに5つの酒データを取得
    @random_sakes = Sake.order('RANDOM()').limit(5)
  end
end