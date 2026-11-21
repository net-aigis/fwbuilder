# Firewall Builder WebUI — status (honest)

Last updated: 2026-11-21  
Release track: **6.1.4**

## Goal (done)

Browser UI that edits the **same** `.fwb` projects via **libfwbuilder** (no second object model / compilers). Hard gaps closed in **6.1.0**: password/KBI SSH, expect runtime, geometry-oracle pixel parity.

## Works now

| Area | State |
| --- | --- |
| Open / tree / typed editors / rules / save | yes |
| Compile (`fwb_nft` / `fwb_ipt` / …) | yes |
| Deploy BatchMode (key/agent) | yes |
| Deploy password / KBI + expect | unit mock **and** TCP lab SSH (`tests/test_lab_ssh.py`, `e2e-lab-ssh.sh`) |
| Multi-user API tokens | `FWBWEB_API_USERS` / `FWBWEB_API_USERS_FILE` |
| Host bridge on openSUSE | native binary when `ldd` clean; else Podman Fedora fallback |
| One-command local stack | `webui/scripts/run-stack.sh` — see [`INSTALL.md`](INSTALL.md) |
| Relocatable tarball | `webui/scripts/package-webui.sh` → `dist/fwbuilder-webui-*-linux-x86_64.tar.gz` |
| RPM / DEB | `package-webui-rpm.sh` / `package-webui-deb.sh` (Podman) |
| OIDC JWT | optional `FWBWEB_OIDC_ISSUER` (+ audience/JWKS); static tokens still work |
| SPA IdP login | PKCE + authorize/token endpoints; **IdP login** / Logout in topbar |
| Object JSON export | Download JSON from object detail (parity slice) |

## Still open (not claimed)

- Full Qt desktop GUI parity (every dialog / installer path)
- Proven password/expect against **real** vendor gear (lab SSH is a TCP stand-in)
- Published OBS/COPR/PPA repos

## Soft-fertig note

Older soft-fertig honesty catalogs (thousands of e2e “phases”) are historical
noise on `feature/webui` history — **not** the product status.
