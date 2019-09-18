namespace :dev do

  DEFAULT_PASSWORD = 123456
  
  desc "It configures the development environment."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping Database...") { %x(rails db:drop) }
      show_spinner("Creating Database...") { %x(rails db:create) }
      show_spinner("Migrating Database...") { %x(rails db:migrate) }
      show_spinner("Adding Default Admin...") { %x(rails dev:add_default_admin) }
      show_spinner("Adding Default User...") { %x(rails dev:add_default_user) }
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

  desc "Adiciona o Usuário Padrão"
  task add_default_user: :environment do
  User.create!(
    email: "user@user.com",
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD,
    ) 
  end

  private
  def show_spinner(start_msg, end_msg = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    yield
    sleep(1)
    spinner.success("(#{end_msg})")
  end

end
