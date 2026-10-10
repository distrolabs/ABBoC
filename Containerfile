# A lot of things have been taken from the parent project's https://github.com/ArctineLabs/OS/blob/main/Containerfile
FROM scratch AS ctx

# Copy scripts over
COPY scripts /scripts

# Use Arch Linux as base
FROM quay.io/archlinux/archlinux:latest AS base

# Install dependencies
RUN pacman -Syu --noconfirm --needed base-devel git make cargo go-md2man ostree glib2 openssl zstd zlib rust pkgconf glibc clang efibootmgr grub gcc-libs

WORKDIR /home/build
RUN mkdir -p /home/nobody \
    && chown nobody:nobody -Rv /home/nobody
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/scripts/build.sh

LABEL \
    org.opencontainers.image.title="abboc" \
    org.opencontainers.image.description="Arch Bootc Builder or Compiler - Builds bootc for Arch" \
    org.opencontainers.image.url="https://distrolabs.github.io/ABBoC" \
    org.opencontainers.image.source="https://github.com/distrolabs/ABBoC" \
    org.opencontainers.image.licenses="Apache-2.0"