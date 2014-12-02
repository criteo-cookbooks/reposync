#
# Cookbook Name::	reposync
# Description::		Inspec test
# Recipe::				default_spec
# Author::        Jeremy MAURO (j.mauro@criteo.com)
#
#
#

describe package('yum-utils') do
  it { should be_installed }
end

%w(/etc/reposync.d /var/opt/reposync).each do |f|
  describe directory(f) do
    it { should be_directory }
    it { should be_owned_by 'root' }
  end
end
