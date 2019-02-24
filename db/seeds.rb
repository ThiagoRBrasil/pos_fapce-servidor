10.times do
	Product.create({
		name: Faker::Book.title,
		quantity: Faker::Number.number(3)	
	})
end