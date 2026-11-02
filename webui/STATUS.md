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
| Option groups from `src/res/platform` + `os` | done | `GET /api/v1/option-schema`, UI tabs |
| Typed fields from libgui AdvancedDialog `.ui` | done | `dialog_fields.json` + checkboxes/enums/textareas |
| Dialog tab pages as option groups | done | extract pages → `option-schema.groups`; UI tabs |
| Full Qt dialog page/layout parity | open | Types/keys/pages yes; pixel layout no |
| PolicyRuleOptions editor | done | select rule → Rule options panel; E2E phase6 |
| Rule options dialog schema (Policy/NAT/Routing) | done | `GET /rule-option-schema`; typed tabs; E2E phase8 |
| InterfaceOptions editor | done | IfaceOptsDialog fields + `GET /interface-option-schema`; E2E phase7 |
| Host options + management | done | Host panel; E2E phase8 |
| Create / delete objects | done | bridge `create`/`delete` + UI; User library parent |
| Duplicate / reparent objects | done | bridge `duplicate`/`reparent` + UI; E2E phase9 |
| Where-used references | done | bridge `where_used` + panel; E2E phase10 |
| Group members add/remove | done | bridge `members`/`add_member`/`remove_member`; E2E phase11 |
| Duplicate rule + negate cell | done | `duplicate_rule` + picker Toggle negate; E2E phase12 |
| Rule meta (group/comment/direction/logging) | done | RuleMeta panel + `update_rule` group; E2E phase12 |
| Save write-through | done | Save through button → `write_through` |
| Interface + IPv4 under Firewall | done | CreateObject host-like parents; E2E phase13 |
| Interval time objects | done | typed attrs + create under Time; E2E phase13 |
| Where-used de-duplication | done | unique display ids in `where_used` |
| Address/Network/Range via InetAddr setters | done | `applyObjectAttrs`; XML roundtrip; E2E phase14 |
| Remove rule refs from picker | done | ObjectPicker current + Remove; E2E phase15 |
| Interface physAddress / label | done | `setPhysicalAddress` / `setLabel`; E2E phase15 |
| Object color attr | done | attrs `color` + ObjectDetail field; E2E phase15 |
| AddressTable / Tag / User / CustomService | done | typed attrs + create; E2E phase16 |
| Policy When column | done | RuleGrid `when` cell; E2E phase16 |
| NAT action + routing metric edit | done | RuleGrid selects/inputs; E2E phase16 |
| Insert rule before/after | done | toolbar + `add_rule` where; E2E phase17 |
| IPv6 / AttachedNetworks create | done | CreateObject under iface/host; E2E phase17 |
| Tree color swatch + collapse | done | ObjectTree swatch/twisties |
| Object lock/unlock (RO) | done | `set_ro` + Lock/Unlock; E2E phase18 |
| Unsaved dirty flag | done | statusbar after mutations |
| ICMP6Service create | done | CreateObject + typed fields; E2E phase18 |
| Tree address/hint | done | ObjectTree hint from attrs |
| Rule branch target | done | `branch_id` on Policy/NAT; RuleMeta; E2E phase19 |
| Download workspace .fwb | done | `GET …/download`; E2E phase19 |
| Close confirms if dirty | done | App confirm dialog |
| Create Firewall/Host + Policy/NAT | done | CreateObject under groups/fw; E2E phase20 |
| Interface management flag | done | `setManagement`; E2E phase20 |
| Search type filter | done | sidebar select; E2E phase21 |
| Lazy tree expand | done | ObjectTree loads children via get; E2E phase21 |
| Dirty beforeunload / reopen confirm | done | App guards |
| Interface dyn / unnumbered / security_level | done | setters + ObjectDetail; E2E phase22 |
| Move rule to absolute position | done | Move to… toolbar; E2E phase22 |
| Hide disabled / filter by rule group | done | rules toolbar filters |
| Create Library with folder skeleton | done | populateLibraryFolders; E2E phase23 |
| RuleSet `top` flag | done | secondary Policy/NAT/Routing; E2E phase23 |
| Rule group header rows | done | RuleGrid visual groups |
| Multi Policy/NAT ruleset picker | done | `ruleset_list` + UI select; E2E phase24 |
| parent_id on objects | done | objectToJson; open Policy from tree |
| Full local E2E runner | done | `webui/scripts/e2e-all.sh` |

## Phase 3 — compile / deploy

| Item | State | Evidence |
| --- | --- | --- |
| Invoke `fwb_nft` / `fwb_ipt` (same CLIs as GUI) | done | `POST …/compile`, Podman-wrapped ELF |
| Download compile outputs | done | `GET …/compile/outputs/{file}` |
| Local E2E phase3 (rule ops + compile) | done | `e2e-phase3.sh` **OK** → `nft-test.fw` |
| FirewallOptions + Management address | done | `options` / `management` bridge cmds + UI |
| Deploy via system `scp`/`ssh` (dry-run default) | done | `POST …/deploy` — **not** full desktop FirewallInstaller |
| Local E2E phase4 | done | `e2e-phase4.sh` **OK** |
| Platform catalog from resources XML | done | `GET /api/v1/platforms` |
| Compilers `fwb_pf` / `fwb_ipf` / `fwb_ipfw` | done | local Podman build; compile via XML `<compiler>` |
| Cisco/Juniper/Procurve compilers | done | `fwb_pix`, `fwb_iosacl`, `fwb_nxosacl`, `fwb_junosacl`, `fwb_procurve_acl` |
| Local E2E phase5 | done | `e2e-phase5.sh` **OK** |
| Local E2E phase6 (typed fields + rule options) | done | `e2e-phase6.sh` **OK** |
| Local E2E phase7 (create/delete + iface options) | done | `e2e-phase7.sh` **OK** |
| Local E2E phase8 (rule schema + service create + host) | done | `e2e-phase8.sh` **OK** |
| Local E2E phase9 (duplicate + reparent) | done | `e2e-phase9.sh` **OK** |
| Local E2E phase10 (where-used) | done | `e2e-phase10.sh` **OK** |
| Local E2E phase11 (group members) | done | `e2e-phase11.sh` **OK** |
| Local E2E phase12 (duplicate rule + negate) | done | `e2e-phase12.sh` **OK** |
| Local E2E phase13 (iface/IPv4 + Interval) | done | `e2e-phase13.sh` **OK** |
| Local E2E phase14 (address InetAddr roundtrip) | done | `e2e-phase14.sh` **OK** |
| Local E2E phase15 (remove ref + MAC + color) | done | `e2e-phase15.sh` **OK** |
| Local E2E phase16 (AT/Tag/User/When/NAT/metric) | done | `e2e-phase16.sh` **OK** |
| Local E2E phase17 (insert + IPv6 + AttachedNetworks) | done | `e2e-phase17.sh` **OK** |
| Local E2E phase18 (lock/unlock + ICMP6) | done | `e2e-phase18.sh` **OK** |
| Local E2E phase19 (branch + download) | done | `e2e-phase19.sh` **OK** |
| Local E2E phase20 (new Firewall + management) | done | `e2e-phase20.sh` **OK** |
| Local E2E phase21 (search type + lazy tree) | done | `e2e-phase21.sh` **OK** |
| Local E2E phase22 (iface flags + move to) | done | `e2e-phase22.sh` **OK** |
| Local E2E phase23 (Library + RuleSet top) | done | `e2e-phase23.sh` **OK** |
| Local E2E phase24 (multi ruleset list) | done | `e2e-phase24.sh` **OK** |

## Local commands

```bash
podman run --rm -v "$PWD":/src:Z -w /src -e SKIP_COMPILERS=1 fwbuilder-linux-qt6 bash docker/build-linux-qt6-fwbweb.sh
# or incremental bridge only:
podman run --rm -v "$PWD":/src:Z -w /src fwbuilder-linux-qt6 make -C src/fwbweb
# regenerate dialog field catalog after GUI UI changes:
python3 webui/scripts/extract-dialog-fields.py
bash webui/scripts/e2e-local.sh
bash webui/scripts/e2e-phase2.sh
bash webui/scripts/e2e-phase3.sh
bash webui/scripts/e2e-phase4.sh
bash webui/scripts/e2e-phase5.sh
bash webui/scripts/e2e-phase6.sh
bash webui/scripts/e2e-phase7.sh
bash webui/scripts/e2e-phase8.sh
bash webui/scripts/e2e-phase9.sh
bash webui/scripts/e2e-phase10.sh
bash webui/scripts/e2e-phase11.sh
bash webui/scripts/e2e-phase12.sh
bash webui/scripts/e2e-phase13.sh
bash webui/scripts/e2e-phase14.sh
bash webui/scripts/e2e-phase15.sh
bash webui/scripts/e2e-phase16.sh
bash webui/scripts/e2e-phase17.sh
bash webui/scripts/e2e-phase18.sh
bash webui/scripts/e2e-phase19.sh
bash webui/scripts/e2e-phase20.sh
bash webui/scripts/e2e-phase21.sh
bash webui/scripts/e2e-phase22.sh
bash webui/scripts/e2e-phase23.sh
bash webui/scripts/e2e-phase24.sh
# or everything:
bash webui/scripts/e2e-all.sh
```
