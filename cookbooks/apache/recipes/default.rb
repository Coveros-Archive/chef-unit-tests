# Install Apache
package value_for_platform(
  %w(centos redhat suse fedora) => {
    'default' => 'httpd',
  },
  %w(ubuntu debian) => {
    'default' => 'apache2',
  }
)

# Set up the home page
template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(name: 'Chef Summit')
end
