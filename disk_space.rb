module PRTG
  class DiskSpace

    def self.load_xml( path )
      return self.new(File.read(path))
    end

    def initialize( xml ) 
      @doc = Nokogiri::XML( xml )
    end

    def items
      @doc.xpath("//item").map{|i| Item.new(i) }
    end

  end

  class Item
    attr_reader :coverage_raw
    attr_reader :date

    def initialize( item )
      # nothing here yet
    end
  end
end