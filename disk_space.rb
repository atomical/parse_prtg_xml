module PRTG
  class DiskSpace

    def self.load_xml( path )
      return self.new(File.read(path))
    end

    def initialize( xml ) 
      @doc = Nokogiri::XML( xml )
    end

    def items( &block )
      @doc.xpath("//item").each do |n|
        block.yield Item.new(n)
      end
    end

  end

  class Item
    attr_reader :coverage_raw

    def initialize( item )
      # nothing here yet
    end
  end
end