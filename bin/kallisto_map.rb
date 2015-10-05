#!/bin/env ruby 


$: << File.expand_path(File.dirname(__FILE__) + '/../lib')
$: << File.expand_path('.')
path= File.expand_path(File.dirname(__FILE__) + '/../lib/bio-kallisto.rb')
require path

Bio::Kallisto.map(index:ARGV[0], fastq:[ARGV[1], ARGV[2]], output_dir:ARGV[3] )