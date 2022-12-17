5.times do |n|
User.create!(
  name: "user#{n+1}",
  email: "user#{n+1}@example.com",
  password: "password" )
end

5.times do |n|
  User.all.each do |user|
    Task.create!(user_id: user.id, name: "title#{n+1}", 
    causes_attributes: [content: "cause#{n+1}",
    solutions_attributes: [content: "solution#{n+1}"]])
  end
end  