#!/usr/bin/env bash
# Build an RPM from the relocatable WebUI tree (via openSUSE/Fedora Podman + rpmbuild).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

bash "$ROOT/webui/scripts/package-webui.sh"
# shellcheck disable=SC1091
export NO_GIT_VER=1
# shellcheck disable=SC1091
source ./VERSION.sh
TARBALL="$ROOT/dist/fwbuilder-webui-${VERSION}-linux-x86_64.tar.gz"
test -f "$TARBALL"

IMAGE="${FWBWEB_RPM_IMAGE:-registry.opensuse.org/opensuse/tumbleweed:latest}"
SPEC_DIR="$ROOT/dist/rpmbuild"
rm -rf "$SPEC_DIR"
mkdir -p "$SPEC_DIR"/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cp -a "$TARBALL" "$SPEC_DIR/SOURCES/"

cat >"$SPEC_DIR/SPECS/fwbuilder-webui.spec" <<EOF
Name:           fwbuilder-webui
Version:        ${VERSION}
Release:        1%{?dist}
Summary:        Firewall Builder WebUI (libfwbuilder bridge + API)
License:        GPLv2+
URL:            https://github.com/net-aigis/fwbuilder
Source0:        fwbuilder-webui-%{version}-linux-x86_64.tar.gz
BuildArch:      x86_64

%description
Browser UI for Firewall Builder .fwb projects. Ships native fwbweb bridge,
compilers (when packaged), FastAPI backend sources, and React frontend sources.

%prep
%setup -q -n fwbuilder-webui-%{version}

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/opt/fwbuilder-webui
cp -a . %{buildroot}/opt/fwbuilder-webui/
mkdir -p %{buildroot}/usr/bin
ln -sf /opt/fwbuilder-webui/bin/fwbweb-wrapper %{buildroot}/usr/bin/fwbweb
ln -sf /opt/fwbuilder-webui/bin/fwbweb-run-stack %{buildroot}/usr/bin/fwbweb-run-stack

%files
/opt/fwbuilder-webui
/usr/bin/fwbweb
/usr/bin/fwbweb-run-stack

%changelog
* $(date '+%a %b %d %Y') Firewall Builder <noreply@net-aigis> - ${VERSION}-1
- WebUI package ${VERSION}
EOF

podman run --rm \
  -v "$SPEC_DIR":/rpmbuild:Z \
  -w /rpmbuild \
  "$IMAGE" \
  bash -lc '
    set -euo pipefail
    zypper --non-interactive install -y rpm-build tar gzip >/dev/null
    rpmbuild --define "_topdir /rpmbuild" -bb SPECS/fwbuilder-webui.spec
  '

OUT=$(find "$SPEC_DIR/RPMS" -name 'fwbuilder-webui-'"$VERSION"'-*.rpm' ! -name '*-debug*' | head -1)
test -n "$OUT"
cp -a "$OUT" "$ROOT/dist/"
# optional debuginfo next to it
find "$SPEC_DIR/RPMS" -name 'fwbuilder-webui-*debug*.rpm' -exec cp -a {} "$ROOT/dist/" \; || true
echo "OK: $ROOT/dist/$(basename "$OUT")"
ls -lh "$ROOT/dist"/fwbuilder-webui-"$VERSION"*.rpm
