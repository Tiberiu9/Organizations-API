require 'csv' # Calling the CSV library need to properly parse the CSV data
# require ".app/controllers/users_controller.rb"
puts 'Seeding...'



User.all.each do |user|
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'organizations.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    t = Organization.new
    t.name = row['Name']
    t.website = row['Website']
    t.country = row['Country']
    t.description = row['Description']
    t.founded = row['Founded']
    t.industry = row['Industry']
    t.employees_number = row['Number of employees']
    t.user_id = user.id
    t.save
    puts "#{t.name}, Country: #{t.country} saved"
    puts "email: #{user.email} and id: #{user.id}"
  end
  puts " email: #{user.email} and id: #{user.id} ----------------------------------------------------------------"
end

puts "Seeding done.There are now #{Organization.count} rows in the Organizations table -------------------------------------------"
