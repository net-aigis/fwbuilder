#!/usr/bin/env bash
# Build a static apt + rpm repository tree from dist/ packages (host anywhere).
#
#   bash webui/scripts/package-webui.sh
#   bash webui/scripts/package-webui-rpm.sh   # optional
#   bash webui/scripts/package-webui-deb.sh   # optional
#   bash webui/scripts/publish-static-repo.sh
#   # → dist/repo/{rpm,apt}/…  upload this tree to any static host / Pages
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

# shellcheck disable=SC1091
export NO_GIT_VER=1
# shellcheck disable=SC1091
source ./VERSION.sh

DIST="${FWBWEB_PACKAGE_OUT:-$ROOT/dist}"
REPO="$DIST/repo"
RPM_DIR="$REPO/rpm"
APT_DIR="$REPO/apt"
mkdir -p "$RPM_DIR" "$APT_DIR/pool" "$APT_DIR/dists/stable/main/binary-amd64"

# Collect artifacts for this version
shopt -s nullglob
RPMS=("$DIST"/fwbuilder-webui-"$VERSION"*.rpm)
# exclude debug packages from the main repo pool
RPMS_MAIN=()
for r in "${RPMS[@]}"; do
  case "$r" in
    *debug*) continue ;;
    *) RPMS_MAIN+=("$r") ;;
  esac
done
DEBS=("$DIST"/fwbuilder-webui_"$VERSION"*.deb)
TARS=("$DIST"/fwbuilder-webui-"$VERSION"-linux-x86_64.tar.gz)

if [[ ${#RPMS_MAIN[@]} -eq 0 && ${#DEBS[@]} -eq 0 ]]; then
  echo "ERROR: no rpm/deb in $DIST for version $VERSION — build packages first" >&2
  exit 1
fi

# --- RPM repo ---
if [[ ${#RPMS_MAIN[@]} -gt 0 ]]; then
  cp -a "${RPMS_MAIN[@]}" "$RPM_DIR/"
  IMAGE="${FWBWEB_REPO_RPM_IMAGE:-registry.opensuse.org/opensuse/tumbleweed:latest}"
  podman run --rm -v "$RPM_DIR":/repo:Z -w /repo "$IMAGE" bash -lc '
    set -euo pipefail
    zypper --non-interactive install -y createrepo_c >/dev/null
    createrepo_c .
  '
  cat >"$RPM_DIR/fwbuilder-webui.repo" <<EOF
[fwbuilder-webui]
name=Firewall Builder WebUI
baseurl=https://EXAMPLE/repo/rpm
enabled=1
gpgcheck=0
EOF
fi

# --- APT repo ---
if [[ ${#DEBS[@]} -gt 0 ]]; then
  cp -a "${DEBS[@]}" "$APT_DIR/pool/"
  IMAGE_DEB="${FWBWEB_REPO_DEB_IMAGE:-docker.io/library/debian:bookworm-slim}"
  podman run --rm -v "$APT_DIR":/repo:Z -w /repo "$IMAGE_DEB" bash -lc '
    set -euo pipefail
    apt-get update -qq
    apt-get install -y -qq dpkg-dev >/dev/null
    cd /repo
    dpkg-scanpackages pool /dev/null | gzip -9c > dists/stable/main/binary-amd64/Packages.gz
    dpkg-scanpackages pool /dev/null > dists/stable/main/binary-amd64/Packages
  '
  cat >"$APT_DIR/fwbuilder-webui.list" <<EOF
# deb [trusted=yes] https://EXAMPLE/repo/apt stable main
EOF
fi

# Index
{
  echo "# Firewall Builder WebUI static package repo"
  echo
  echo "Version: **${VERSION}**"
  echo
  echo "## RPM"
  if [[ ${#RPMS_MAIN[@]} -gt 0 ]]; then
    echo '```'
    echo "sudo cp fwbuilder-webui.repo /etc/zypp/repos.d/   # or /etc/yum.repos.d/"
    echo "# edit baseurl to your host"
    echo "sudo zypper refresh && sudo zypper install fwbuilder-webui"
    echo '```'
  else
    echo "_no rpm_"
  fi
  echo
  echo "## APT"
  if [[ ${#DEBS[@]} -gt 0 ]]; then
    echo '```'
    echo "# echo 'deb [trusted=yes] https://HOST/repo/apt stable main' | sudo tee /etc/apt/sources.list.d/fwbuilder-webui.list"
    echo "sudo apt update && sudo apt install fwbuilder-webui"
    echo '```'
  else
    echo "_no deb_"
  fi
  echo
  echo "## Tarball"
  for t in "${TARS[@]}"; do
    echo "- \`$(basename "$t")\`"
  done
} >"$REPO/README.md"

# Copy tarball into repo for convenience
mkdir -p "$REPO/tarball"
for t in "${TARS[@]}"; do
  cp -a "$t" "$REPO/tarball/"
done

echo "OK: $REPO"
find "$REPO" -maxdepth 3 -type f | head -40
ls -lh "$REPO"/README.md
