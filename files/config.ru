#!/usr/bin/env ruby
require 'gollum/app'
require 'gollum/auth'

config = JSON.parse(File.read(Pathname.new(__FILE__).dirname + 'config.json'),
                    symbolize_names: true)

module Gollum
    # to require 'my_adapter':
  Gollum::GIT_ADAPTER = "rugged"
end

if config[:users]
  use Gollum::Auth, config[:users], config.slice(:allow_guests)
end

Precious::App.set(:gollum_path, config[:repo])
Precious::App.set(:default_markup, :markdown)
Precious::App.set(:wiki_options, config[:options] || { })
run Precious::App
