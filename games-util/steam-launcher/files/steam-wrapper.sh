#!/bin/bash

# Set a default STEAM_RUNTIME value.
: ${STEAM_RUNTIME:=@@STEAM_RUNTIME@@}
export STEAM_RUNTIME

# Gentoo's lsb-release doesn't set this.
export DISTRIB_RELEASE="@@PVR@@"

# Add paths to occasionally needed libraries not found in /usr/lib.
export LD_LIBRARY_PATH+="${LD_LIBRARY_PATH+:}@@GENTOO_LD_LIBRARY_PATH@@"

# Steam renames LD_LIBRARY_PATH to SYSTEM_LD_LIBRARY_PATH and it then becomes
# ineffective against games. We unfortunately therefore have to force the value
# through via STEAM_RUNTIME_LIBRARY_PATH instead.
export STEAM_RUNTIME_LIBRARY_PATH="${LD_LIBRARY_PATH}"

. "${0%/*}"/../lib/steam/bin_steam.sh
