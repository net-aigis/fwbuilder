#!/usr/bin/env bash
# Build a .deb from the relocatable WebUI tree (Debian/Ubuntu Podman + dpkg-deb).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

bash "$ROOT/webui/scripts/package-webui.sh"
# shellcheck disable=SC1091
export NO_GIT_VER=1
# shellcheck disable=SC1091
source ./VERSION.sh
STAGE="$ROOT/dist/fwbuilder-webui-${VERSION}"
test -d "$STAGE"

IMAGE="${FWBWEB_DEB_IMAGE:-docker.io/library/debian:bookworm-slim}"
DEB_ROOT="$ROOT/dist/deb/fwbuilder-webui_${VERSION}"
rm -rf "$ROOT/dist/deb"
mkdir -p "$DEB_ROOT/DEBIAN" "$DEB_ROOT/opt" "$DEB_ROOT/usr/bin"
cp -a "$STAGE" "$DEB_ROOT/opt/fwbuilder-webui"
ln -sf /opt/fwbuilder-webui/bin/fwbweb-wrapper "$DEB_ROOT/usr/bin/fwbweb"
ln -sf /opt/fwbuilder-webui/bin/fwbweb-run-stack "$DEB_ROOT/usr/bin/fwbweb-run-stack"

SIZE_KB=$(du -sk "$DEB_ROOT/opt" | awk '{print $1}')
cat >"$DEB_ROOT/DEBIAN/control" <<EOF
Package: fwbuilder-webui
Version: ${VERSION}
Section: net
Priority: optional
Architecture: amd64
Maintainer: NetAigis <noreply@net-aigis>
Installed-Size: ${SIZE_KB}
Depends: python3 (>= 3.11)
Description: Firewall Builder WebUI (libfwbuilder bridge + API)
 Browser UI for Firewall Builder .fwb projects.
EOF

podman run --rm \
  -v "$ROOT/dist/deb":/work:Z \
  -w /work \
  "$IMAGE" \
  bash -lc '
    set -euo pipefail
    apt-get update -qq
    apt-get install -y -qq dpkg-dev >/dev/null
    dpkg-deb --build "fwbuilder-webui_'"${VERSION}"'"
  '

DEB="$ROOT/dist/deb/fwbuilder-webui_${VERSION}.deb"
test -f "$DEB"
cp -a "$DEB" "$ROOT/dist/"
echo "OK: $ROOT/dist/$(basename "$DEB")"
ls -lh "$ROOT/dist"/fwbuilder-webui_*.deb
