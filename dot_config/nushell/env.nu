#!/usr/bin/env nu
def create_left_prompt [] {
    $"(ansi light_blue_bold)($env.PWD)"
}

def create_right_prompt [] {
    let distrobox_section = (if (($env.CONTAINER_ID? | default "" | str length) != 0) {
        $"📦($env.CONTAINER_ID)"
    } else {
        $"🌐(hostname)"
    })
    
    $"(ansi light_blue_bold)(id -u):(id -g)@($distrobox_section)"
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

use std "path add"
$env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.XDG_STATE_HOME = $"($env.HOME)/.local/state"
$env.XDG_CACHE_HOME = $"($env.HOME)/.cache"
$env.ANDROID_USER_HOME = $"($env.XDG_DATA_HOME)/android"
$env.CARGO_HOME = $"($env.XDG_DATA_HOME)/cargo"
$env.RUSTUP_HOME = $"($env.XDG_DATA_HOME)/rustup"
$env.LINUXBREW_HOME = "/home/linuxbrew/.linuxbrew"
$env.XDG_DATA_DIRS = $"($env.XDG_DATA_DIRS):($env.LINUXBREW_HOME)/share"
$env.GOPATH = $"($env.XDG_DATA_HOME)/go"
$env.FZF_DEFAULT_OPTS = "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --multi"
$env.CCACHE_HOME = $"($env.HOME)/.cache/ccache"
$env.PYTHONSTARTUP = $"($env.XDG_CONFIG_HOME)/python/pythonrc"
$env.EDITOR = "hx"
$env.VISUAL = "hx"
$env.TERM = "xterm-256color"
$env.DOCKER_HOST = $"unix:///run/user/(id -u)/podman/podman.sock"
$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"
path add $"($env.LINUXBREW_HOME)/bin"
path add $"($env.LINUXBREW_HOME)/sbin"
path add ($"($env.CARGO_HOME)" | path join "bin")
path add ($env.RUSTUP_HOME | path join "toolchains" "nightly-x86_64-unknown-linux-gnu" "bin")
path add "/home/linuxbrew/.linuxbrew/opt/rustup/bin"
path add ($env.HOME | path join ".local" "bin")
path add ($env.GOPATH | path join "bin" )
path add "/usr/lib64/ccache"
path add $"($env.HOME)/.rbenv/shims"
path add $"($env.HOME)/.deno/bin"
path add $"($env.HOME)/.bun/bin"
path add $"($env.HOME)/.cache/.bun/bin"
path add $"($env.HOME)/bin"
path add $"($env.HOME)/.config/emacs/bin"
$env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/keyring/ssh"
alias wget = wget $"--hsts-file=($env.XDG_DATA_HOME)/wget-hsts"
$env.PATH = ($env.PATH | uniq)
