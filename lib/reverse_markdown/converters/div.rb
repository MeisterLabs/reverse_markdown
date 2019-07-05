module ReverseMarkdown
  module Converters
    class Div < Base
      def convert(node, state = {})
        # Quill makes an extra br inside an empty div..
        return "\n" if single_br_child?(node)
        "\n" << treat_children(node, state)
      end

      private

      def single_br_child?(node)
        node.children.size == 1 && node.children.first.name == 'br'
      end
    end

    register :div,     Div.new
    register :article, Div.new

  end
end
