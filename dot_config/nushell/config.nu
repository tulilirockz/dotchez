let catppuccin_mocha_colors = {
   rosewater: "#f5e0dc"
   flamingo: "#f2cdcd"
   pink: "#f5c2e7"
   mauve: "#cba6f7"
   red: "#f38ba8"
   maroon: "#eba0ac"
   peach: "#fab387"
   yellow: "#f9e2af"
   green: "#a6e3a1"
   teal: "#94e2d5"
   sky: "#89dceb"
   sapphire: "#74c7ec"
   blue: "#89b4fa"
   lavender: "#b4befe"
   text: "#cdd6f4"
   subtext1: "#bac2de"
   subtext0: "#a6adc8"
   overlay2: "#9399b2"
   overlay1: "#7f849c"
   overlay0: "#6c7086"
   surface2: "#585b70"
   surface1: "#45475a"
   surface0: "#313244"
   base: "#1e1e2e"
   mantle: "#181825"
   crust: "#11111b"
}

# https://github.com/nushell/nu_scripts/tree/main/themes
let catppuccin_theme = {
    separator: $catppuccin_mocha_colors.overlay0
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: $catppuccin_mocha_colors.blue attr: "b" }
    empty: $catppuccin_mocha_colors.lavender
    bool: $catppuccin_mocha_colors.lavender
    int: $catppuccin_mocha_colors.peach
    duration: $catppuccin_mocha_colors.text
    filesize: {|e|
        if $e < 1mb {
            $catppuccin_mocha_colors.green
        } else if $e < 100mb {
            $catppuccin_mocha_colors.yellow
        } else if $e < 500mb {
            $catppuccin_mocha_colors.peach
        } else if $e < 800mb {
            $catppuccin_mocha_colors.maroon
        } else if $e > 800mb {
            $catppuccin_mocha_colors.red
        }
    }
    date: {|| (date now) - $in |
        if $in < 1hr {
        } else if $in < 1day {
            $catppuccin_mocha_colors.yellow
        } else if $in < 3day {
            $catppuccin_mocha_colors.peach
        } else if $in < 1wk {
            $catppuccin_mocha_colors.maroon
        } else if $in > 1wk {
            $catppuccin_mocha_colors.red
        }
    }
    range: $catppuccin_mocha_colors.text
    float: $catppuccin_mocha_colors.text
    string: $catppuccin_mocha_colors.text
    nothing: $catppuccin_mocha_colors.text
    binary: $catppuccin_mocha_colors.text
    'cell-path': $catppuccin_mocha_colors.text
    row_index: { fg: $catppuccin_mocha_colors.mauve attr: "b" }
    record: $catppuccin_mocha_colors.text
    list: $catppuccin_mocha_colors.text
    block: $catppuccin_mocha_colors.text
    hints: $catppuccin_mocha_colors.overlay1
    search_result: { fg: $catppuccin_mocha_colors.red bg: $catppuccin_mocha_colors.text }

    shape_and: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_binary: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_block: { fg: $catppuccin_mocha_colors.blue attr: "b" }
    shape_bool: $catppuccin_mocha_colors.teal
    shape_custom: $catppuccin_mocha_colors.green
    shape_datetime: { fg: $catppuccin_mocha_colors.teal attr: "b" }
    shape_directory: $catppuccin_mocha_colors.teal
    shape_external: $catppuccin_mocha_colors.teal
    shape_externalarg: { fg: $catppuccin_mocha_colors.green attr: "b" }
    shape_filepath: $catppuccin_mocha_colors.teal
    shape_flag: { fg: $catppuccin_mocha_colors.blue attr: "b" }
    shape_float: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_garbage: { fg: $catppuccin_mocha_colors.text bg: $catppuccin_mocha_colors.red attr: "b" }
    shape_globpattern: { fg: $catppuccin_mocha_colors.teal attr: "b" }
    shape_int: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_internalcall: { fg: $catppuccin_mocha_colors.teal attr: "b" }
    shape_list: { fg: $catppuccin_mocha_colors.teal attr: "b" }
    shape_literal: $catppuccin_mocha_colors.blue
    shape_match_pattern: $catppuccin_mocha_colors.green
    shape_matching_brackets: { attr: "u" }
    shape_nothing: $catppuccin_mocha_colors.teal
    shape_operator: $catppuccin_mocha_colors.peach
    shape_or: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_pipe: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_range: { fg: $catppuccin_mocha_colors.peach attr: "b" }
    shape_record: { fg: $catppuccin_mocha_colors.teal attr: "b" }
    shape_redirection: { fg: $catppuccin_mocha_colors.pink attr: "b" }
    shape_signature: { fg: $catppuccin_mocha_colors.green attr: "b" }
    shape_string: $catppuccin_mocha_colors.green
    shape_string_interpolation: { fg: $catppuccin_mocha_colors.teal attr: "b" }
    shape_table: { fg: $catppuccin_mocha_colors.blue attr: "b" }
    shape_variable: $catppuccin_mocha_colors.pink

    background: $catppuccin_mocha_colors.base
    foreground: $catppuccin_mocha_colors.text
    cursor: $catppuccin_mocha_colors.blue
}

$env.config.show_banner = false
$env.config.color_config = $catppuccin_theme
$env.config.history.file_format = "sqlite"
$env.config.completions.algorithm = "fuzzy"

alias ze = zellij
alias ya = yazi
alias yy = yazi
alias music-dl = yt-dlp --embed-metadata --embed-chapters --embed-thumbnail --xattrs -f bestaudio -x --audio-format opus
alias video-dl = yt-dlp --embed-metadata --embed-chapters --embed-thumbnail --embed-subs --xattrs -f bestvideo 
# alias vm = systemd-vmspawn --console=gui --cpus=2 --ram=6442450944 --network-user-mode --vsock=false --pass-ssh-key=false -i
alias wol = distrobox enter wolfibox
alias wolc = distrobox create wolfibox -Y --no-entry --unshare-process --unshare-devsys --image cgr.dev/chainguard/wolfi-base --additional-packages "git nushell zoxide uutils"
alias wold = distrobox rm -f wolfibox
alias cen = distrobox enter centosbox
alias cenc = distrobox create centosbox -Y --no-entry --unshare-process --unshare-devsys --image quay.io/centos/centos:10 --additional-packages "git rpmdevtools epel-release"
alias cend = distrobox rm -f centosbox

alias dev = distrobox enter buildbox -- /usr/bin/nu
alias devc = distrobox create buildbox -Y --no-entry --unshare-process --unshare-devsys --image registry.fedoraproject.org/fedora:latest --additional-packages "git git-delta zoxide just nu helix meson clang ccache rpmdevtools rpkg"
alias devd = distrobox rm -f buildbox
# alias dev = distrobox enter fedorabox -- /usr/bin/nu
# alias devc = distrobox create fedorabox -Y --no-entry --unshare-process --unshare-devsys --image registry.fedoraproject.org/fedora:rawhide --additional-packages "git git-delta zoxide just nu helix meson clang ccache rpmdevtools rpkg"
# alias devd = distrobox rm -f fedorabox
alias g = git
alias qemu = flatpak run $"--command=qemu-system-(arch)" org.virt_manager.virt-manager
alias vm-slow = qemu -enable-kvm -M q35 -smp 1 -m 4G -net nic,model=virtio -net user,hostfwd=tcp::2222-:22 -display gtk -boot d
alias vm = qemu -enable-kvm -M q35 -smp 2 -m 8G -cpu host -net nic,model=virtio -net user,hostfwd=tcp::2222-:22 -device virtio-vga-gl,hostmem=8G,blob=true,venus=true -vga none -display gtk,gl=on,show-cursor=on -usb -device usb-tablet -object memory-backend-memfd,id=mem1,size=8G -machine memory-backend=mem1 -drive $"if=pflash,format=raw,file=/app/lib/extensions/Qemu/share/qemu/edk2-(arch).fd" -drive $"if=pflash,format=raw,readonly=on,file=/app/lib/extensions/Qemu/share/qemu/edk2-(arch)-code.fd"

alias flatpak-builder = flatpak run org.flatpak.Builder
alias flatpak-lint = flatpak run --command=flatpak-builder-lint org.flatpak.Builder
alias flatpak-check = flatpak run org.flathub.flatpak-external-data-checker

def --env flatpak-build [manifest: string, ...rest] {
    flatpak-builder --default-branch=stable $"($env.XDG_CACHE_HOME)/flatpak-builder/($manifest | path basename)/build-dir" --state-dir=$"($env.XDG_CACHE_HOME)/flatpak-builder/($manifest | path basename)/flatpak-builder" --user --ccache --force-clean --install --disable-rofiles-fuse $manifest ...$rest
}
def --env flatpak-iterate [manifest: string] {
    flatpak-builder --run $"($env.XDG_CACHE_HOME)/flatpak-builder/($manifest | path basename)/build-dir" --ccache $manifest /bin/bash
}

source ~/.config/nushell/zoxide.nu
