# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join("node_modules")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# /app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.css admins_backoffice.js users_backoffice.css users_backoffice.js )

# /vendor/assets
Rails.application.config.assets.precompile += %w( jquery-2.2.3/dist/jquery.js )
# /lib/assets
Rails.application.config.assets.precompile += %w( img.jpg )

# Admin Assets
Rails.application.config.assets.precompile += %w( admin_devise.js admin_devise.css )

# User Assets
Rails.application.config.assets.precompile += %w( user_devise.js user_devise.css )
