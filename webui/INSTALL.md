# Firewall Builder WebUI — install / run (6.1.4+)

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

## 2) Auth (multi-user + optional OIDC)

| Env | Meaning |
| --- | --- |
| `FWBWEB_API_TOKEN` | Legacy single token (default `dev-token`) |
| `FWBWEB_API_USER` | Display name for that token (default `admin`) |
| `FWBWEB_API_USERS` | `alice:tok-a,bob:tok-b` |
| `FWBWEB_API_USERS_FILE` | File with `name:token` lines or JSON `{"alice":"tok-a"}` |
| `FWBWEB_OIDC_ISSUER` | IdP issuer URL (enables JWT bearer via JWKS) |
| `FWBWEB_OIDC_AUDIENCE` | Expected `aud` (optional; if empty, aud not verified) |
| `FWBWEB_OIDC_JWKS_URL` | Override JWKS URL (else from discovery) |
| `FWBWEB_OIDC_CLIENT_ID` | SPA public client (enables **IdP login** button) |
| `FWBWEB_OIDC_CLIENT_SECRET` | Optional confidential client secret |
| `FWBWEB_OIDC_REDIRECT_URI` | Default `http://127.0.0.1:5173/` |
| `FWBWEB_OIDC_SCOPES` | Default `openid profile email` |

`GET /api/v1/auth/config` — public modes (`login_enabled` when client_id set).  
SPA: **IdP login** uses auth-code + PKCE (`/auth/oidc/authorize-url`, `/auth/oidc/token`).  
`GET /api/v1/me` → `{ "auth": "ok", "user": "<name>", "method": "token"|"oidc" }`.

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

## 5) Packages

```bash
bash webui/scripts/package-webui.sh          # tar.gz
bash webui/scripts/package-webui-rpm.sh      # .rpm via Podman
bash webui/scripts/package-webui-deb.sh      # .deb via Podman
# → dist/fwbuilder-webui-*
```

## 6) Still not claimed

- Full Qt desktop GUI parity
- Password/expect against every real vendor box (TCP lab stand-in is covered)
- Published OBS/COPR/PPA repos (local rpm/deb build scripts exist)
