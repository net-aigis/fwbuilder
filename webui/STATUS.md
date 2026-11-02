# Firewall Builder WebUI — Implementation status

Last updated: 2026-11-02  
Branch: `feature/webui`

## Honest scope

Full desktop-GUI parity is **not** claimed. Deploy/install and many platform option dialogs remain open.

## Phase 1 — foundation

| Item | State | Evidence |
| --- | --- | --- |
| Architecture / local Podman bridge | done | `webui/ARCHITECTURE.md`, `fwbuilder-linux-qt6` |
| open/tree/get/update/save + locks/auth | done | API + `e2e-local.sh` **OK** |
| React object tree + theme | done | `webui/frontend` |

## Phase 2 — editors / rules

| Item | State | Evidence |
| --- | --- | --- |
| Typed attrs in bridge (Network/Service/Firewall/…) | done | `src/fwbweb/main.cpp` |
| Typed object editor UI | done | `ObjectDetail.tsx` field maps |
| `ruleset` / `update_rule` / `search` bridge cmds | done | bridge |
| Policy / NAT / Routing grid UI | done | `RuleGrid.tsx` |
| Add / delete / move rules | done | bridge + API + UI toolbar |
| Reference picker (click cell) | done | `ObjectPicker.tsx` |
| Drag & drop from tree into rule cells | done | HTML5 DnD (`application/x-fwb-object-id`) |
| Search in sidebar | done | API `/search` |
| Local E2E phase2 | done | `e2e-phase2.sh` **OK** |
| All platform option dialogs | open | |

## Phase 3 — compile / deploy

| Item | State | Evidence |
| --- | --- | --- |
| Invoke `fwb_nft` / `fwb_ipt` (same CLIs as GUI) | done | `POST …/compile`, Podman-wrapped ELF |
| Local E2E phase3 (rule ops + compile) | done | `e2e-phase3.sh` **OK** → `nft-test.fw` |
| Install/deploy integration | open | |
| Other platforms (`fwb_pf`, PIX, …) | open | mapping stubbed in `compile.py` |

## Local commands

```bash
podman run --rm -v "$PWD":/src:Z -w /src fwbuilder-linux-qt6 bash docker/build-linux-qt6-fwbweb.sh
bash webui/scripts/e2e-local.sh
bash webui/scripts/e2e-phase2.sh
bash webui/scripts/e2e-phase3.sh
```
