# Firewall Builder

GUI and tooling for firewall policy management (iptables, nftables, PF, Cisco
ASA/PIX, router ACLs, and more). Configuration lives in a portable `.fwb` file.

This fork tracks **Qt6** builds and an optional **WebUI** that edits the same
`.fwb` projects through **libfwbuilder** (no second object model or compilers).

## Support

- [GitHub Sponsors](https://github.com/sponsors/net-aigis?metadata_project=fwbuilder)
- [PayPal](https://www.paypal.com/ncp/payment/Q8RW6JD6EM3Z2)

## Status (honest)

| Track | State |
| --- | --- |
| Desktop GUI (Qt6) | Builds on Linux; Win/Mac smoke via MinGW/local Podman (see `docker/`) |
| WebUI | **6.1.5**: undo object edit, static apt/yum repo tooling, IdP login, packages, lab SSH. See [`webui/STATUS.md`](webui/STATUS.md) + [`webui/REPO.md`](webui/REPO.md) |
| Hard gaps (6.1.0) | Closed: password/KBI SSH, expect runtime, Qt geometry oracle |
| Still open | Full desktop parity; real vendor-box lab; hosted OBS/COPR/PPA accounts |

## WebUI (quick start)

```bash
# Preferred on openSUSE: build against libxml2.so.16
podman build -t fwbuilder-linux-qt6-opensuse \
  -f docker/Dockerfile.linux-qt6-opensuse docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 -e NO_GIT_DIRTY=1 \
  fwbuilder-linux-qt6-opensuse bash docker/build-linux-qt6-fwbweb.sh

# Or Fedora image (wrapper uses Podman when host ldd fails):
# podman build -t fwbuilder-linux-qt6 -f docker/Dockerfile.linux-qt6-fedora docker/

bash webui/scripts/run-stack.sh
# API http://127.0.0.1:8088  UI http://127.0.0.1:5173
# Multi-user: FWBWEB_API_USERS='alice:tok-a,bob:tok-b'
```

Details: [`webui/INSTALL.md`](webui/INSTALL.md), [`webui/README.md`](webui/README.md), [`webui/ARCHITECTURE.md`](webui/ARCHITECTURE.md).

## Desktop build (Linux Qt6)

```bash
# Dependencies vary by distro; Fedora/openSUSE examples are in docker/.
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
