# Fuel

THIS PROJECT IS IN ALPHA STAGE.

## Roadmap
* Better documentation
* Refactoring functionality into ansible-galaxy role

## Requirements

* Ansible >= 1.9.2 (**not** 2.0 which is in alpha) - [Install](http://docs.ansible.com/intro_installation.html) • [Docs](http://docs.ansible.com/) • [Windows docs](https://roots.io/trellis/docs/windows/)
* Virtualbox >= 4.3.10 - [Install](https://www.virtualbox.org/wiki/Downloads)
* Vagrant >= 1.5.4 - [Install](http://www.vagrantup.com/downloads.html) • [Docs](https://docs.vagrantup.com/v2/)

## Development

### Setup
TBA

### Usage
TBA

## Deployments

### Setup
1. Copy `vars/deployment_vars_local.yml.example` to `vars/deployment_vars_local.yml`.
2. Set your local variables in `vars/deployment_vars_local.yml`.
3. Copy `vars/deployment_vars.yml.example` to `vars/deployment_vars.yml`.
4. Set your project specific variables in `config/deploy/vars/deployment_vars.yml`.

### Usage
Run `./fuel.sh` for instructions.

## Contributing

Contributions are welcome from everyone. We will add [contributing guidelines](CONTRIBUTING.md) as soon as possible.

## Credits

This project was inspired by the faboulus [roots/trellis](https://github.com/roots/trellis).
