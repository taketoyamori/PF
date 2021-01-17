#〇〇用データ

#サンプルユーザー
User.create!(
  profile_image: open("./app/assets/images/user_sample2.jpg"),
  name: "sampleman",
  email: "sample@gmail.com",
  password: "sample11111",
  age: 25,
  introduction: "よろしくお願いします！",
  instagram: "sss",
  twitter: "sss",
  line: "xxxxx" )


# 管理者
Admin.create!(email: "test@gmail.com", password: "testtest")


# Prefecuturesテーブルに都道府県名作成(JIS規格 県名コード順)
Prefecture.create!(name: "北海道")
Prefecture.create!(name: "青森県")
Prefecture.create!(name: "岩手県")
Prefecture.create!(name: "宮城県")
Prefecture.create!(name: "秋田県")
Prefecture.create!(name: "山形県")
Prefecture.create!(name: "福島県")
Prefecture.create!(name: "茨城県")
Prefecture.create!(name: "栃木県")
Prefecture.create!(name: "群馬県")
Prefecture.create!(name: "埼玉県")
Prefecture.create!(name: "千葉県")
Prefecture.create!(name: "東京都")
Prefecture.create!(name: "神奈川県")
Prefecture.create!(name: "新潟県")
Prefecture.create!(name: "富山県")
Prefecture.create!(name: "石川県")
Prefecture.create!(name: "福井県")
Prefecture.create!(name: "山梨県")
Prefecture.create!(name: "長野県")
Prefecture.create!(name: "岐阜県")
Prefecture.create!(name: "静岡県")
Prefecture.create!(name: "愛知県")
Prefecture.create!(name: "三重県")
Prefecture.create!(name: "滋賀県")
Prefecture.create!(name: "京都府")
Prefecture.create!(name: "大阪府")
Prefecture.create!(name: "兵庫県")
Prefecture.create!(name: "奈良県")
Prefecture.create!(name: "和歌山県")
Prefecture.create!(name: "鳥取県")
Prefecture.create!(name: "島根県")
Prefecture.create!(name: "岡山県")
Prefecture.create!(name: "広島県")
Prefecture.create!(name: "山口県")
Prefecture.create!(name: "徳島県")
Prefecture.create!(name: "香川県")
Prefecture.create!(name: "愛媛県")
Prefecture.create!(name: "高知県")
Prefecture.create!(name: "福岡県")
Prefecture.create!(name: "佐賀県")
Prefecture.create!(name: "長崎県")
Prefecture.create!(name: "熊本県")
Prefecture.create!(name: "大分県")
Prefecture.create!(name: "宮崎県")
Prefecture.create!(name: "鹿児島県")
Prefecture.create!(name: "沖縄県")

#ブログテストデータ
20.times do |n|
  Post.create!(
    admin_id: 1,
    title: "ゴルフコンペ",
    body: "コンペ開催します",
    post_image: open("./app/assets/images/no_event_image.jpg")
  )
end

#イベントテストデータ
20.times do |n|
  Event.create!(
    user_id: 1,
    prefecture_id: 1,
    title: "ゴルフコンペ",
    introduction: "コンペ開催します",
    event_image: open("./app/assets/images/event_sample2.jpg"),
    date: "2021-01-28"
  )
end

#ユーザーテストデータ
20.times do |n|
  User.create!(
    name: "#{n + 1}testman",
    email: "testmail#{n + 1}@gmail.com",
    password: "#testpass#{n + 1}",
    age: 30,
    introduction: "よろしく",
    profile_image: open("./app/assets/images/user_sample2.jpg"),
    instagram: "https://www.instagram.com/",
    twitter: "https://twitter.com/",
    line: "xxxxx",
    is_deleted: false
  )
end

