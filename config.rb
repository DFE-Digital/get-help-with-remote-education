require 'html-proofer'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :relative_links, true

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end


# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

set :css_dir, "dist/stylesheets"
set :images_dir, "dist/images"
set :js_dir, "dist/javascripts"

activate :external_pipeline,
  name: :gulp,
  command: build? ? "./node_modules/gulp/bin/gulp.js" : "echo",
  source: ".tmp",
  latency: 1

after_build do |builder|
  HTMLProofer.check_directory(config[:build_dir], { :assume_extension => true }).run
end

configure :build do

  ignore "assets/*"
end
