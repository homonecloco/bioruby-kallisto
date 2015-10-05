#!/bin/env ruby 


$: << File.expand_path(File.dirname(__FILE__) + '/../lib')
$: << File.expand_path('.')
path= File.expand_path(File.dirname(__FILE__) + '/../lib/bio-kallisto.rb')
require path

Bio::Kallisto.index(reference: ARGV[0])