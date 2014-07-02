#!/usr/bin/env ruby

require 'slop'
require 'nokogiri'
require 'pp'
require './disk_space.rb'


#get some options.  cool stuff like usernames and passwords can go in here


opts = Slop.parse do
  banner 'xml_to_csv.rb [options] --filename xxxx --channel yyyy'
  on 'filename=', 'filename'
  on 'channel=', 'channel'
end

def print_subnodes(subnodes, opts)
  subnodes.each do | node |
    datetime = node.xpath("datetime").text
    channel = node.xpath("#{opts[:channel]}").text
    date_str = datetime.to_s

    print date_str[0..8] + ',' + channel + "\n"
  end
end

disk_space = PRTG::DiskSpace.load_xml('vfsmcbitsdb.xml')
pp disk_space.items


