# Firewall Builder WebUI — Implementation status

Last updated: 2026-11-02  
Branch: `feature/webui`

## Honest scope

Full desktop-GUI parity is **not** claimed. This file tracks what exists and
what is still open. Do not treat unchecked items as done.

## Phase 1 — foundation (in progress)

| Item | State | Evidence |
| --- | --- | --- |
| Architecture written | done | `webui/ARCHITECTURE.md` |
| Branch `feature/webui` | done | git |
| C++ `fwbweb` bridge (open/tree/get/save) | done (source) | `src/fwbweb/` — not yet compiled here (tree was MinGW-configured) |
| FastAPI open/save/tree/auth/lock | done (source) | `webui/backend/` — `pytest` **4 passed** locally |
| React shell + object tree | done (source) | `webui/frontend/` — `npm run typecheck` + `npm run build` **ok** |
| Sample `.fwb` fixture | done | `webui/fixtures/sample.fwb` |
| CI workflow for WebUI | done (source) | `.github/workflows/fwbuilder-webui.yml` |
| End-to-end open→tree→save vs desktop | open | requires native-built `fwbweb` + manual/CI run |
| Light/dark theme toggle | partial | CSS variables + toggle; polish later |
| WebSocket live updates | stub | endpoint reserved; not wired to mutations yet |

## Phase 2 — editors

| Item | State |
| --- | --- |
| Object property editors | open |
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
| Compiler output comparison for same project | open |
| Security review of auth/locks/sandbox | open |

## Known risks

- `fwbweb` must be built against the same libfwbuilder as the desktop tools.
- Auto-upgrade of `.fwb` files follows libfwbuilder predicates; Phase 1 defaults
  to **no silent upgrade** unless explicitly requested.
- Windows/macOS WebUI packaging is out of scope for Phase 1 (Linux CI first).
