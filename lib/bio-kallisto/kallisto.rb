require 'systemu'

module Bio
  class Kallisto

    def self.index (reference:,  output:nil, k:31 , unique: false )

      $stderr.put "reference undefined " unless reference

      output = "#{reference}.kallisto.k#{k}" unless output

      extra=""
      extra="--make-unique" if unique

      command = "kallisto index --kmer-size=#{k} --index=#{output} #{extra} #{reference}"
      status, stdout, stderr = systemu command
      if status.exitstatus != 0
       $stderr.puts "Failed to run wrapping command correctly, as non-zero exit status "+
       "#{status.exitstatus} detected. Command run was `#{command}'"
       return false
     else
        # All good. Now to something useful with the stdout..
        return true
      end
    end
  end
end