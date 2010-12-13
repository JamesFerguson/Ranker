# Use 'escape_utils' gem to overwrite rack method giving warning in Rails 3.0.0
# c.f. http://crimpycode.brennonbortz.com/?p=42
module Rack
  module Utils
    def escape(s)
      EscapeUtils.escape_url(s)
    end
  end
end