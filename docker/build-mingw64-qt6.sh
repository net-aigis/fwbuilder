#!/usr/bin/env bash
# Cross-compile FWB 6.0 Qt6 with Fedora mingw64 packages (Podman image).
# Intended to stand in for the GHA "Windows MSYS2 Qt6 smoke" job.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

mkdir -p ci-logs-mingw .ci-ccache-mingw
export CCACHE_DIR="${CCACHE_DIR:-$ROOT/.ci-ccache-mingw}"
export TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX:-/usr/x86_64-w64-mingw32/sys-root/mingw}"
export PATH="${TOOLCHAIN_PREFIX}/bin:/usr/lib64/ccache:/usr/bin:${PATH}"
export PKG_CONFIG_PATH="${TOOLCHAIN_PREFIX}/lib/pkgconfig"
export PKG_CONFIG_LIBDIR="${TOOLCHAIN_PREFIX}/lib/pkgconfig"

# Prefer mingw qmake6; fall back to wrapper names Fedora may ship.
QMAKE6=""
for c in \
  /usr/bin/x86_64-w64-mingw32-qmake-qt6 \
  "${TOOLCHAIN_PREFIX}/bin/qmake-qt6" \
  "${TOOLCHAIN_PREFIX}/bin/qmake6" \
  /usr/bin/mingw64-qmake-qt6
do
  if [[ -x "$c" ]]; then
    QMAKE6="$c"
    break
  fi
done
# xml2-config / xslt-config live in the mingw sysroot.
export PATH="${TOOLCHAIN_PREFIX}/bin:/usr/bin:${PATH}"
if [[ -z "$QMAKE6" ]]; then
  echo "ERROR: mingw qmake6 not found under ${TOOLCHAIN_PREFIX} or /usr/bin" >&2
  ls -la "${TOOLCHAIN_PREFIX}/bin"/qmake* 2>/dev/null || true
  ls -la /usr/bin/*qmake* 2>/dev/null || true
  exit 1
fi

{
  echo "QMAKE6=$QMAKE6"
  echo "TOOLCHAIN_PREFIX=$TOOLCHAIN_PREFIX"
  "$QMAKE6" -v
  x86_64-w64-mingw32-g++ -v 2>&1 | tail -3
} | tee ci-logs-mingw/toolchain.log

# Clean previous native/autotools leftovers so mingw configure is clean.
if [[ -f Makefile ]]; then
  make distclean >/dev/null 2>&1 || true
fi
rm -f config.status config.h VERSION.h .qmake.stash
# Keep tracked test/*/Makefile stubs; wipe generated Makefiles only.
find . -name Makefile -not -path './test/*' -delete 2>/dev/null || true

# AC_PATH_PROG wants a bare command name on PATH, not an absolute path.
QMAKE_NAME="$(basename "$QMAKE6")"
# Same smoke knobs as GHA Windows job (SNMP off, Qt6 qmake).
bash ./autogen.sh \
  --host=x86_64-w64-mingw32 \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --with-qmake="$QMAKE_NAME" \
  --without-ucdsnmp \
  2>&1 | tee ci-logs-mingw/configure.log

# Low parallelism: mirrors the GHA harden against MinGW parser ICEs.
JOBS="${JOBS:-2}"
make -j"$JOBS" 2>&1 | tee ci-logs-mingw/build.log

find src -type f \( -name 'fwb_nft.exe' -o -name 'fwb_ipt.exe' -o -name 'fwbuilder.exe' \) \
  -print | sort | tee ci-logs-mingw/binaries.log

if [[ ! -s ci-logs-mingw/binaries.log ]]; then
  echo "ERROR: no Windows binaries produced" >&2
  exit 1
fi

echo "OK: mingw64 Qt6 smoke binaries:"
cat ci-logs-mingw/binaries.log
