{{ shebang::ruby }}
# https://github.com/Senzdetta/Muxly

$LOAD_PATH.unshift(
    File.expand_path(__dir__),
)

require 'console/console'
Console.run(ARGV)

# Copyright (c) 2026 Senzdetta