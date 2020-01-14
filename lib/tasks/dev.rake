namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')
  
  desc "It configures the development environment."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping Database...") { %x(rails db:drop) }
      show_spinner("Creating Database...") { %x(rails db:create) }
      show_spinner("Migrating Database...") { %x(rails db:migrate) }
      show_spinner("Adding Default Admin...") { %x(rails dev:add_default_admin) }
      show_spinner("Adding Test Admins...") { %x(rails dev:add_extra_admins) }
      show_spinner("Adding Default User...") { %x(rails dev:add_default_user) }
      show_spinner("Adding Default Subjects...") { %x(rails dev:add_subjects) }
      # %x(rails dev:add_mining_types)      
    else
      puts "You are not in development mode, this action is forbidden."
    end
  end

  desc "Adiciona o Administrador Padrão"
  task add_default_admin: :environment do
  Admin.create!(
    email: "admin@admin.com",
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD,
    ) 
  end

  desc "Adiciona Administradores Teste"
  task add_extra_admins: :environment do
    10.times do 
    Admin.create!(
      email: Faker::Internet.email,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
      )
    end 
  end

  desc "Adiciona o Usuário Padrão"
  task add_default_user: :environment do
  User.create!(
    email: "user@user.com",
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD,
    ) 
  end

  desc "Adiciona Os Assuntos Padrão"
    task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
  
    File.open(file_path, 'r').each do |line|
    Subject.create!(description: line.strip)
    end
  end


  private
  def show_spinner(start_msg, end_msg = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    yield
    sleep(1)
    spinner.success("(#{end_msg})")
  end

end
