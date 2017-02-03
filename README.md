Ansible Role: Gollum
====================

[![Build Status](https://travis-ci.org/bjoernalbers/ansible-role-gollum.svg?branch=master)](https://travis-ci.org/bjoernalbers/ansible-role-gollum)

Install [Gollum Wiki](https://github.com/gollum/gollum) on macOS / Mac OS X.

Requirements
------------

- recent version of Xcode
- Xcode's command line tools (`xcode-select --install`)
- [Mac Homebrew](http://brew.sh)

Role Variables
--------------

```yaml
gollum_host: 127.0.0.1
gollum_port: 4567
```

Dependencies
------------

[bjoernalbers.rubygems](https://galaxy.ansible.com/bjoernalbers/rubygems/)

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
     - bjoernalbers.gollum
```

Development
-----------

1. Clone this repo and `cd` into it
2. Install required roles: `ansible-galaxy install -r requirements.yml -p ..`
3. Run the test playbook: `ansible-playbook tests/test.yml -K`
4. Start hacking...

License
-------

MIT
