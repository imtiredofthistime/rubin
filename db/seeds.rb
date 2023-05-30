# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
# клініки
100.times do
  Clinic.create(
    name: Faker::Company.name,
    owner: Faker::Name.name
  )
end

100.times do
  Department.create(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase ,
    clinic_id: Faker::Number.between(from: 1, to: 100)
  )
end
ActiveRecord::Base.connection.execute("INSERT INTO \"specialties\" (\"name\") VALUES ('Акушер-гінеколог'), ('Алерголог-імунолог'), ('Андролог'), ('Анестезіолог-реаніматолог'), ('Ароматерапевт'), ('Бактеріолог'), ('Венеролог'), ('Вертебролог'), ('Лікар швидкої допомоги'), ('Лікар функціональної діагностики (Функціональний діагност)'), ('Гастроентеролог'), ('Гематолог'), ('Геріатр (Геронтолог)'), ('Гірудотерапевт'), ('Гомеопат'), ('Дерматолог'), ('Дієтолог'), ('Інфекціоніст'), ('Кардіолог'), ('Кардіохірург'), ('Кінезітерапевт'), ('Комбустіолог (Опіковий хірург)'), ('Косметолог'), ('Мамолог (Онколог-мамолог)'), ('Мануальний терапевт (Мануальщик/ Остеопат)'), ('Медична сестра (Медсестра)'), ('Міколог'), ('Нарколог'), ('Невролог (Невропатолог)'), ('Нейрохірург'), ('Неонатолог'), ('Нефролог'), ('Нутриціолог'), ('Онколог (Хірург - онколог)'), ('Ортопед'), ('Оториноларинголог (отоларинголог, ЛОР)'), ('Офтальмолог (Окуліст)'), ('Патологоанатом'), ('Педіатр'), ('Подолог'), ('Провізор'), ('Проктолог'), ('Психіатр'), ('Психотерапевт'), ('Пульмонолог'), ('Радіолог'), ('Реабілітолог'), ('Ревматолог'), ('Рентгенолог'), ('Рефлексотерапевт'), ('Сексолог (Сексопатолог)'), ('Сімейний лікар'), ('Спеціаліст із клітинних технологій'), ('Спортивний лікар'), ('Стоматолог (Дантист)'), ('Терапевт'), ('Токсиколог'), ('Травматолог'), ('Трансплантолог'), ('Уролог'), ('Фармацевт'), ('Фоніатр'), ('Фтизіатр'), ('Хірург'), ('Ембріолог'), ('Ендокринолог'), ('Ендоскопіст'), ('Епідеміолог'), ('Ефферентолог')")
specialty_amount = Specialty.all.length
100.times do
  Doctor.create(name: Faker::Name.name, surname: Faker::Name.middle_name, department_id: Faker::Number.between(from: 1, to: 100), specialty_id: Faker::Number.between(from: 1, to: specialty_amount))
end
100.times do |index|
  ActiveRecord::Base.connection.execute("INSERT INTO patient_cards(clinic_id, name, address, created_at, updated_at) VALUES (#{Faker::Number.between(from: 1, to: 100)}, '#{Faker::Name.first_name}', '123 Main St', '2023-01-01 00:00:00', '2023-01-01 00:00:00')")
  ActiveRecord::Base.connection.execute("INSERT INTO patients(patient_card_id, name, email) VALUES (#{index+1}, '#{Faker::Name.first_name}', '#{Faker::Internet.email}')")
end
# ActiveRecord::Base.connection.execute("INSERT INTO doctors(name, surname, department_id, specialty_id) VALUES  (#{Faker}")
