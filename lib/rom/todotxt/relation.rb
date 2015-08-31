require 'rom/relation'

module ROM
  module TodoTxt
    # Relation subclass of Todo.txt adapter
    #
    # @api public
    class Relation < ROM::Relation
      adapter :todotxt
      forward :join, :order, :project, :restrict
    end
  end
end
