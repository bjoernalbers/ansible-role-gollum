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

### `gollum_auth`

Enable [authentication](https://github.com/bjoernalbers/gollum-auth) (disabled
by default):

```yaml
gollum_auth: no
```

Please keep in mind that you have to define users as well.

### `gollum_auth_users`

An array of allowed users to access the wiki.
Each user must have a *username*, *password_digest*, *name* and *email*.
By default no user is allowed:

```yaml
gollum_auth_users: [ ]
```

Instead of a *password_digest* you could also use the actual *password*:
Here's an example of both variants:

```yaml
- username: rick
  password: asdf754&1129-@lUZw
  name: Rick Sanchez
  email: rick@example.com
- username: morty
  password_digest: 5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5
  name: Morty Smith
  email: morty@example.com
```

### `gollum_auth_options`

A hash of additional options that are passed to gollum-auth (empty by
default):

```yaml
gollum_auth_options: { }
```

For example you could allow guests to *read* the wiki with...

```yaml
gollum_auth_options:
  allow_guests: yes
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
