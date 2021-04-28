# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.create(id: 1, nickname: '坂上卓郎', title: 'ゾウの鼻はなぜ長いのですか？', content: '友人のキリンに質問され、うまく答えられなかったことから、こちらにて質問させていただきました。どなたかわかる方がいらっしゃれば教えてください。')
Question.create(id: 2, nickname: '太田憲治', title: '東京から福岡まで一番安く行くには？', content: '拾った明太子を届けるために東京から福岡まで行かなければなりません。一番安く行く方法を教えてください。')
Question.create(id: 3, nickname: '野口一郎', title: '卒業コンペの会場変更のお知らせ', content: '新型コロナウィルスの影響で、会場が変更になりました。')