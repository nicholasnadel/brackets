100.times do
    Bracket.create({
        title: Faker::Book.title
    })
end