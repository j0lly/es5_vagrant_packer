Vagrant.configure(2) do |config|
	config.vm.define "es_node" do |es|
		es.vm.box = "ubuntu/xenial64"
            es.vm.provision "file", source: "scripts", destination: "/tmp"
      		es.vm.provision "shell", path: "bootstrap.sh", env: {"OS" => "ubuntu"}
            es.vm.provision "file", source: "puppet/hieradata", destination: "/tmp"
            es.vm.provision :puppet, run: "always" do |puppet|
                puppet.manifests_path = "puppet/manifests"
                puppet.manifest_file  = "default.pp"
                puppet.module_path = 'puppet/modules'
                puppet.hiera_config_path = 'puppet/hiera.yaml'
                puppet.working_directory = "/tmp/vagrant-puppet"
                puppet.options="--verbose"
            end
	end
end
