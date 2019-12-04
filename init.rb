# Wiki Notes plugin for Redmine
# Copyright (C) 2010 Daniel Seifert
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require 'redmine'
begin
  require 'config/initializers/session_store.rb'
  rescue LoadError
end

def init_admonition
  Dir::foreach(File.join(File.dirname(__FILE__), 'lib')) do |file|
    next unless /\.rb$/ =~ file
    require_dependency file
  end
end

if Rails::VERSION::MAJOR >= 5
  ActiveSupport::Reloader.to_prepare do
    init_admonition
  end
elsif Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    init_admonition
  end
else
  Dispatcher.to_prepare :redmine_admonition do
    init_admonition
  end
end

require File.expand_path('../../../lib/redmine/wiki_formatting/textile/redcloth3', __FILE__)
Redmine::Plugin.register :redmine_admonition do
  name 'Redmine Admonition plugin'
  author 'Frederic AOUSTIN'
  description 'add admonition in redmine'
  url "http://www.github.com/fraoustin/redmine_admonition" if respond_to?(:url)
  version '0.1.0'
  requires_redmine :version_or_higher => '2.3.0'

  RedCloth3::ALLOWED_TAGS << "div"
end
