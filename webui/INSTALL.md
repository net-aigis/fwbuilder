# Firewall Builder WebUI — install / run (6.1.2+)

## What you get

Browser UI over the **same** `.fwb` files as the desktop app (`libfwbuilder` bridge).

## Prerequisites

- Podman **or** a host toolchain that can link `fwbweb` (Qt6 + libxml2 matching the binary)
- Python 3.11+
- Node.js 20+ (frontend)

## 1) Build the bridge

**openSUSE / Slowroll (native `libxml2.so.16`, preferred on this host):**

```bash
podman build -t fwbuilder-linux-qt6-opensuse \
  -f docker/Dockerfile.linux-qt6-opensuse docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 -e NO_GIT_DIRTY=1 \
  fwbuilder-linux-qt6-opensuse bash docker/build-linux-qt6-fwbweb.sh
```

**Fedora image (produces `libxml2.so.2` binary; wrapper falls back to Podman):**

```bash
podman build -t fwbuilder-linux-qt6 -f docker/Dockerfile.linux-qt6-fedora docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 -e NO_GIT_DIRTY=1 \
  fwbuilder-linux-qt6 bash docker/build-linux-qt6-fwbweb.sh
```

`webui/bin/fwbweb` uses the host binary when `ldd` is clean; otherwise it runs via Podman.

## 2) Auth (multi-user)

| Env | Meaning |
| --- | --- |
| `FWBWEB_API_TOKEN` | Legacy single token (default `dev-token`) |
| `FWBWEB_API_USER` | Display name for that token (default `admin`) |
| `FWBWEB_API_USERS` | `alice:tok-a,bob:tok-b` |
| `FWBWEB_API_USERS_FILE` | File with `name:token` lines or JSON `{"alice":"tok-a"}` |

`GET /api/v1/me` returns `{ "auth": "ok", "user": "<name>" }`.

## 3) Run

```bash
bash webui/scripts/run-stack.sh
# API http://127.0.0.1:8088
# UI  http://127.0.0.1:5173
```

API only: `FWBWEB_WITH_FRONTEND=0 bash webui/scripts/run-stack.sh`

## 4) Lab SSH proof (password + expect over TCP)

```bash
bash webui/scripts/e2e-lab-ssh.sh
```

## 5) Relocatable tarball

```bash
bash webui/scripts/package-webui.sh
# → dist/fwbuilder-webui-<version>-linux-x86_64.tar.gz
```

## 6) Still not claimed

- Full Qt desktop GUI parity
- Password/expect against every real vendor box (TCP lab stand-in is covered)
- SSO / OIDC (bring tokens via `FWBWEB_API_USERS*` for now)
- Official distro rpm/deb repos
