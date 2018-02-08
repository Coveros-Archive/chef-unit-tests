require 'spec_helper'

describe 'apache::default' do
  platforms = {
    'ubuntu' => {
      versions: %w(14.04 16.04),
      package: 'apache2',
    },
    'centos' => {
      versions: %w(5.11 6.9 7.4.1708),
      package: 'httpd',
    },
  }

  platforms.each do |platform, values|
    values[:versions].each do |version|
      context "On #{platform} #{version}" do
        let(:chef_run) { ChefSpec::SoloRunner.new(platform: platform, version: version).converge(described_recipe) }

        it 'installs Apache package' do
          expect(chef_run).to install_package(values[:package])
        end

        it 'creates the home page' do
          expect(chef_run).to create_template('/var/www/html/index.html')
        end
      end
    end
  end
end
