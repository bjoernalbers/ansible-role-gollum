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

None.

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

License
-------

MIT
