[private]
default:
    @just --choose

dash:
    gh extension install dlvhdr/gh-dash

force-virgl:
    cat <<EOF > /usr/local/bin/qemu
    #!/usr/bin/env bash
    /usr/bin/qemu-kvm -display gtk,gl=on -device virtio-vga-gl $@
    EOF

zink:
    #!/usr/bin/env bash
    cat << EOF > /etc/environment
    MUTTER_DEBUG_FORCE_KMS_MODE=simple
    MUTTER_DEBUG_KMS_THREAD_TYPE=user
    # GNOME_SHELL_SLOWDOWN_FACTOR=0.8
    LIBGL_KOPPER_DRI2=1
    # __GLX_VENDOR_LIBRARY_NAME=mesa
    MESA_LOADER_DRIVER_OVERRIDE=zink
    GALLIUM_DRIVER=zink 
    GSK_RENDERER=vulkan
    FLATPAK_GL_DRIVERS=mesa-git
    EOF

dump-flatpak:
    flatpak list --app --columns=application | tail -n +1
