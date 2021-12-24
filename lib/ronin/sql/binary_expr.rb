#
# Ronin SQL - A Ruby DSL for crafting SQL Injections.
#
# Copyright (c) 2007-2021 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of ronin-sql.
#
# ronin-sql is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-sql is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-sql.  If not, see <https://www.gnu.org/licenses/>.
#

require 'ronin/sql/operators'
require 'ronin/sql/emittable'

module Ronin
  module SQL
    #
    # Represents a binary expression in SQL.
    #
    # @api semipublic
    #
    class BinaryExpr < Struct.new(:left,:operator,:right)

      include Operators
      include Emittable

      #
      # Converts the binary expression to SQL.
      #
      # @param [Hash] options
      #   Additional options for {Emitter#initialize}.
      #
      # @return [String]
      #   The emitted SQL expression.
      #
      def to_sql(options={})
        emitter(options).emit_expression(self)
      end

    end
  end
end
