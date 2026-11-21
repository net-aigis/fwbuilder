# Firewall Builder WebUI — status (honest)

Last updated: 2026-11-21  
Release track: **6.1.7**

## Goal (done)

Browser UI that edits the **same** `.fwb` projects via **libfwbuilder** (no second object model / compilers). Hard gaps closed in **6.1.0**: password/KBI SSH, expect runtime, geometry-oracle pixel parity.

## Works now

| Area | State |
| --- | --- |
| Open / tree / typed editors / rules / save | yes |
| Compile (`fwb_nft` / `fwb_ipt` / …) | yes |
| Deploy BatchMode (key/agent) | yes |
| Deploy password / KBI + expect | unit mock **and** TCP multi-vendor lab (`tests/test_lab_ssh.py`, `tests/test_lab_vendor_emulation.py`) |
| Emulated vendor boxes | IOS / Junos / Procurve expect + SFTP password deploy (self-tested) |
| AdvancedDialog geometry self-parity | 30 dialogs via `/layout-fidelity/parity-check` |
| Multi-user API tokens | `FWBWEB_API_USERS` / `FWBWEB_API_USERS_FILE` |
| Host bridge on openSUSE | native binary when `ldd` clean; else Podman Fedora fallback |
| One-command local stack | `webui/scripts/run-stack.sh` — see [`INSTALL.md`](INSTALL.md) |
| Relocatable tarball | `webui/scripts/package-webui.sh` → `dist/fwbuilder-webui-*-linux-x86_64.tar.gz` |
| RPM / DEB | `package-webui-rpm.sh` / `package-webui-deb.sh` (Podman) |
| OIDC JWT | optional `FWBWEB_OIDC_ISSUER` (+ audience/JWKS); static tokens still work |
| SPA IdP login | PKCE + authorize/token endpoints; **IdP login** / Logout in topbar |
| Object JSON export | Download JSON from object detail (parity slice) |
| Undo object edit | Ctrl+Z / Undo button (one-level snapshot) |
| Static apt/yum repo | Live on GitHub Pages: https://net-aigis.github.io/fwbuilder/ |

## Still open (not claimed)

- Full Qt desktop GUI parity (every chrome / installer path beyond AdvancedDialog oracle)
- Proven password/expect against **physical** vendor gear (lab is an emulated TCP stand-in)

## Soft-fertig note

Older soft-fertig honesty catalogs (thousands of e2e “phases”) are historical
noise on `feature/webui` history — **not** the product status.
