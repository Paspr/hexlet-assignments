# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable
  
  def initialize(url_string)
    @url = URI(url_string)
  end

  def_delegators :@url, :scheme, :host, :port
  
  def query_params()
    result = {}
    string_with_parameters = @url.to_s.partition("?").last
    string_with_parameters.each_line("&", chomp: true) do
      |s| result[s.partition("=").first] = s.partition("=").last
    end
    result.transform_keys(&:to_sym)
  end

  def query_param(key, value=nil)
    existing_parameters = query_params
    existing_parameters.fetch(key, value)
  end
  
  def <=>(other)
    [@url.host(), @url.port(), @url.scheme(), self.query_params] <=> [other.host(), other.port(), other.scheme(), other.query_params]
  end
end
# END
