module ApplicationHelper
  def default_meta_tags
    {
      site: "日本酒探訪",
      title: "全国の日本酒を探そう",
      reverse: true,
      charset: "utf-8",
      description: "日本酒探訪では、全国の日本酒を都道府県別や種類ごとに簡単に検索できます。お気に入りの日本酒を見つけてみませんか？",
      keywords: "日本酒,酒蔵,都道府県,全国,地酒,探す",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: "日本酒探訪",
        title: "全国の日本酒を探そう",
        description: "日本酒探訪では、全国の日本酒を都道府県別や種類ごとに簡単に検索できます。お気に入りの日本酒を見つけてみませんか？",
        type: "website",
        url: request.original_url,
        image: image_url("ogp_sake.png"), # 配置するパスやファイル名に合わせて変更
        local: "ja-JP"
      },
      # Twitter用の設定
      twitter: {
        card: "summary_large_image",
        site: "@nihonshu_tanbou", # アプリの公式Twitterアカウントがあれば追加
        image: image_url("ogp_sake.png") # 配置するパスやファイル名に合わせて変更
      }
    }
  end
end
