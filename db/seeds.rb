Dir.glob('app/assets/images/seed_images/avatars/*') do |photo|
	user = User.new({
		:name => Faker::Name.name,
		:username => Faker::Internet.user_name,
		:email => Faker::Internet.email,
		:bio => Faker::Lorem.paragraph(3),
		:phone_number => Faker::PhoneNumber.phone_number,
		:gender => ['male', 'female'].sample,
		:password => "123123",
		:avatar => File.open(photo)
	})

	if user.save
		puts "Created User Number #{user.id}"
	else
		puts "ERROR:::=>> #{user.errors.full_messages}"
	end

end


users_ids = User.ids

Dir.glob('app/assets/images/seed_images/posts/*') do |photo|
	
 	post = Post.new({
 		:media => File.open(photo),
 		:caption => Faker::Lorem.paragraph(2),
 		:user_id => users_ids.sample
 	})

	if post.save
	 	puts "Created Post #{post.id}"
	else
	 	puts "ERROR:::=>> #{post.errors.full_messages}"
	end	
end

