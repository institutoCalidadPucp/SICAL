source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

#Pg is the Ruby interface to the {PostgreSQL RDBMS}
gem 'pg', '~> 0.20.0'

#This is a Rails gem for conveniently manage multiple nested models in a single form. It does so in an unobtrusive way through jQuery or Prototype.
gem "nested_form"
gem "cocoon"

#Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.3'

#Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins
gem 'awesome_print', '~> 1.7'

#Autoprefixer for RoR. This will add the vendor prefixer of each browser in the styles
gem 'autoprefixer-rails', '~> 7.1.1'

#Util library with awesome fonts
gem 'font-awesome-rails', '~> 4.7.0.2'

#The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web
gem 'bootstrap', '~> 4.0.0.alpha6'

source 'http://insecure.rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

#Jquery, you know the drill
gem 'jquery-rails', '~> 4.3.1' 

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Generating documents
gem 'prawn'
gem 'prawn-table'
#gem 'prawn/table'
gem 'barby'
#gem 'barby/barcode/code_39'
#gem 'barby/outputter/prawn_outputter'
#gem 'rmagick', '~> 2.16.0'
gem 'carrierwave'
