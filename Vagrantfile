Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
  else
    abort("Please install the hostmanager plugin, vagrant plugin install vagrant-hostmanager")
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.enable :yum
  end
  
  config.vm.box = "mansm/CentOS-7"
  config.ssh.insert_key = false

  config.vm.define "openstack" do |openstack|
    #openstack.ssh.insert_key = false
    openstack.vm.hostname = "openstack"
    openstack.vm.provider "virtualbox" do |vb|
      vb.name = "openstack"
      vb.customize ["modifyvm", :id, "--groups", "/openstacktest"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      vb.linked_clone = true
      vb.memory = "5500"
      vb.cpus = "2"
    end
    openstack.vm.network "private_network", ip: "192.168.4.2"
    
    openstack.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/playbook.yaml"
      ansible.sudo = true
      ansible.verbose = "v"
      ansible.host_key_checking = false
    end
  end
end