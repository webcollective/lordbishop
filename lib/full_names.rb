module FullNames
  
  require 'treetop'
  require 'grammars/name'
  
  class << self
    
    def parse(name)
      return false unless name.is_a?(String)
      
      parser = NameParser.new
      result = parser.parse(name)
      result_hash = {}
      result.value.each do |node|
        result_hash[node[0]] = node[1].strip if node.is_a?(Array) && !node[1].blank?
      end unless result.nil?
      result_hash
    end
    
  end
  
  
  
end