# https://github.com/Senzdetta/Muxly

require 'utils/color'

module Version
    def self.execute(*)
        name = "Muxly".freeze
        version = "v0.1.20261007".freeze
        developer = "Senzdetta".freeze
        homepage = "https://github.com/Senzdetta/Muxly".freeze

        printf(
            "%s- %s%s %s-%s\n",
            Color.DG, Color.GG, name, Color.DG, Color.N,
        )

        printf(
            "%sVersion: %s%s%s\n",
            Color.N, Color.GG, version, Color.N,
        )

        printf(
            "%sDeveloper: %s%s%s\n",
            Color.N, Color.GG, developer, Color.N,
        )

        printf(
            "%sHomepage: %s%s%s\n",
            Color.N, Color.GG, homepage, Color.N,
        )
    end
end

# Copyright (c) 2026 Senzdetta