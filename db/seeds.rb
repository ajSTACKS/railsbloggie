User.create!(
  email: "test@test.com",
  password: "aloha50",
  password_confirmation: "aloha50",
  name: "Admin User",
  roles: "site_admin"
)
puts "1 admin user created"

User.create!(
  email: "test2@test.com",
  password: "aloha60",
  password_confirmation: "aloha60",
  name: "Regular User",

)
puts "1 regular user created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
puts "3 topics made"
10.times do |blog|
 Blog.create!(
   title: "this is my rails #{blog}",
   body: "Asymmetrical vegan yr williamsburg fam cronut. Slow-carb synth live-edge hexagon tumeric hammock. Pug health goth farm-to-table, raclette keffiyeh hammock pop-up try-hard blog listicle lyft hexagon hella. Jean shorts freegan meh enamel pin slow-carb, YOLO",
   topic_id: Topic.last.id
 )
end
 puts "10 blog post created"

5.times do |portfolio_item|
  Portfolio.create!(
    title: "we looped portfolio #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Tbh master cleanse normcore, polaroid cred art party etsy aesthetic glossier fixie raclette pabst chambray seitan.",
    main_img: "http://via.placeholder.com/600x400",
    thumb_img: "http://via.placeholder.com/350x100"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "we looped portfolio #{portfolio_item}",
    subtitle: "react Native",
    body: "Tbh master cleanse normcore, polaroid cred art party etsy aesthetic glossier fixie raclette pabst chambray seitan.",
    main_img: "http://via.placeholder.com/600x200",
    thumb_img: "http://via.placeholder.com/350x100"
  )
end
puts "6 portfolios created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 77
  )
end

puts "created a skill 5 times"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}",

  )
end
puts "3 technologies created"
