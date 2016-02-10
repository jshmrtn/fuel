# Fuel

THIS PROJECT IS IN BETA STAGE.

This project is intended to use together with [jshmrtn/rokket](https://github.com/jshmrtn/rokket).

## Roadmap
* Removing fixed IP for local vagrant machine
* Better documentation
* Refactoring functionality into ansible-galaxy role

## Requirements

* Ansible >= 1.9.2 (**not** 2.0 which is in alpha) - [Install](http://docs.ansible.com/intro_installation.html) • [Docs](http://docs.ansible.com/) • [Windows docs](https://roots.io/trellis/docs/windows/)
* Virtualbox >= 4.3.10 - [Install](https://www.virtualbox.org/wiki/Downloads)
* Vagrant >= 1.5.4 - [Install](http://www.vagrantup.com/downloads.html) • [Docs](https://docs.vagrantup.com/v2/)

## Setup
1. Git clone this repo into a project root folder.
2. Git clone your site framework (like [jshmrtn/rokket](https://github.com/jshmrtn/rokket)) in to a folder named "site" next to the fuel folder.
3. Config the site framework to run properly.
4. Run `ansible-galaxy install -r requirements.yml` inside your Fuel directory to install external Ansible roles/packages.

## Config
1. Copy `vars/deployment_vars_local.yml.example` to `vars/deployment_vars_local.yml`.
2. Set your local variables in `vars/deployment_vars_local.yml`.
3. Copy `vars/deployment_vars.yml.example` to `vars/deployment_vars.yml`.
4. Set your project specific variables in `config/deploy/vars/deployment_vars.yml`.
5. Copy `hosts/*.example` to `hosts/*`.
6. Set your hostnames or IPs for the remote hosts in the hosts files.
7. Copy `group_vars/*.yml.example` to `group_vars/*.yml`.
8. Set your variables for the remote hosts in the group_vars files.

## Development
Run `vagrant up`

### Deployments
Run `./fuel.sh` to see instructions.

## Contributing

Contributions are welcome from everyone. We will add [contributing guidelines](CONTRIBUTING.md) as soon as possible.

## Credits

This project was inspired by the faboulus [roots/trellis](https://github.com/roots/trellis).
