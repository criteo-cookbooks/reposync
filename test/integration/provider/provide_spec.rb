#
# Cookbook Name::	reposync
# Description::		Inspec test
# Recipe::				default_spec
# Author::        Jeremy MAURO (j.mauro@criteo.com)
#
#
#

libcouchbase2_rpm = ::File.join('/var', 'opt', 'reposync', 'couchbase', 'libcouchbase2-core-*.x86_64.rpm')
describe command("ls #{libcouchbase2_rpm}") do
  its('exit_status') { should eq 0 }
end

%w(/etc/reposync.d/couchbase).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end
