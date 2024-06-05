# frozen_string_literal: true

# BEGIN
module  Model
    
    def self.attribute(attribute_name, options={})
      attribute ||= {}
      attribute[attribute_name] = options
    end

    # save parameters to hash
    def initialize(params={})
      @attributes = params
      params.each do |name, value|
        @attributes[name] = value
      end
    end
    

    # define_method(:attribute) do |name, options|
    #   options ||={}
    # end

  attr_accessor :attributes, :id, :title, :body, :created_at, :published

  # define_method 'attributes' do |attribute_hash|
    
  # end
end

# just test to see parameters saving to hash
class TTT
  include Model
end

model = TTT.new(id: "some", title: "titul")
puts model.attributes

# END