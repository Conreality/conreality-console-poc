#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'qml'

QML.run do |app|
  app.load_path Pathname(__FILE__) + '../main.qml'
end
