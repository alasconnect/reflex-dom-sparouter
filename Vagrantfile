Vagrant.configure('2') do |config|
  config.vm.box = "nixos/nixos-18.03-x86_64"
  config.vm.hostname = 'reflex-dom-sparouter-dev'
  config.vm.network 'private_network', ip: '172.28.128.12'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 6144
    v.cpus = 2
    v.customize ["modifyvm", :id, "--audio", "none"]
    v.customize ["modifyvm", :id, "--vrde", "off"]
  end

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/src'

  # Formatting requires NixOS Vagrant Plugin
  config.vm.provision :nixos,
    run: 'always',
    path: "./vagrant/configuration.nix"

  config.vm.provision 'shell',
    path: './vagrant/provision.sh',
    privileged: false,
    binary: true

  config.vm.network 'forwarded_port',
    guest: 5432,
    host: 5432
end
