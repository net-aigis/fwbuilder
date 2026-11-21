# Firewall Builder WebUI — status (honest)

Last updated: 2026-11-21  
Release track: **6.1.1**

## Goal (done)

Browser UI that edits the **same** `.fwb` projects via **libfwbuilder** (no second object model / compilers). Hard gaps closed in **6.1.0**: password/KBI SSH, expect runtime, geometry-oracle pixel parity.

## Works now

| Area | State |
| --- | --- |
| Open / tree / typed editors / rules / save | yes |
| Compile (`fwb_nft` / `fwb_ipt` / …) | yes |
| Deploy BatchMode (key/agent) | yes |
| Deploy password / KBI + expect runtime | code + unit tests (mock); lab optional |
| Multi-user API tokens | `FWBWEB_API_USERS` / `FWBWEB_API_USERS_FILE` |
| Host bridge on openSUSE | native binary when `ldd` clean; else Podman Fedora fallback |
| One-command local stack | `webui/scripts/run-stack.sh` — see [`INSTALL.md`](INSTALL.md) |

## Still open (not claimed)

- Full Qt desktop GUI parity (every dialog / installer path)
- Proven password/expect deploy against every vendor platform in a lab
- SSO / OIDC (use token map for now)
- Distro packages (rpm/deb) — run from git + Podman/native bridge

## Soft-fertig note

Older soft-fertig honesty catalogs (thousands of e2e “phases”) are historical
noise on `feature/webui` history — **not** the product status.
