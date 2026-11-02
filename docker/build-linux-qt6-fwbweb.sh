#!/usr/bin/env bash
# Native Linux configure + build of libfwbuilder, common, fwbweb for WebUI.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

mkdir -p ci-logs-linux webui/.workspace

export PATH="/usr/lib64/qt6/bin:/usr/bin:${PATH}"

QMAKE6="$(command -v qmake6 || command -v qmake-qt6 || true)"
if [[ -z "$QMAKE6" ]]; then
  echo "ERROR: qmake6 not found" >&2
  exit 1
fi

{
  echo "QMAKE6=$QMAKE6"
  "$QMAKE6" -v
  g++ -v 2>&1 | tail -3
} | tee ci-logs-linux/toolchain.log

# Wipe prior MinGW/autotools leftovers so native configure is clean.
if [[ -f Makefile ]]; then
  make distclean >/dev/null 2>&1 || true
fi
rm -f config.status config.h VERSION.h .qmake.stash
find . -name Makefile -not -path './test/*' -not -path './.git/*' -delete 2>/dev/null || true

bash ./autogen.sh \
  --with-qmake="$(basename "$QMAKE6")" \
  --without-ucdsnmp \
  2>&1 | tee ci-logs-linux/configure.log

JOBS="${JOBS:-$(nproc 2>/dev/null || echo 2)}"
# Minimal set for the WebUI bridge (no GUI / compilers required).
make -j"$JOBS" -C src/libfwbuilder 2>&1 | tee ci-logs-linux/libfwbuilder.log
make -j"$JOBS" -C src/common 2>&1 | tee ci-logs-linux/common.log
# Ensure fwbweb Makefile exists after top-level qmake
if [[ ! -f src/fwbweb/Makefile ]]; then
  ( cd src && "$QMAKE6" -o Makefile src.pro )
fi
make -j"$JOBS" -C src/fwbweb 2>&1 | tee ci-logs-linux/fwbweb.log

BIN=""
for c in src/fwbweb/fwbweb src/fwbweb/release/fwbweb; do
  if [[ -x "$c" ]]; then
    BIN="$c"
    break
  fi
done
if [[ -z "$BIN" ]]; then
  echo "ERROR: fwbweb binary missing" >&2
  exit 1
fi

# Local resource tree for unpackaged runs (host wrapper / API).
mkdir -p webui/.res
cp -a src/res/resources.xml src/res/objects_init.xml src/res/templates.xml webui/.res/
cp -a src/res/os src/res/platform src/res/configlets webui/.res/
cp -a src/libfwbuilder/etc/fwbuilder.dtd webui/.res/
cp -a src/libfwbuilder/migration webui/.res/

echo "OK: $BIN" | tee ci-logs-linux/binaries.log
env FWBUILDER_RES_DIR=/src/webui/.res "$BIN" <<'EOF' | tee ci-logs-linux/bridge-smoke.log
{"cmd":"ping"}
{"cmd":"quit"}
EOF
