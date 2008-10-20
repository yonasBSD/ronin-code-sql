#
#--
# Ronin SQL - A Ronin library providing support for SQL related security
# tasks.
#
# Copyright (c) 2007-2008 Hal Brodigan (postmodern.mod3 at gmail.com)
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
#++
#

require 'ronin/code/sql/expr'
require 'ronin/code/sql/between'

module Ronin
  module Code
    module SQL
      class Field < Expr

        def initialize(program,name,prefix=nil)
          super(program)

          @prefix = prefix
          @name = name
        end

        def *
          Keyword.new('*')
        end

        def id
          field_cache[:id]
        end

        def between(start,stop)
          Between.new(self,start,stop)
        end

        def <=>(range)
          between(range.begin,range.end)
        end

        def emit
          if @prefix
            return "#{@prefix}.#{@name}"
          else
            return "#{@name}"
          end
        end

        protected

        def method_missing(name,*arguments,&block)
          if (arguments.empty? && @prefix.nil? && block.nil?)
            return field_cache[name]
          end

          raise(NoMethodError,sym.id2name)
        end

        private

        def field_cache
          @field_cache ||= Hash.new { |hash,key| hash[key] = Field.new(@style,key,self) }
        end

      end
    end
  end
end
