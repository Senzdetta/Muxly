# https://github.com/Senzdetta/Muxly

require 'utils/color'

module InvalidOption
    def self.execute(args)
        printf(
            "%s[!] %sInvalid option: %s%s%s\n",
            Color.R, Color.N, Color.GG, args, Color.N,
        )

        printf(
            "%s[!] %sTry: %smuxly --help%s\n",
            Color.R, Color.N, Color.GG, Color.N,
        )
    end
end

# Copyright (c) 2026 Senzdetta