require 'systemu'

module Bio
  class Kallisto

    def self.index (reference:,  output_index:nil, k:31 , unique: false )

      $stderr.put "reference undefined " unless reference

      output_index = "#{reference}.kallisto.k#{k}" unless output_index

      extra=""
      extra="--make-unique" if unique

      command = "kallisto index --kmer-size=#{k} --index=#{output_index} #{extra} #{reference}"
      status, stdout, stderr = systemu command
      if status.exitstatus != 0
       $stderr.puts "Failed to run wrapping command correctly, as non-zero exit status "+
       "#{status.exitstatus} detected. Command run was `#{command}'"
       return false
     else
        return true
      end
    end

    def self.map(index:, fastq:, output_dir:, single:false, bias:false, fragment_length:0, pseudobam:false, bootstrap_samples:0, threads:1, seed:42)

      extra = ""
      extra += " --single" if single
      extra += " --bias" if bias
      extra += " --fragment-length=#{fragment_length}" if fragment_length > 0
      extra += " --pseudobam" if pseudobam
      extra += " --bootstrap-samples=#{bootstrap-samples}" if bootstrap_samples > 0
      extra += " --threads=#{threads}" if threads > 1
      extra += " --seed=#{seed}" if seed != 42
      command = "kallisto quant --index=#{index} --output-dir=#{output_dir} #{extra} #{fastq.join(' ')}"

      status, stdout, stderr = systemu command
      if status.exitstatus != 0
       $stderr.puts "Failed to run wrapping command correctly, as non-zero exit status "+
          "#{status.exitstatus} detected. Command run was `#{command}'"
       return false
     else
        return true
      end

    end
  end
end