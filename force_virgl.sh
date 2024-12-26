#!/usr/bin/env bash
cat <<EOF > /usr/local/bin/qemu
#!/usr/bin/env bash
/usr/bin/qemu-kvm -display gtk,gl=on -device virtio-vga-gl $@
EOF
