class Offsets
    def initialize(file, ofs)
        @file = file
        @ofs = ofs
    end

    def r2_offsets()
        r2p = R2Pipe.new @file
        offs =  r2p.cmd "pd 3 @ #{@ofs}"
        g = offs.match(/(.*?) (.*?)\[(.*?)\,(.*?)\]/)
            puts g[4]
    end
end