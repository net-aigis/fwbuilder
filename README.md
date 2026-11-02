# Firewall Builder

GUI and tooling for firewall policy management (iptables, nftables, PF, Cisco
ASA/PIX, router ACLs, and more). Configuration lives in a portable `.fwb` file.

This fork tracks **Qt6** builds and an optional **WebUI** that edits the same
`.fwb` projects through **libfwbuilder** (no second object model or compilers).

## Status (honest)

| Track | State |
| --- | --- |
| Desktop GUI (Qt6) | Builds on Linux; Win/Mac smoke via MinGW/local Podman (see `docker/`) |
| WebUI (`feature/webui`) | Local-only: object tree, rules, compile/deploy, FirewallOptions grouped from `src/res`, compilers nft/ipt/pf/ipf/ipfw |
| Full GUI parity | **Not** claimed — see [`webui/STATUS.md` on `feature/webui`](https://github.com/net-aigis/fwbuilder/blob/feature/webui/webui/STATUS.md) |

## WebUI (local, no GitHub Actions required)

openSUSE hosts often lack Fedora’s `libxml2.so.2`; build and run the bridge
inside Podman, then use the host wrapper `webui/bin/fwbweb`.

```bash
# Image + native fwbweb (+ nft/ipt compilers)
podman build -t fwbuilder-linux-qt6 -f docker/Dockerfile.linux-qt6-fedora docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 fwbuilder-linux-qt6 \
  bash docker/build-linux-qt6-fwbweb.sh

# API E2Es
bash webui/scripts/e2e-local.sh
bash webui/scripts/e2e-phase2.sh
bash webui/scripts/e2e-phase3.sh
bash webui/scripts/e2e-phase4.sh
bash webui/scripts/e2e-phase5.sh

# Dev servers
export FWBWEB_BRIDGE="$(pwd)/webui/bin/fwbweb"
export FWBWEB_API_TOKEN="dev-token"
export FWBWEB_WORKSPACE="$(pwd)/webui/.workspace"
export FWBUILDER_RES_DIR="$(pwd)/webui/.res"

cd webui/backend && pip install -e '.[dev]'
uvicorn fwbweb_api.main:app --reload --port 8088

# other terminal
cd webui/frontend && npm install && npm run dev
```

Details: [`webui/README.md` on `feature/webui`](https://github.com/net-aigis/fwbuilder/blob/feature/webui/webui/README.md), [`webui/ARCHITECTURE.md` on `feature/webui`](https://github.com/net-aigis/fwbuilder/blob/feature/webui/webui/ARCHITECTURE.md).

## Desktop build (Linux Qt6)

```bash
# Dependencies vary by distro; Fedora example is encoded in
# docker/Dockerfile.linux-qt6-fedora. Prefer the Podman image above for a
# known-good toolchain.

./autogen.sh --with-qmake=qmake6 --without-ucdsnmp
make -j"$(nproc)"
```

Cross Win64 MinGW Qt6 (local Podman, not CI minutes):

```bash
podman build -t fwbuilder-mingw64-qt6 -f docker/Dockerfile.mingw64-qt6-fedora docker/
podman run --rm -v "$PWD":/src:Z -w /src fwbuilder-mingw64-qt6 bash docker/build-mingw64-qt6.sh
```

## License

GNU GPL v2 (or later). See upstream Firewall Builder licensing notices in the
source tree.
