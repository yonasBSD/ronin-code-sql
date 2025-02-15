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

require_relative 'operators'
require_relative 'emittable'

module Ronin
  module Code
    module SQL
      #
      # Represents a binary expression in SQL.
      #
      # @api semipublic
      #
      class BinaryExpr

        include Operators
        include Emittable

        # The left-hand side of the binary expression.
        #
        # @return [Statement, Function, BinaryExpr, Field, Literal]
        attr_reader :left

        # The binary expression's operator.
        #
        # @return [Symbol]
        attr_reader :operator

        # The right-hand side of the binary expression.
        #
        # @return [Object]
        attr_reader :right

        #
        # Initializes the binary expression.
        #
        # @param [Statement, Function, BinaryExpr, Field, Literal] left
        #   The left-hand side of the binary expression.
        #
        # @param [Symbol] operator
        #   The binary expression's operator.
        #
        # @param [Object] right
        #   The right-hand side of the binary expression.
        #
        def initialize(left,operator,right)
          @left     = left
          @operator = operator
          @right    = right
        end

        #
        # Converts the binary expression to SQL.
        #
        # @param [Hash{Symbol => Object}] kwargs
        #   Additional keyword arguments for {Emitter#initialize}.
        #
        # @return [String]
        #   The emitted SQL expression.
        #
        def to_sql(**kwargs)
          emitter(**kwargs).emit_expression(self)
        end

      end
    end
  end
end
