namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando administradores extras...") { %x(rails dev:add_extra_admins) }
      show_spinner("Cadastrando usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando usuários extras...") { %x(rails dev:add_extra_users) }
      show_spinner("Criando sala padrão...") { %x(rails dev:create_room) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      name: 'admin',
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        name:  Faker::Name.name,
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      name: 'user',
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona usuários extras"
  task add_extra_users: :environment do
    10.times do |i|
      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Cria sala padrão"
  task create_room: :environment do
    Room.create!(
      name: 'pat-40',
      location: 'Pavilhão João Calmon - UNB',
      capacity: 40          
    )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
