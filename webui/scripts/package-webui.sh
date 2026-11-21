#!/usr/bin/env bash
# Build a relocatable WebUI tarball (bridge ELF + API + frontend sources + docs).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

VERSION="${FWBWEB_PACKAGE_VERSION:-}"
if [[ -z "$VERSION" ]]; then
  # shellcheck disable=SC1091
  export NO_GIT_VER=1
  # shellcheck disable=SC1091
  source ./VERSION.sh
fi
OUT_DIR="${FWBWEB_PACKAGE_OUT:-$ROOT/dist}"
STAGE="$OUT_DIR/fwbuilder-webui-${VERSION}"
TARBALL="$OUT_DIR/fwbuilder-webui-${VERSION}-linux-x86_64.tar.gz"

mkdir -p "$OUT_DIR"
rm -rf "$STAGE"
mkdir -p "$STAGE/bin" "$STAGE/share/fwbweb" "$STAGE/doc"

test -x "$ROOT/src/fwbweb/fwbweb"
cp -a "$ROOT/src/fwbweb/fwbweb" "$STAGE/bin/fwbweb"
# Compilers if present (optional)
for c in nft ipt pf ipf ipfw pix iosacl nxosacl junosacl procurve_acl; do
  src="$ROOT/src/$c/fwb_$c"
  if [[ -x "$src" ]]; then
    cp -a "$src" "$STAGE/bin/fwb_$c"
  fi
done

cp -a "$ROOT/webui/.res" "$STAGE/share/fwbweb/res"
cp -a "$ROOT/webui/backend" "$STAGE/share/fwbweb/backend"
# Drop local junk from staged backend
rm -rf "$STAGE/share/fwbweb/backend/.venv" \
       "$STAGE/share/fwbweb/backend/**/__pycache__" \
       "$STAGE/share/fwbweb/backend/.pytest_cache" 2>/dev/null || true
find "$STAGE/share/fwbweb/backend" -type d -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true
cp -a "$ROOT/webui/frontend" "$STAGE/share/fwbweb/frontend"
rm -rf "$STAGE/share/fwbweb/frontend/node_modules" 2>/dev/null || true

cp -a "$ROOT/webui/INSTALL.md" "$ROOT/webui/STATUS.md" "$ROOT/webui/ARCHITECTURE.md" \
  "$ROOT/webui/README.md" "$STAGE/doc/"
cp -a "$ROOT/webui/scripts/run-stack.sh" "$STAGE/bin/fwbweb-run-stack"
chmod +x "$STAGE/bin/fwbweb-run-stack"

cat >"$STAGE/bin/fwbweb-wrapper" <<'WRAP'
#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
export FWBUILDER_RES_DIR="${FWBUILDER_RES_DIR:-$ROOT/share/fwbweb/res}"
export FWBWEB_HOST_BIN="$HERE/fwbweb"
export FWBWEB_BRIDGE="$HERE/fwbweb"
exec "$HERE/fwbweb" "$@"
WRAP
chmod +x "$STAGE/bin/fwbweb-wrapper"

cat >"$STAGE/README.txt" <<EOF
Firewall Builder WebUI ${VERSION}
================================

Contents:
  bin/fwbweb              native bridge ELF
  bin/fwbweb-wrapper      sets FWBUILDER_RES_DIR for this tree
  bin/fwbweb-run-stack    starts API (+ frontend)
  bin/fwb_*               compilers (if packaged)
  share/fwbweb/           backend, frontend, res
  doc/                    INSTALL / STATUS / ARCHITECTURE

Quick start:
  export FWBWEB_BRIDGE=\"\$PWD/bin/fwbweb-wrapper\"
  export FWBUILDER_RES_DIR=\"\$PWD/share/fwbweb/res\"
  export FWBWEB_API_TOKEN=dev-token
  # Adjust run-stack paths or:
  cd share/fwbweb/backend && python3 -m venv .venv && .venv/bin/pip install -e '.[dev]'
  .venv/bin/uvicorn fwbweb_api.main:app --host 127.0.0.1 --port 8088

See doc/INSTALL.md.
EOF

tar -C "$OUT_DIR" -czf "$TARBALL" "fwbuilder-webui-${VERSION}"
echo "OK: $TARBALL"
ls -lh "$TARBALL"
