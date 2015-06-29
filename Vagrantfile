Vagrant.configure(2) do |config|

  config.vm.define :laravel do |laravel|
    laravel.vm.box = "precise32"
    laravel.vm.box_url = "http://files.vagrantup.com/precise32.box"
    laravel.vm.provision :shell, path: "sh/laravel.sh"
    laravel.vm.synced_folder "www", "/home/vagrant/www"
    laravel.vm.network :forwarded_port, guest: 80, host: 8080
    laravel.vm.network :forwarded_port, guest: 5432, host: 5432
    laravel.vm.network :forwarded_port, guest: 3306, host: 3306
    laravel.vm.network :forwarded_port, guest: 4000, host: 4000
  end
   
end
