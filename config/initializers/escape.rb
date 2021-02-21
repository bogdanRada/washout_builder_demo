require 'uri'
if !defined?(::URI.unescape)
  ::URI.class_eval do
    # this was removed in this commit
    # https://github.com/ruby/uri/commit/61c6a47ebf1f2726b60a2bbd70964d64e14b1f98
    # so we are adding it back because we need to be compatible with wasabi on ruby 3.0.0
    module UriEscapeBackport

      def escape(*arg)
        ::URI::DEFAULT_PARSER.escape(*arg)
      end

      alias encode escape

      def unescape(*arg)
        ::URI::DEFAULT_PARSER.unescape(*arg)
      end

      alias decode unescape
    end
    extend UriEscapeBackport
  end
end
