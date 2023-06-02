require 'faker'

100.times do
  Clinic.create(
    name: Faker::Company.name,
    owner: Faker::Name.name,
    year: Faker::Number.between(from: 1900, to: 2021),
    city: Faker::Address.city,
    mortality: Faker::Number.between(from: 0, to: 100),
    facility_type: 'hospital'
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
  Doctor.create(name: Faker::Name.first_name, surname: Faker::Name.middle_name, department_id: Faker::Number.between(from: 1, to: 100), specialty_id: Faker::Number.between(from: 1, to: specialty_amount))
end
100.times do |index|
  ActiveRecord::Base.connection.execute("INSERT INTO patient_cards(clinic_id, name, address, created_at, updated_at) VALUES (#{Faker::Number.between(from: 1, to: 100)}, '#{Faker::Name.first_name}', '#{Faker::Address.street_name.delete('\'')}', '2023-01-01 00:00:00', '2023-01-01 00:00:00')")
  ActiveRecord::Base.connection.execute(
    "INSERT INTO patients(patient_card_id, name, surname, email, age)
        VALUES (#{index+1},
        '#{Faker::Name.first_name.sub('\'', '')}',
        '#{Faker::Name.last_name.sub('\'', '')}',
        '#{Faker::Internet.email}',
        #{Faker::Number.between(from: 18, to: 60)})")
end

500.times do
  DoctorPatient.create(doctor_id: Faker::Number.between(from: 1, to: 100), patient_id: Faker::Number.between(from: 1, to: 100))
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?