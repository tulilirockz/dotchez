# Nushell Environment Config File
#
# version = "0.99.2"

def create_left_prompt [] {
    let dir = match (do --ignore-shell-errors { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi light_purple_bold } else { ansi light_blue_bold })
    let separator_color = (if (is-admin) { ansi light_purple_bold } else { ansi light_blue_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

# def create_right_prompt [] {
#     # create a right prompt in magenta with green separators and am/pm underlined
#     let time_segment = ([
#         (ansi reset)
#         (ansi magenta)
#         (date now | format date '%x %X') # try to respect user's locale
#     ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
#         str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

#     let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
#         (ansi rb)
#         ($env.LAST_EXIT_CODE)
#     ] | str join)
#     } else { "" }

#     ([$last_exit_code, (char space), $time_segment] | str join)
# }

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| }
# FIXME: This default is not implemented in rust code as of 2023-09-08.

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

use std "path add"
$env.PATH = ($env.PATH | uniq)
$env.EDITOR = "hx"
$env.VISUAL = "hx"
$env.DOCKER_HOST = $"unix:///run/user/1000/podman/podman.sock"
$env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.XDG_STATE_HOME = $"($env.HOME)/.local/state"
$env.XDG_CACHE_HOME = $"($env.HOME)/.cache"
$env.ANDROID_USER_HOME = $"($env.XDG_DATA_HOME)/android"
$env.CARGO_HOME = $"($env.XDG_DATA_HOME)/cargo"
$env.RUSTUP_HOME = $"($env.XDG_DATA_HOME)/rustup"
$env.LINUXBREW_HOME = "/home/linuxbrew"
$env.XDG_DATA_DIRS = $"($env.XDG_DATA_DIRS):($env.LINUXBREW_HOME)/.linuxbrew/share"
$env.GOPATH = $"($env.XDG_DATA_HOME)/go"
path add ($"($env.CARGO_HOME)" | path join "bin")
path add ($env.RUSTUP_HOME | path join "toolchains" "nightly-x86_64-unknown-linux-gnu" "bin")
path add ($env.HOME | path join ".local" "bin")
path add ($env.GOPATH | path join "bin" )
