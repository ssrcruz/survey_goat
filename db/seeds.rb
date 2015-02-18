# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Author.create(name: "Emperor Goatimus", email: "eg@tiy.com", password: "goat")

1000.times do
  Author.create(name: Faker::Name.name, email: Faker::Internet.email, password: "goat")

end

1000.times do
  response = Response.create(name:Faker::Lorem.words,
  response_text: Faker::Lorem.sentences,
  question_id: question,
  submission_id: i )
end

all_authors = Author.all
question_types = ["Yes/No", "Choice", "Short Answer", "Long Answer"]

1000.times do
  survey = Survey.create(title: Faker::Commerce.product_name,
                         description: "See above",
                         author: all_authors.sample)
  submission = Submission.create
  1000.times do |i|
    survey.questions << Question.create(order_number: i,
      question_type: question_types.sample,
      question_text: Faker::Company.bs + "?",
      description:   "See above",
      survey: survey )


      Response.create(question: question, submission: submission)
    # 1000.times do |i|
    #   survey.questions.response << Response.create(response_text: Faker::Lorem.words,
    #           question_id: i)
    # end
  end
end
