#
# Ronin SQL - A Ruby DSL for crafting SQL Injections.
#
# Copyright (c) 2007-2012 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of Ronin SQL.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/sql/program'
require 'ronin/sql/injection'

module Ronin
  module SQL

    #
    # Creates a new SQL program.
    #
    # @return [Program]
    #   The new SQL program.
    #
    def sql(&block)
      Program.new(&block)
    end

    #
    # Creates a new SQL injection (SQLi)
    #
    # @param [Hash] options
    #   Additional injection options.
    #
    # @option options [:integer, :decimal, :string, :column] :escape
    #   The type of element to escape out of.
    #
    # @option options [Boolean] :terminate
    #   Specifies whether to terminate the SQLi with a comment.
    #
    # @option options [String, Symbol, Integer] :place_holder
    #   Place-holder data.
    #
    # @return [Injection]
    #   The new SQL injection.
    #
    def sqli(options={},&block)
      Injection.new(options,&block)
    end

  end
end
