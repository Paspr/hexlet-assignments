# frozen_string_literal: true

# BEGIN
require 'date'

module  Model
  
  def self.included(base)
    base.extend ClassMethods
    base.instance_variable_set(:@attributes, {})
  end
  
  module ClassMethods
    def attribute(name, options = {})
      @attributes[name] = options

      define_method(name) do
        value = instance_variable_get("@#{name}")
        convert(value, options[:type])
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end

    def attributes
      @attributes
    end
  end

  def initialize(attrs = {})
    self.class.attributes.each do |name, _|
      value = attrs[name]
      send("#{name}=", value) if value
    end
  end

  def attributes
    result = {}
    self.class.attributes.each do |name, options|
      value = send(name)
      result[name] = value
    end
    result
  end

  def convert(value, type)
    case type
    when :string
      value.to_s
    when :integer
      value.to_i
    when :datetime
      DateTime.parse(value)
    when :boolean
      !!value
    else
      value
    end
  end
end

# END