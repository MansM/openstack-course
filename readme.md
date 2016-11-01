## read this first

* change in provisioning/group_vars/all your personal user (this will be username and password)
* currently it will install newton-3 but you can revert back to mitaka-5 with changing the vars in the all file.
* vagrant up will probably fail, because of a yum error... vagrant provision until exit code 0
* After installatiom completes, do yourself a favor. Comment in provisioning/playbook.yaml the first and second block
* To check on progress: vagrant ssh -c "sudo tail -150f /var/log/messages" (aprox 450 sessions are required to finish install without failures)
* you need ansible 2.1 or more recent
* dont mess with ip's unless you really want to.... 
* I accept pull requests.