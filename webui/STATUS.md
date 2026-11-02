# Firewall Builder WebUI — Implementation status

Last updated: 2026-11-02  
Branch: `feature/webui`

## Honest scope

Full desktop-GUI parity is **not** claimed. This file tracks what exists and
what is still open. Do not treat unchecked items as done.

## Phase 1 — foundation

| Item | State | Evidence |
| --- | --- | --- |
| Architecture written | done | `webui/ARCHITECTURE.md` |
| Branch `feature/webui` | done | git |
| Native Linux Podman image | done | `docker/Dockerfile.linux-qt6-fedora` → `fwbuilder-linux-qt6` |
| C++ `fwbweb` bridge (open/tree/get/update/save) | done | `src/fwbweb/fwbweb` built in container |
| Host wrapper (libxml2.so.2 via Podman) | done | `webui/bin/fwbweb` |
| `FWBUILDER_RES_DIR` override | done | `Constants.cpp` + `webui/.res/` |
| FastAPI open/tree/get/update/save/auth/lock | done | `webui/backend/` — `pytest` 4 passed |
| React shell + object tree + edit name/comment | done | `webui/frontend/` |
| Local E2E open→tree→update→save→close | done | `webui/scripts/e2e-local.sh` → **OK** (2026-11-02) |
| Sample fixtures | done | `webui/fixtures/sample-v24.fwb` |
| CI workflow file | present | not used for this pass (local only) |
| WebSocket live updates | stub | accept-only |
| Light/dark theme | partial | toggle present |

## Phase 2 — editors

| Item | State |
| --- | --- |
| Typed attribute editors (address/service/…) | open |
| Firewall / interface editors | open |
| Policy / NAT / Routing grids | open |
| Drag & drop | open |
| Search / references / validation UI | open |

## Phase 3 — compile / deploy

| Item | State |
| --- | --- |
| Invoke existing `fwb_*` compilers | open |
| Show compiler log / generated config | open |
| Existing install/deploy integration | open |

## Phase 4 — parity / acceptance

| Item | State |
| --- | --- |
| Systematic desktop vs WebUI checklist | open |
| Round-trip XML identity tests | open |
| Compiler output comparison | open |

## Local commands (no GitHub Actions)

```bash
# one-time image + bridge
podman build -t fwbuilder-linux-qt6 -f docker/Dockerfile.linux-qt6-fedora docker/
podman run --rm -v "$PWD":/src:Z -w /src -e JOBS=4 fwbuilder-linux-qt6 \
  bash docker/build-linux-qt6-fwbweb.sh

# API + bridge E2E
bash webui/scripts/e2e-local.sh
```
