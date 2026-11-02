# Firewall Builder WebUI — Implementation status

Last updated: 2026-11-02  
Branch: `feature/webui`

## Honest scope

Full desktop-GUI parity is **not** claimed.

## Phase 1 — foundation

| Item | State | Evidence |
| --- | --- | --- |
| Architecture / local Podman bridge | done | `webui/ARCHITECTURE.md`, `fwbuilder-linux-qt6` |
| open/tree/get/update/save + locks/auth | done | API + `e2e-local.sh` **OK** |
| React object tree + theme | done | `webui/frontend` |

## Phase 2 — editors / rules (in progress)

| Item | State | Evidence |
| --- | --- | --- |
| Typed attrs in bridge (Network/Service/Firewall/…) | done | `src/fwbweb/main.cpp` |
| Typed object editor UI | done | `ObjectDetail.tsx` field maps |
| `ruleset` / `update_rule` / `search` bridge cmds | done | bridge |
| Policy / NAT / Routing grid UI | done | `RuleGrid.tsx` — disable + policy action |
| Search in sidebar | done | API `/search` |
| Local E2E phase2 | done | `e2e-phase2.sh` **OK** (nft-test Policy 2 rules, toggle disable) |
| Drag & drop into rule cells | open | |
| Add/delete/reorder rules | open | |
| Full reference picker for Src/Dst/Srv | open | |
| All platform option dialogs | open | |

## Phase 3 — compile / deploy

| Item | State |
| --- | --- |
| Invoke `fwb_*` compilers | open |
| Install/deploy integration | open |

## Local commands

```bash
podman run --rm -v "$PWD":/src:Z -w /src fwbuilder-linux-qt6 bash docker/build-linux-qt6-fwbweb.sh
bash webui/scripts/e2e-local.sh
bash webui/scripts/e2e-phase2.sh
```
