# frozen_string_literal: true
#
# ronin-code-sql - A Ruby DSL for crafting SQL Injections.
#
# Copyright (c) 2007-2025 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# ronin-code-sql is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-code-sql is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-code-sql.  If not, see <https://www.gnu.org/licenses/>.
#

require_relative 'literals'
require_relative 'fields'
require_relative 'functions'
require_relative 'statement'
require_relative 'statements'
require_relative 'emittable'

module Ronin
  module Code
    module SQL
      #
      # Represents a SQL Clause.
      #
      # @api semipublic
      #
      class Clause

        include Literals
        include Fields
        include Functions
        include Statements
        include Emittable

        # The name of the clause.
        #
        # @return [Symbol]
        attr_reader :keyword

        # The clause's argument.
        #
        # @return [Object, nil]
        attr_reader :argument

        #
        # Initializes the SQL clause.
        #
        # @param [Symbol] keyword
        #   The name of the clause.
        #
        # @param [Object, nil] argument
        #   Additional argument for the clause.
        #
        # @yield [(clause)]
        #   If a block is given, the return value will be used as the argument.
        #
        # @yieldparam [Clause] clause
        #   If the block accepts an argument, it will be passed the new clause.
        #   Otherwise the block will be evaluated within the clause.
        #
        def initialize(keyword,argument=nil,&block)
          @keyword  = keyword
          @argument = argument

          if block
            @argument = case block.arity
                        when 0 then instance_eval(&block)
                        else        block.call(self)
                        end
          end
        end

      end
    end
  end
end
