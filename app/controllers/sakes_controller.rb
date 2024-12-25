class SakesController < ApplicationController
  def index
    if params[:prefecture]
      @sakes = Sake.where(prefecture: params[:prefecture]).page(params[:page])
      @random_sakes = @sakes.order('RANDOM()').limit(5)
      @prefecture_name = Sake.prefectures.keys[params[:prefecture].to_i].capitalize
    else
      @sakes = Sake.all.page(params[:page])
      @random_sakes = @sakes.order('RANDOM()').limit(5)
      @prefecture_name = "全国"
    end
  end

  def new
    @sake = Sake.new
  end

  def create
    # sake_meter_valueがnilまたは空の場合はデフォルト値を設定
    sake_meter_value = params[:sake][:sake_meter_value].presence || '0'
    
    # 数値に変換（+3.0や-2.5などの形式を処理）
    sake_meter_value = sake_meter_value.gsub(/[^0-9.-]/, '')  # +も含める、-と.を許可
    
    # 入力値が不正でないかチェック（例えば - と . の重複）
    if sake_meter_value.count('-') > 1 || sake_meter_value.count('.') > 1
      flash[:error] = '不正な入力です。数字、-、.のみを使用してください。'
      render :new and return
    end
  
    @sake = Sake.new(sake_params.merge(sake_meter_value: sake_meter_value.to_f))
  
    if @sake.save
      redirect_to sake_path(@sake)
    else
      render :new
    end
  end

  def show
    @sake = Sake.find(params[:id])
    @prefecture = params[:prefecture] # ここで都道府県を受け取る
    # 都道府県に関連する他の処理（例えば、同じ都道府県の酒を表示するなど）
    @sakes_in_prefecture = Sake.where(prefecture: @prefecture) if @prefecture.present?
  end

  private

  def sake_params
    params.require(:sake).permit(:type_of_sake, :name, :price, :prefecture, :label_image, :label_image_cache, :label_genre, :sake_meter_value)
  end
end