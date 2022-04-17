require 'optparse'
require 'r2pipe'
require_relative 'r2_match.rb'


def get_r2_p_flag(kernelcache_j)
    puts "[+] P_flag:"
    m = Offsets.new(kernelcache_j, "sym._proc_issetugid")
    m.r2_offsets()
 
end

def get_r2_ppid(kernelcache_j)
    puts "[+] P_pid:"
    m = Offsets.new(kernelcache_j, "sym._getpid")
    m.r2_offsets()
 
end

def check_kernel(file_input)
   if  File.exist?(file_input)
    puts "[+] File check"  
    puts "[+] Collecting importants offsets "
    get_r2_p_flag(file_input)
    get_r2_ppid(file_input)
   else 
    puts "File error"
   end

end


def main()
    options = {:bypass => nil}
    parser = OptionParser.new do|opts|
    
        opts.banner = "Example:"
        opts.on('-f ','--filename ', 'Path your kernelcache', String)do |bypass|
        options[:bypass]=bypass;
        end
        opts.on('-h', '--help', 'Help') do
            
            puts opts
            puts "Example: "
            exit
        end
    end
    
    parser.parse!
    
    if options[:bypass].nil? 
        puts "Insert kernel cache"
    else 
        check_kernel(options[:bypass])
    end


end


main()

