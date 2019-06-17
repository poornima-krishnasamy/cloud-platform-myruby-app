#!/usr/bin/env ruby

require 'bundler/setup'
require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  '<h1>Hello, World! from Ruby app 1.0</h1>'
end
