namespace :fake_data do
  desc "TODO"
  task notices: :environment do
    ap user = User.find_by_email("evansenter@gmail.com")
    
    20.times do
      ap user.notices.create(title: Faker::Lorem.sentence, body: 3.times.map { Faker::Lorem.paragraph(10) }.join("\n\n"))
    end
  end
end
