Gollum
======

Ansible Role to install a [Gollum Wiki](https://github.com/gollum/gollum)
on macOS / Mac OS X.

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
- hosts: wiki
  roles:
     - bjoernalbers.gollum
```

License
-------

MIT
