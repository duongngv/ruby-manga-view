User.create!(
  name: "Admin User",
  email: "admin@gmail.com",
  password: "admin123",
  password_confirmation: "admin123",
  is_admin: true,
)
User.create!(
  name: "Normal User",
  email: "example@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: false,
)

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name: name,
    email: email,
    remote_avatar_user_url: "https://randomuser.me/api/portraits/#{["men", "women"].sample}/#{n}.jpg",
    password: password,
    password_confirmation: password,
  )
end

name_categories = ["Action", "School life", "Adventure", "Shoune", "Anime", "Ecchi",
                   "Magic", "Detective", "Drama", "Fantasy", "Romance"]
name_categories.each do |category|
  name = category
  Category.create!(name: name)
end

50.times do
  Comic.create!(
    name: Faker::Book.title,
    author: Faker::Book.author,
    description: Faker::Food.description,
    publish_date: Faker::Time.between("2000-01-01", Time.now),
    views: Faker::Number.between(1, 1000) * 789,
    status: Faker::Number.between(0, 3),
    category_id: Faker::Number.between(Category.first.id, Category.last.id),
    remote_thumb_url: "https://fakeimg.pl/720x960/"
  )
end

Comic.create!(
  name: "ONE PIECE - ĐẢO HẢI TẶC",
  author: "Eiichiro Oda",
  description: "One Piece là câu truyện kể về Luffy và các thuyền viên của mình. Khi còn nhỏ, Luffy ước mơ trở thành Vua Hải Tặc. Cuộc sống của cậu bé thay đổi khi cậu vô tình có được sức mạnh có thể co dãn như cao su, nhưng đổi lại, cậu không bao giờ có thể bơi được nữa. Giờ đây, Luffy cùng những người bạn hải tặc của mình ra khơi tìm kiếm kho báu One Piece, kho báu vĩ đại nhất trên thế giới. Trong One Piece, mỗi nhân vật trong đều mang một nét cá tính đặc sắc kết hợp cùng các tình huống kịch tính, lối dẫn truyện hấp dẫn chứa đầy các bước ngoặt bất ngờ và cũng vô cùng hài hước đã biến One Piece trở thành một trong những bộ truyện nổi tiếng nhất không thể bỏ qua. Hãy đọc One Piece để hòa mình vào một thế giới của những hải tặc rộng lớn, đầy màu sắc, sống động và thú vị, cùng đắm chìm với những nhân vật yêu tự do, trên hành trình đi tìm ước mơ của mình.",
  publish_date: "2009-02-19",
  views: 922428593,
  status: 2,
  category_id: 1,
)
Comic.create!(
  name: "Onepunch Man",
  author: "Murata Yuusuke",
  description: "Onepunch-Man là một Manga thể loại siêu anh hùng với đặc trưng phồng tôm đấm phát chết luôn… Lol!!! Nhân vật chính trong Onepunch-man là Saitama, một con người mà nhìn đâu cũng thấy \“tầm thường\”, từ khuôn mặt vô hồn, cái đầu trọc lóc, cho tới thể hình long tong. Tuy nhiên, con người nhìn thì tầm thường này lại chuyên giải quyết những vấn đề hết sức bất thường. Anh thực chất chính là một siêu anh hùng luôn tìm kiếm cho mình một đối thủ mạnh. Vấn đề là, cứ mỗi lần bắt gặp một đối thủ tiềm năng, thì đối thủ nào cũng như đối thủ nào, chỉ ăn một đấm của anh là… chết luôn. Liệu rằng Onepunch-Man Saitaman có thể tìm được cho mình một kẻ ác dữ dằn đủ sức đấu với anh? Hãy theo bước Saitama trên con đường một đấm tìm đối cực kỳ hài hước của anh!!",
  publish_date: "2014-12-23",
  views: 100,
  status: 2,
  category_id: 1,
)
Comic.create!(
  name: "Attack On Titan",
  author: "Hajime Isayama",
  description: "Hơn 100 năm trước, giống người khổng lồ Titan đã tấn công và đẩy loài người tới bờ vực tuyệt chủng. Những con người sống sót tụ tập lại, xây bao quanh mình 1 tòa thành 3 lớp kiên cố và tự nhốt mình bên trong để trốn tránh những cuộc tấn công của người khổng lồ. Họ tìm mọi cách để tiêu diệt người khổng lồ nhưng không thành công. Và sau 1 thế kỉ hòa bình, giống khổng lồ đã xuất hiện trở lại, một lần nữa đe dọa sự tồn vong của con người....  Elen và Mikasa phải chứng kiến một cảnh tượng cực kinh khủng - mẹ của mình bị ăn thịt ngay trước mắt. Elen thề rằng cậu sẽ giết tất cả những tên khổng lồ mà cậu gặp.....",
  publish_date: "2001-02-02",
  views: 100,
  status: 2,
  category_id: 1,
)
Comic.create!(
  name: "Nanatsu No Taizai",
  author: "Suzuki Nakaba",
  description: "\“Thất đại ác nhân\”, một nhóm chiến binh có tham vọng lật đổ vương quốc Britannia, được cho là đã bị tiêu diệt bởi các \“hiệp sĩ thánh chiến\” mặc dù vẫn còn 1 số người cho rằng họ vẫn còn sống. 10 năm sau, Các hiệp sĩ thánh chiến đã làm 1 cuộc đảo chính và khống chế đức vua, họ trở thành người cai trị độc tài mới của vương quốc. Elizabeth, con gái duy nhất của nhà vua, đã lên đường tìm \“thất đại ác nhân\” để nhờ họ tái chiếm lại vương quốc. Công chúa có thành công trong việc tìm kiếm \“thất đại ác nhân\”, các \“hiệp sĩ thánh chiến\” sẽ làm gì để ngăn chăn cô? xem các chap truyện sau sẽ rõ.",
  publish_date: "2019-02-02",
  views: 100,
  status: 0,
  category_id: 1,
)
