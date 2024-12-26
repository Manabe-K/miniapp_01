class QuestionsController < ApplicationController
  def index
    # フォーム用に初期設定（結果はまだ表示しない）
    @sake = Sake.new
  end

  def search
    # 送信された検索条件に基づいて日本酒を絞り込む
    @results_sakes = Sake.all

    if params[:sake_meter_value_range].present?
      range = params[:sake_meter_value_range]
      case range
      when "大甘口:-6.0"
        @results_sakes = @results_sakes.where("sake_meter_value <= ?", -6.0)
      when "甘口:-5.9~ -3.5"
        @results_sakes = @results_sakes.where("sake_meter_value > ? AND sake_meter_value <= ?", -5.9, -3.5)
      when "やや甘口:-3.4~ -1.5"
        @results_sakes = @results_sakes.where("sake_meter_value > ? AND sake_meter_value <= ?", -3.4, -1.5)
      when "普通:-1.4~ 1.4"
        @results_sakes = @results_sakes.where("sake_meter_value > ? AND sake_meter_value <= ?", -1.4, 1.4)
      when "やや辛口:1.5~ 3.4"
        @results_sakes = @results_sakes.where("sake_meter_value > ? AND sake_meter_value <= ?", 1.5, 3.4)
      when "辛口:3.5~ 5.9"
        @results_sakes = @results_sakes.where("sake_meter_value > ? AND sake_meter_value <= ?", 3.5, 5.9)
      when "大辛口:6.0"
        @results_sakes = @results_sakes.where("sake_meter_value >= ?", 6.0)
      end
    end

    if params[:prefecture_area].present?
      area = params[:prefecture_area]
      case area
      when "北海道・東北"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 0, 6)
      when "関東"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 7, 13)
      when "中部"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 14, 22)
      when "近畿"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 23, 29)
      when "中国"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 30, 34)
      when "四国"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 35, 38)
      when "九州・沖縄"
        @results_sakes = @results_sakes.where("prefecture > ? AND prefecture <= ?", 39, 46)
      end
    end

    if params[:label_genre_type].present?
      type = params[:label_genre_type]
      case type
      when "オシャレ"
        @results_sakes = @results_sakes.where(label_genre: 1)
      when "文字だけ"
        @results_sakes = @results_sakes.where(label_genre: 2)
      end
    end

    # ランダムに5個取得
    @random_sakes = @results_sakes.order("RANDOM()").limit(5)

    # 残りの日本酒を取得
    @other_sakes = @results_sakes.where.not(id: @random_sakes.pluck(:id))
  end

  def other_sakes
    # search アクションで取得された条件を再利用
    @other_sakes = Sake.where(id: params[:ids]).page(params[:page]) if params[:ids].present?
  end
end
