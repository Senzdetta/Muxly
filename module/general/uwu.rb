# https://github.com/Senzdetta/Muxly

module Uwu
    def self.execute(*)
        faces = [
            "(｡◕‿◕｡)",
            "(≧◡≦)",
            "ʕ•ᴥ•ʔ",
            "(・ω・)",
            "(๑˃ᴗ˂)ﻭ",
            "(ง'̀-'́)ง",
            "(=^･ω･^=)",
        ]

        fixface = "(・ω・)"
        delay = 0.2
        duration = 5

        start_time = Process.clock_gettime(
            Process::CLOCK_MONOTONIC,
        )

        printf("\x1b[?25l")
        while (Process.clock_gettime(
            Process::CLOCK_MONOTONIC,
        ) - start_time) < duration
            faces.each do |face|
                elapsed = Process.clock_gettime(
                    Process::CLOCK_MONOTONIC,
                ) - start_time
                break if elapsed >= duration
                printf(
                    "\r%s\x1b[K",
                    face,
                )
                sleep(delay)
            end
        end
        printf(
            "\r%s\x1b[K\x1b[?25h\n",
            fixface,
        )
    end
end

# Copyright (c) 2026 Senzdetta