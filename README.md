Ansible Role: Gollum
====================

[![Build Status](https://travis-ci.org/bjoernalbers/ansible-role-gollum.svg?branch=master)](https://travis-ci.org/bjoernalbers/ansible-role-gollum)

Install and manage [Gollum Wikis](https://github.com/gollum/gollum) on macOS.

**NOTE: Version 1.0 is a complete rewrite with new role variables!**

Requirements
------------

- recent version of Xcode
- Xcode's command line tools (`xcode-select --install`)
- [Mac Homebrew](http://brew.sh)

Role Variables
--------------

This role has only *one* top-level role variable `gollum_wikis` - a dictionary
of wiki (like virtual hosts on apache / nginx).
Each wiki itself is a dictionary with custom settings: socket, users, options,
etc.
`gollum_wikis` comes with a [default wiki](http://localhost:4567):

```yaml
gollum_wikis:
  default:
    bind: tcp://127.0.0.1:4567
```

But of course you can overwrite that.
Here's a full example:

```yaml
---
gollum_wikis:
  default:
    bind: tcp://0.0.0.0:8080
    options:
      emoji: yes
      live_preview: no
    users:
      - username: rick
        password: asdf754&1129-@lUZw
        name: Rick Sanchez
        email: rick@example.com
      - username: morty
        password_digest: 5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5
        name: Morty Smith
        email: morty@example.com
    allow_guests: yes
  notes:
    bind: tcp://127.0.0.1:8081
```

Each Wiki can have these keys...

### `bind`

Defines which socket gollum will bind to.
You can use anything that [Puma](http://puma.io) would accept for
[Binding TCP / Sockets](https://github.com/puma/puma#binding-tcp--sockets),
even UNIX sockets.

### `options`

Pass an
[options hash](https://github.com/gollum/gollum/wiki/Gollum-via-Rack#the-options-hash)
to gollum for customization.

### `users`

An array of allowed users to access the wiki.
If this is *not* empty than only these users can access the wiki.
Each user must have a *username*, *password_digest*, *name* and *email*.
Instead of a *password_digest* you could also use the actual *password*:

### `allow_guests`

If you have defined users but still want unauthenticated folks the read the
wiki that set `allow_guests: yes`.
By default this is disabled.


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
