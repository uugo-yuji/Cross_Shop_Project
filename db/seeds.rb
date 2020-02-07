# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  (1..50).each do |i|
    Board.create(title: "タイトル#{i}", body: "本文#{i}")
  end

  Tag.create([
    { name: 'クロス' },
    { name: '柄物クロス' },
    { name: 'CF' }
  ])

  Area.create([
    { name: '全国' },
    { name: '北海道地域' },
    { name: '東北地域' },
    { name: '関東地域' },
    { name: '中部地域' },
    { name: '近畿地域' },
    { name: '中国地域' },
    { name: '四国地域' },
    { name: '九州・沖縄地域' }
  ])
end