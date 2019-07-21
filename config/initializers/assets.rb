# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

#app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js admins_backoffice.css )
Rails.application.config.assets.precompile += %w( admin_devise.js admin_devise.css )
Rails.application.config.assets.precompile += %w( users_backoffice.js users_backoffice.css )
Rails.application.config.assets.precompile += %w( site.js site.css )

#lib/assets
Rails.application.config.assets.precompile += %w( sb-admin-2.js sb-admin-3.css sb-admin-2.css)
Rails.application.config.assets.precompile += %w( creative.js creative.css googlefonts.css googlefonts2.css)
Rails.application.config.assets.precompile += %w( bg-masthead.jpg 1.jpg 2.jpg 3.jpg 4.jpg 5.jpg 6.jpg undraw_posting_photo.svg)

