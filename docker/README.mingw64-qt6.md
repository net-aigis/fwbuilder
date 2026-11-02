# MinGW-w64 Qt6 Podman smoke (local Windows stand-in)

Replaces GitHub Actions `windows-2022` + MSYS2 when Actions minutes are exhausted.

## Image

```bash
podman build -t fwbuilder-mingw64-qt6 \
  -f docker/Dockerfile.mingw64-qt6-fedora docker/
```

Fedora 41 packages: `mingw64-gcc-c++`, `mingw64-qt6-qtbase/qtsvg/qttools`, `mingw64-libxml2/libxslt`.

## Build the tree

From the repo root:

```bash
podman run --rm -it \
  -v "$PWD":/src:Z -w /src \
  -e JOBS=2 \
  fwbuilder-mingw64-qt6 \
  bash docker/build-mingw64-qt6.sh
```

Logs: `ci-logs-mingw/`. Binaries: `src/*/release/*.exe`.

## Notes

- Cross-compile (`--host=x86_64-w64-mingw32`), not native MSYS2. Close enough for the MinGW/Qt6 compile breakages that blocked CI.
- Parser units use `-O0` (see `src/parsers/parsers.pro`) to avoid MinGW ICEs on ANTLR sources.
- `JOBS=2` by default; raise carefully if the host has RAM to spare.
