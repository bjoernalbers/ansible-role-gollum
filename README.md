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

### `gollum_bind`

Defines which socket gollum will bind to which is by default...

```yaml
gollum_bind: tcp://127.0.0.1:4567
```

You can use anything that [Puma](http://puma.io) would accept for
[Binding TCP / Sockets](https://github.com/puma/puma#binding-tcp--sockets),
even to UNIX sockets.

**This replaces `gollum_host` and `gollum_port` from previous versions!**

### `gollum_options`

Pass an
[options hash](https://github.com/gollum/gollum/wiki/Gollum-via-Rack#the-options-hash)
to gollum.
Default:

```yaml
gollum_options: { }
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
