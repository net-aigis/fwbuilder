# Firewall Builder WebUI — Implementation status

Last updated: 2026-11-03  
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
| Full Qt dialog page/layout parity | open | Types/keys/pages + .ui labels + page nav; pixel layout no |
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
| Firewall lastModified / lastCompiled / lastInstalled | done | attrs + auto bump; touch after compile/deploy; E2E phase25 |
| Ctrl+S / Ctrl+Shift+S save | done | App keyboard shortcut |
| Rule text filter | done | comment/action filter in rules toolbar |
| NetworkIPv6 create | done | InetAddr AF_INET6; E2E phase25 |
| New blank project | done | `POST /projects/new` from objects_init + User library; E2E phase26 |
| Save as | done | `save_as` on `/save` + UI; E2E phase26 |
| DNSName / AddressRange create fields | done | CreateObject dnsname/filename + range; E2E phase26 |
| Bulk enable/disable visible rules | done | Rules toolbar; E2E phase26 |
| Recent project paths | done | localStorage datalist |
| Compile all firewalls | done | `POST …/compile-all` + UI; E2E phase27 |
| Rule filter matches object names | done | src/dst/srv/… via formatRuleObjects |
| Tag/User/Interval create fields | done | CreateObject; E2E phase27 |
| CustomService / IPService create fields | done | CreateObject; E2E phase28 |
| Compile outputs zip download | done | `GET …/compile/zip`; E2E phase28 |
| Expanded search type filter | done | AddressRange/Tag/Custom/… |
| Confirm bulk enable/disable | done | window.confirm before bulk |
| ICMP/ICMP6 create type/code | done | CreateObject; E2E phase29 |
| Object color on create | done | color picker + attrs; E2E phase29 |
| Platform/OS dropdowns on create | done | `GET /platforms` → CreateObject |
| Rule shortcuts Delete / Ctrl+D | done | rules tab keyboard |
| Tree name/type filter | done | ObjectTree filter prop |
| Alt+Up/Down move rule | done | rules tab keyboard |
| List open sessions | done | `GET /api/v1/sessions`; E2E phase30 |
| Copy rule to other ruleset | done | `duplicate_rule` + `ruleset_id`; E2E phase31 |
| Soft-delete / purge objects | done | move to Deleted Objects; permanent/`?permanent=`; E2E phase32 |
| `deleted` / library on objects | done | objectToJson library_id/name/deleted |
| TCP/UDP source port on create | done | CreateObject src+dst; E2E phase32 |
| Arrow keys select rules | done | Up/Down among visible rules |
| Ctrl+click rule cell → object | done | RuleGrid onJumpObject |
| Restore from Deleted Objects | done | reparent to User Objects; E2E phase33 |
| Empty Deleted Objects | done | `POST …/empty-deleted`; E2E phase33 |
| Space toggles rule disabled | done | rules tab keyboard |
| Trash badge in object tree | done | ObjectTree deleted style |
| List Deleted Objects | done | `GET …/deleted` + trash count; E2E phase34 |
| L / G rule logging & direction | done | keyboard + clickable cells; E2E phase34 |
| Bulk comment visible rules | done | Comment visible… toolbar |
| Copy object id | done | ObjectDetail button |
| Bulk group visible rules | done | Group visible… toolbar; E2E phase35 |
| Ctrl+D duplicate object | done | object tab keyboard; E2E phase35 |
| Selected rule scrollIntoView | done | RuleGrid |
| Find unused objects | done | `GET …/unused` + Unused button; E2E phase36 |
| Trash panel (restore/purge) | done | trash badge opens list; E2E phase36 |
| Ctrl+F focus search | done | App keyboard |
| Jump to parent object | done | Parent button |
| Copy visible rules TSV | done | Copy TSV toolbar |
| Rule index in status bar | done | selected/visible count |
| Escape clears panels/search | done | picker/trash/unused/search |
| Delete unused batch | done | Delete all on unused list; E2E phase37 |
| Delete secondary ruleset | done | toolbar + permanent delete; E2E phase37 |
| Where-used warn on delete | done | confirm shows reference count |
| Sessions count in status | done | `GET /sessions`; E2E phase37 |
| Restore to previous parent | done | soft-delete stores parent; `POST …/restore`; E2E phase38 |
| Object path breadcrumb | done | `GET …/path` + nav; E2E phase38 |
| Make ruleset top | done | toolbar Make top; E2E phase38 |
| Ctrl+N new project | done | keyboard + New button |
| Collapse tree | done | depth-1 reload; E2E phase39 |
| Copy object JSON | done | ObjectDetail button |
| Restore all trash | done | trash panel; E2E phase39 |
| Ruleset rule_count | done | firewall `ruleset_list`; E2E phase40 |
| Ctrl+E compile | done | keyboard + Compile button |
| Download rules TSV | done | Download TSV toolbar |
| Project stats panel | done | `GET …/stats` + Ctrl+I; E2E phase41 |
| Stats unused count | done | stats merges find_unused; E2E phase42 |
| Ctrl+Shift+F rule filter | done | focuses rules filter |
| Visible/total rule count | done | rules panel header |
| Clear rule filters | done | toolbar when filters active |
| F2 rename focus | done | ObjectDetail name field |
| Stats firewall list + JSON download | done | stats panel; E2E phase43 |
| Download compile log | done | Compile panel button |
| Stats clusters vs firewalls | done | separate counts; E2E phase44 |
| Ctrl+Shift+E compile all | done | keyboard |
| Copy object path | done | breadcrumb Copy path; E2E phase45 |
| Jump to firewall from rules | done | Firewall button; E2E phase45 |
| Copy rule id + position | done | Rule meta; E2E phase46 |
| Create Cluster | done | CreateObject + search type; E2E phase47 |
| Unused JSON + per-item delete | done | unused panel; E2E phase48 |
| DynamicGroup create | done | CreateObject + search; E2E phase49 |
| Expand tree (depth 5) | done | Expand button; E2E phase49 |
| Sessions panel | done | statusbar click; E2E phase49 |
| Where-used count badge | done | statusbar used N |
| DynamicGroup filter edit | done | attrs `filter`; E2E phase50 |
| Duplicate Firewall confirm | done | UI confirm; E2E phase50 |
| Unused list sorted | done | type then name |
| Rename ruleset | done | Rename… toolbar; E2E phase51 |
| Copy rule JSON | done | rules toolbar |
| Search hits sorted | done | type then name |
| Home/End rule navigation | done | rules keyboard |
| Search hits JSON download | done | search panel |
| Disabled rule count | done | rules header; E2E phase52 |
| Secondary NAT create | done | CreateObject; E2E phase52 |
| Reject 2nd Routing under Firewall | done | bridge validateChild; E2E phase53 |
| Secondary Policy create | done | CreateObject; E2E phase53 |
| Next/prev disabled rule | done | N / Shift+N; E2E phase53 |
| Search / unused TSV download | done | search + unused panels |
| Copy ruleset id | done | rules toolbar |
| Only-disabled rule filter | done | rules toolbar; E2E phase54 |
| Download rules JSON | done | rules toolbar |
| Host create types (no Policy/NAT/Routing) | done | CreateObject; E2E phase54 |
| Rule action filter | done | rules toolbar; E2E phase55 |
| Delete visible rules | done | rules toolbar; E2E phase55 |
| Copy firewall id | done | rules toolbar |
| Duplicate Policy/NAT ruleset | done | toolbar; E2E phase56 |
| Where-used JSON download | done | WhereUsed panel |
| Bulk set action visible | done | Action visible…; E2E phase57 |
| Copy rules JSON | done | rules toolbar |
| Only-disabled toggle key | done | `o` on rules tab |
| Group members JSON download | done | GroupMembers; E2E phase57 |
| Search by object id | done | search merges GET by id; E2E phase58 |
| Copy visible rules to ruleset | done | Copy visible to…; E2E phase58 |
| Clear recent project paths | done | topbar |
| Move visible rules to ruleset | done | Move visible to…; E2E phase59 |
| Delete object key | done | Delete/Backspace on object tab |
| Sessions JSON download | done | sessions panel; E2E phase59 |
| Rules header fw platform/OS | done | loadRules meta; E2E phase60 |
| Unused type filter | done | unused panel; E2E phase60 |
| Object tree JSON download | done | Tree JSON button |
| Bridge search matches object id | done | collectSearch; E2E phase61 |
| Edit rule comment key | done | `c` on rules tab; E2E phase61 |
| Cycle disabled filter key | done | `f` all→hide→only |
| Edit rule group key | done | `m` on rules tab; E2E phase62 |
| Copy object id shortcut | done | Ctrl+Shift+C |
| Active filters in rules header | done | hide/only/action/group labels |
| Jump to rule position | done | Jump… / `j`; E2E phase63 |
| Stats rulesets count | done | bridge stats; E2E phase63 |
| Search matches object comment | done | collectSearch; E2E phase64 |
| Bulk logging visible rules | done | Log on/off visible; E2E phase64 |
| Search hit shows comment | done | search panel; E2E phase65 |
| Bulk direction visible | done | Direction visible…; E2E phase65 |
| Stats fw Rules/Compile actions | done | stats list; E2E phase66 |
| Stats fw platform enrichment | done | fetchObject per fw |
| Rules TSV id/logging/direction | done | rulesToTsv; E2E phase67 |
| Status bar rule position | done | pos N next to visible index |
| Unused TSV includes comment | done | unused panel; E2E phase68 |
| Deleted Objects JSON/TSV | done | trash panel; E2E phase68 |
| Jump where-used rule → Rules tab | done | WhereUsed; E2E phase69 |
| Deleted Objects type filter | done | trash panel; E2E phase70 |
| Deploy dry-run from stats/rules | done | Deploy dry-run; E2E phase71 |
| Alt+R open Policy for Firewall | done | keyboard; E2E phase72 |
| Alt+D deploy dry-run | done | keyboard; E2E phase72 |
| Open Policy/NAT/Routing on Firewall | done | object panel; E2E phase73 |
| Cycle disabled filter button | done | Cycle disabled; E2E phase74 |
| Alt+N / Alt+G open NAT / Routing | done | keyboard; E2E phase75 |
| Keyboard shortcuts help | done | `?` / Help; E2E phase76 |
| Cycle action filter | done | `a` / Cycle action; E2E phase77 |
| Copy selected rule TSV | done | `t` / Copy selected TSV; E2E phase78 |
| Copy selected rule JSON | done | `y` / Copy selected JSON; E2E phase79 |
| Cycle group filter | done | `u` / Cycle group; E2E phase80 |
| PageUp/PageDown rule jump | done | ±10 visible; E2E phase81 |
| Alt+P cycle Policy/NAT/Routing | done | keyboard; E2E phase82 |
| Copy object path shortcut | done | Ctrl+Shift+P; E2E phase83 |
| Esc clears rule filters | done | rules tab; E2E phase84 |
| Stats TSV download | done | stats panel; E2E phase85 |
| Insert / Ctrl+Enter add rule | done | bottom / Shift=top; E2E phase86 |
| Slash focuses search | done | `/`; E2E phase87 |
| Persist theme | done | localStorage; E2E phase88 |
| Search dblclick opens Policy | done | Firewall/Cluster; E2E phase89 |
| Theme toggle shortcut | done | Ctrl+Shift+L; E2E phase90 |
| Copy selected rule id | done | `i`; E2E phase91 |
| Object/Rules tab shortcuts | done | Ctrl+1 / Ctrl+2; E2E phase92 |
| Persist rulesWhich | done | sessionStorage; E2E phase93 |
| Unused shortcut | done | Ctrl+Shift+U; E2E phase94 |
| Copy rule position | done | `p`; E2E phase95 |
| Copy compile/deploy log | done | Ctrl+Shift+K; E2E phase96 |
| Persist rules context | done | sessionStorage `rulesCtx`; restore on open; E2E phase97 |
| Persist rule filters | done | sessionStorage `ruleFilters`; E2E phase98 |
| Clear compile/deploy log | done | Clear log / Ctrl+Shift+X / Esc; E2E phase99 |
| Download compile log shortcut | done | Ctrl+Shift+D; E2E phase100 |
| Live deploy double confirm | done | Deploy live / FirewallExtras; E2E phase101 |
| Persist main tab | done | sessionStorage `mainTab`; E2E phase102 |
| Copy object name shortcut | done | Ctrl+Shift+N; E2E phase103 |
| Persist tree/search filters | done | sessionStorage; E2E phase104 |
| Rules restore status message | done | after open; E2E phase105 |
| Copy name button | done | object path bar; E2E phase106 |
| Refresh ruleset | done | Refresh / `r`; E2E phase107 |
| Download shortcuts file | done | Help Download; E2E phase108 |
| Copy object TSV | done | Ctrl+Shift+Y; E2E phase109 |
| Persist unused/trash type filters | done | sessionStorage; E2E phase110 |
| Scroll compile log into view | done | after update; E2E phase111 |
| Rules header compile/install times | done | lastCompiled/lastInstalled; E2E phase112 |
| Compile log wrap toggle | done | sessionStorage; E2E phase113 |
| Tree expand/collapse shortcuts | done | Ctrl+[ / Ctrl+]; E2E phase114 |
| Copy object comment | done | Ctrl+Shift+M; E2E phase115 |
| Copy firewall name | done | rules header; E2E phase116 |
| Dialog page nav + reset defaults | done | FirewallExtras; E2E phase117 |
| Persist option dialog page | done | sessionStorage per platform; E2E phase118 |
| Deploy remote_dir/identity/activate | done | FirewallExtras; E2E phase119 |
| Copy deploy log + denser options grid | done | FirewallExtras/CSS; E2E phase120 |
| Cycle recent project paths | done | Alt+, / Alt+.; E2E phase121 |
| Rule options page nav | done | RuleOptions ←/→; E2E phase122 |
| Interface options page nav | done | InterfaceOptions; E2E phase123 |
| Persist interface option page | done | sessionStorage; E2E phase124 |
| Host options filter + TSV | done | HostOptions; E2E phase125 |
| Copy project path | done | Ctrl+Shift+G; E2E phase126 |
| Deploy reads compiler `# files:` manifest | done | multi-file scp + main activate; E2E phase127 |
| Qt .ui field labels in options UI | done | extract-dialog-fields + OptionField; E2E phase128 |
| activationCmd macros + IPv6 scp host | done | `{{$fwdir}}`/`{{$fwscript}}`; E2E phase129 |
| OS installer configlets for activate | done | linux24/… configlets; plan lines; E2E phase130 |
| QRadioButton as bool + .ui label | done | extract + OptionField; E2E phase131 |
| Option key hint beside .ui label | done | OptionField; E2E phase132 |
| Installer configlet preview API | done | `GET /installer-configlet`; E2E phase133 |
| Deploy plan in App compile log | done | dry-run/live; E2E phase134 |
| Configlet resolve without linux24 leak | done | family/linux-only fallback; FreeBSD rc_conf; E2E phase135 |
| List installer configlets API | done | `GET /installer-configlets`; E2E phase136 |
| Preview configlet in FirewallExtras | done | button + client; E2E phase137 |
| QGroupBox sections in options UI | done | extract + schema sections; E2E phase138 |
| Deploy compressScript (per request) | done | body.compress + UI; E2E phase139 |
| Interactive installer warning + deploy prefs | done | FirewallExtras; E2E phase140 |
| Root vs reg_user activation configlets | done | linux24; E2E phase141 |
| SSH identity `~` expand + missing check | done | dry-run expand / live reject; E2E phase142/144 |
| openwrt installer configlet resolve | done | own dir or linux24; E2E phase143 |
| Deploy use_scp override + Copy plan | done | body/UI; E2E phase145 |
| ios use_scp configlet branches | done | copy vs config term; E2E phase146 |
| External PolicyInstallScript deploy | done | local run like Unx; E2E phase147–148 |
| copyFWB (.fwb with policy) | done | deploy body/UI; E2E phase149 |
| Deploy mode + host prefs persistence | done | scp_ssh/external; E2E phase150 |
| .ui tooltips on option fields | done | extract + OptionField title; E2E phase151 |
| Deploy plan file sizes + ConnectTimeout | done | E2E phase152 |
| Absolute remote_dir validation | done | E2E phase153 |
| Interactive flags for Cisco/Juniper/… | done | pix/junos/nxos/procurve; E2E phase154 |
| App mode= log + interactive live confirm | done | E2E phase155 |
| Installer capabilities API + UI hint | done | `GET /installer-capabilities`; E2E phase156 |
| Persist last deploy plan | done | sessionStorage; E2E phase157 |
| Full local E2E runner | done | `webui/scripts/e2e-all.sh` |

## Soft-complete (feature/webui polish track)

WebUI on `feature/webui` remains soft-complete for the polish track; hard-gap slices continue through phase156+:

- Deploy: manifest `# files:`, OS configlets, external PolicyInstallScript, copyFWB, use_scp/compress, capabilities API (still **no** expect/SSHSession)
- Options: .ui labels, QRadio bool, QGroupBox sections, tooltips (still **no** pixel Qt layout)

Still open:

- Full Qt AdvancedDialog **pixel** layout parity
- Full desktop **FirewallInstaller** expect/SSHSession for Cisco/Juniper/Procurve interactive installers

## Phase 3 — compile / deploy

| Item | State | Evidence |
| --- | --- | --- |
| Invoke `fwb_nft` / `fwb_ipt` (same CLIs as GUI) | done | `POST …/compile`, Podman-wrapped ELF |
| Download compile outputs | done | `GET …/compile/outputs/{file}` |
| Local E2E phase3 (rule ops + compile) | done | `e2e-phase3.sh` **OK** → `nft-test.fw` |
| FirewallOptions + Management address | done | `options` / `management` bridge cmds + UI |
| Deploy via system `scp`/`ssh` (dry-run default) | done | Manifest + OS installer configlets + plan; **not** full expect/SSHSession installer |
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
| Local E2E phase25 (timestamps + NetworkIPv6) | done | `e2e-phase25.sh` **OK** |
| Local E2E phase26 (new/save-as/DNS/range/bulk) | done | `e2e-phase26.sh` **OK** |
| Local E2E phase27 (compile-all + Tag/User/Interval) | done | `e2e-phase27.sh` **OK** |
| Local E2E phase28 (IP/Custom create + compile zip) | done | `e2e-phase28.sh` **OK** |
| Local E2E phase29 (ICMP/color/platforms/dup) | done | `e2e-phase29.sh` **OK** |
| Local E2E phase30 (sessions + rule move) | done | `e2e-phase30.sh` **OK** |
| Local E2E phase31 (copy rule to ruleset) | done | `e2e-phase31.sh` **OK** |
| Local E2E phase32 (soft-delete + TCP ports) | done | `e2e-phase32.sh` **OK** |
| Local E2E phase33 (restore + empty trash) | done | `e2e-phase33.sh` **OK** |
| Local E2E phase34 (deleted list + log/dir) | done | `e2e-phase34.sh` **OK** |
| Local E2E phase35 (bulk group + object dup) | done | `e2e-phase35.sh` **OK** |
| Local E2E phase36 (unused + trash restore) | done | `e2e-phase36.sh` **OK** |
| Local E2E phase37 (del ruleset + unused) | done | `e2e-phase37.sh` **OK** |
| Local E2E phase38 (restore parent + path) | done | `e2e-phase38.sh` **OK** |
| Local E2E phase39 (restore-all + collapse) | done | `e2e-phase39.sh` **OK** |
| Local E2E phase40 (ruleset rule_count) | done | `e2e-phase40.sh` **OK** |
| Local E2E phase41 (project stats) | done | `e2e-phase41.sh` **OK** |
| Local E2E phase42 (stats unused) | done | `e2e-phase42.sh` **OK** |
| Local E2E phase43 (stats fw list + rename) | done | `e2e-phase43.sh` **OK** |
| Local E2E phase44 (clusters vs firewalls) | done | `e2e-phase44.sh` **OK** |
| Local E2E phase45 (path copy + fw jump) | done | `e2e-phase45.sh` **OK** |
| Local E2E phase46 (rule id/position) | done | `e2e-phase46.sh` **OK** |
| Local E2E phase47 (create Cluster) | done | `e2e-phase47.sh` **OK** |
| Local E2E phase48 (unused JSON/delete) | done | `e2e-phase48.sh` **OK** |
| Local E2E phase49 (DynamicGroup + sessions) | done | `e2e-phase49.sh` **OK** |
| Local E2E phase50 (dyn filter + fw dup) | done | `e2e-phase50.sh` **OK** |
| Local E2E phase51 (rename ruleset) | done | `e2e-phase51.sh` **OK** |
| Local E2E phase52 (NAT + disabled count) | done | `e2e-phase52.sh` **OK** |
| Local E2E phase53 (Routing reject + Policy) | done | `e2e-phase53.sh` **OK** |
| Local E2E phase54 (Host + only-disabled) | done | `e2e-phase54.sh` **OK** |
| Local E2E phase55 (action filter + bulk del) | done | `e2e-phase55.sh` **OK** |
| Local E2E phase56 (dup ruleset + where-used) | done | `e2e-phase56.sh` **OK** |
| Local E2E phase57 (bulk action + members) | done | `e2e-phase57.sh` **OK** |
| Local E2E phase58 (id search + copy visible) | done | `e2e-phase58.sh` **OK** |
| Local E2E phase59 (move visible + sessions) | done | `e2e-phase59.sh` **OK** |
| Local E2E phase60 (fw meta + unused types) | done | `e2e-phase60.sh` **OK** |
| Local E2E phase61 (search id + comment) | done | `e2e-phase61.sh` **OK** |
| Local E2E phase62 (rule group + object id) | done | `e2e-phase62.sh` **OK** |
| Local E2E phase63 (jump pos + rulesets) | done | `e2e-phase63.sh` **OK** |
| Local E2E phase64 (comment search + logging) | done | `e2e-phase64.sh` **OK** |
| Local E2E phase65 (comment hit + direction) | done | `e2e-phase65.sh` **OK** |
| Local E2E phase66 (stats Rules/Compile) | done | `e2e-phase66.sh` **OK** |
| Local E2E phase67 (enriched rules TSV) | done | `e2e-phase67.sh` **OK** |
| Local E2E phase68 (unused/deleted export) | done | `e2e-phase68.sh` **OK** |
| Local E2E phase69 (where-used → rule) | done | `e2e-phase69.sh` **OK** |
| Local E2E phase70 (trash type filter) | done | `e2e-phase70.sh` **OK** |
| Local E2E phase71 (deploy dry-run) | done | `e2e-phase71.sh` **OK** |
| Local E2E phase72 (Alt+R / Alt+D) | done | `e2e-phase72.sh` **OK** |
| Local E2E phase73 (open Policy/NAT/Routing) | done | `e2e-phase73.sh` **OK** |
| Local E2E phase74 (cycle disabled counts) | done | `e2e-phase74.sh` **OK** |
| Local E2E phase75 (Alt+N / Alt+G) | done | `e2e-phase75.sh` **OK** |
| Local E2E phase76 (shortcuts help) | done | `e2e-phase76.sh` **OK** |
| Local E2E phase77 (cycle action) | done | `e2e-phase77.sh` **OK** |
| Local E2E phase78 (selected rule TSV) | done | `e2e-phase78.sh` **OK** |
| Local E2E phase79 (selected rule JSON) | done | `e2e-phase79.sh` **OK** |
| Local E2E phase80 (cycle group) | done | `e2e-phase80.sh` **OK** |
| Local E2E phase81 (PageUp/Down) | done | `e2e-phase81.sh` **OK** |
| Local E2E phase82 (Alt+P cycle) | done | `e2e-phase82.sh` **OK** |
| Local E2E phase83 (object path) | done | `e2e-phase83.sh` **OK** |
| Local E2E phase84 (clear filters) | done | `e2e-phase84.sh` **OK** |
| Local E2E phase85 (stats TSV) | done | `e2e-phase85.sh` **OK** |
| Local E2E phase86 (insert rule) | done | `e2e-phase86.sh` **OK** |
| Local E2E phase87 (slash search) | done | `e2e-phase87.sh` **OK** |
| Local E2E phase88 (theme persist) | done | `e2e-phase88.sh` **OK** |
| Local E2E phase89 (search dblclick) | done | `e2e-phase89.sh` **OK** |
| Local E2E phase90 (theme shortcut) | done | `e2e-phase90.sh` **OK** |
| Local E2E phase91 (rule id copy) | done | `e2e-phase91.sh` **OK** |
| Local E2E phase92 (tab shortcuts) | done | `e2e-phase92.sh` **OK** |
| Local E2E phase93 (rulesWhich) | done | `e2e-phase93.sh` **OK** |
| Local E2E phase94 (unused shortcut) | done | `e2e-phase94.sh` **OK** |
| Local E2E phase95 (rule position) | done | `e2e-phase95.sh` **OK** |
| Local E2E phase96 (copy compile log) | done | `e2e-phase96.sh` **OK** |
| Local E2E phase97 (rulesCtx) | done | `e2e-phase97.sh` **OK** |
| Local E2E phase98 (ruleFilters) | done | `e2e-phase98.sh` **OK** |
| Local E2E phase99 (clear compile log) | done | `e2e-phase99.sh` **OK** |
| Local E2E phase100 (download log shortcut) | done | `e2e-phase100.sh` **OK** |
| Local E2E phase101 (live deploy confirm) | done | `e2e-phase101.sh` **OK** |
| Local E2E phase102 (mainTab) | done | `e2e-phase102.sh` **OK** |
| Local E2E phase103 (copy object name) | done | `e2e-phase103.sh` **OK** |
| Local E2E phase104 (tree/search persist) | done | `e2e-phase104.sh` **OK** |
| Local E2E phase105 (restore status) | done | `e2e-phase105.sh` **OK** |
| Local E2E phase106 (copy name button) | done | `e2e-phase106.sh` **OK** |
| Local E2E phase107 (refresh rules) | done | `e2e-phase107.sh` **OK** |
| Local E2E phase108 (shortcuts download) | done | `e2e-phase108.sh` **OK** |
| Local E2E phase109 (object TSV) | done | `e2e-phase109.sh` **OK** |
| Local E2E phase110 (unused/trash filters) | done | `e2e-phase110.sh` **OK** |
| Local E2E phase111 (compile log scroll) | done | `e2e-phase111.sh` **OK** |
| Local E2E phase112 (fw timestamps) | done | `e2e-phase112.sh` **OK** |
| Local E2E phase113 (log wrap) | done | `e2e-phase113.sh` **OK** |
| Local E2E phase114 (tree shortcuts) | done | `e2e-phase114.sh` **OK** |
| Local E2E phase115 (copy comment) | done | `e2e-phase115.sh` **OK** |
| Local E2E phase116 (copy fw name) | done | `e2e-phase116.sh` **OK** |
| Local E2E phase117 (dialog page nav) | done | `e2e-phase117.sh` **OK** |
| Local E2E phase118 (option page persist) | done | `e2e-phase118.sh` **OK** |
| Local E2E phase119 (deploy extras) | done | `e2e-phase119.sh` **OK** |
| Local E2E phase120 (deploy log/grid) | done | `e2e-phase120.sh` **OK** |
| Local E2E phase121 (recent cycle) | done | `e2e-phase121.sh` **OK** |
| Local E2E phase122 (rule page nav) | done | `e2e-phase122.sh` **OK** |
| Local E2E phase123 (iface page nav) | done | `e2e-phase123.sh` **OK** |
| Local E2E phase124 (iface page persist) | done | `e2e-phase124.sh` **OK** |
| Local E2E phase125 (host options filter) | done | `e2e-phase125.sh` **OK** |
| Local E2E phase126 (copy project path) | done | `e2e-phase126.sh` **OK** |
| Local E2E phase127 (deploy manifest) | done | `e2e-phase127.sh` **OK** |
| Local E2E phase128 (ui labels) | done | `e2e-phase128.sh` **OK** |
| Local E2E phase129 (activation macros) | done | `e2e-phase129.sh` **OK** |
| Local E2E phase130 (installer configlets) | done | `e2e-phase130.sh` **OK** |
| Local E2E phase131 (QRadioButton bool) | done | `e2e-phase131.sh` **OK** |
| Local E2E phase132 (option key hint) | done | `e2e-phase132.sh` **OK** |
| Local E2E phase133 (configlet preview) | done | `e2e-phase133.sh` **OK** |
| Local E2E phase134 (deploy plan log) | done | `e2e-phase134.sh` **OK** |
| Local E2E phase135 (configlet resolve/flags) | done | `e2e-phase135.sh` **OK** |
| Local E2E phase136 (configlet list) | done | `e2e-phase136.sh` **OK** |
| Local E2E phase137 (preview configlet UI) | done | `e2e-phase137.sh` **OK** |
| Local E2E phase138 (QGroupBox sections) | done | `e2e-phase138.sh` **OK** |
| Local E2E phase139 (deploy compress) | done | `e2e-phase139.sh` **OK** |
| Local E2E phase140 (interactive warn/prefs) | done | `e2e-phase140.sh` **OK** |
| Local E2E phase141 (root vs reg_user) | done | `e2e-phase141.sh` **OK** |
| Local E2E phase142 (identity ~ expand) | done | `e2e-phase142.sh` **OK** |
| Local E2E phase143 (openwrt configlets) | done | `e2e-phase143.sh` **OK** |
| Local E2E phase144 (missing identity) | done | `e2e-phase144.sh` **OK** |
| Local E2E phase145 (use_scp + copy plan) | done | `e2e-phase145.sh` **OK** |
| Local E2E phase146 (ios use_scp branches) | done | `e2e-phase146.sh` **OK** |
| Local E2E phase147 (external install script) | done | `e2e-phase147.sh` **OK** |
| Local E2E phase148 (external install UI) | done | `e2e-phase148.sh` **OK** |
| Local E2E phase149 (copyFWB) | done | `e2e-phase149.sh` **OK** |
| Local E2E phase150 (deploy mode/prefs) | done | `e2e-phase150.sh` **OK** |
| Local E2E phase151 (.ui tooltips) | done | `e2e-phase151.sh` **OK** |
| Local E2E phase152 (plan sizes/timeout) | done | `e2e-phase152.sh` **OK** |
| Local E2E phase153 (absolute remote_dir) | done | `e2e-phase153.sh` **OK** |
| Local E2E phase154 (interactive Cisco/…) | done | `e2e-phase154.sh` **OK** |
| Local E2E phase155 (mode log / confirm) | done | `e2e-phase155.sh` **OK** |
| Local E2E phase156 (installer capabilities) | done | `e2e-phase156.sh` **OK** |
| Local E2E phase157 (persist deploy plan) | done | `e2e-phase157.sh` **OK** |

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
bash webui/scripts/e2e-phase25.sh
bash webui/scripts/e2e-phase26.sh
bash webui/scripts/e2e-phase27.sh
bash webui/scripts/e2e-phase28.sh
bash webui/scripts/e2e-phase29.sh
bash webui/scripts/e2e-phase30.sh
bash webui/scripts/e2e-phase31.sh
bash webui/scripts/e2e-phase32.sh
bash webui/scripts/e2e-phase33.sh
bash webui/scripts/e2e-phase34.sh
bash webui/scripts/e2e-phase35.sh
bash webui/scripts/e2e-phase36.sh
bash webui/scripts/e2e-phase37.sh
bash webui/scripts/e2e-phase38.sh
bash webui/scripts/e2e-phase39.sh
bash webui/scripts/e2e-phase40.sh
bash webui/scripts/e2e-phase41.sh
bash webui/scripts/e2e-phase42.sh
bash webui/scripts/e2e-phase43.sh
bash webui/scripts/e2e-phase44.sh
bash webui/scripts/e2e-phase45.sh
bash webui/scripts/e2e-phase46.sh
bash webui/scripts/e2e-phase47.sh
bash webui/scripts/e2e-phase48.sh
bash webui/scripts/e2e-phase49.sh
bash webui/scripts/e2e-phase50.sh
bash webui/scripts/e2e-phase51.sh
bash webui/scripts/e2e-phase52.sh
bash webui/scripts/e2e-phase53.sh
bash webui/scripts/e2e-phase54.sh
bash webui/scripts/e2e-phase55.sh
bash webui/scripts/e2e-phase56.sh
bash webui/scripts/e2e-phase57.sh
bash webui/scripts/e2e-phase58.sh
bash webui/scripts/e2e-phase59.sh
bash webui/scripts/e2e-phase60.sh
bash webui/scripts/e2e-phase61.sh
bash webui/scripts/e2e-phase62.sh
bash webui/scripts/e2e-phase63.sh
bash webui/scripts/e2e-phase64.sh
bash webui/scripts/e2e-phase65.sh
bash webui/scripts/e2e-phase66.sh
bash webui/scripts/e2e-phase67.sh
bash webui/scripts/e2e-phase68.sh
bash webui/scripts/e2e-phase69.sh
bash webui/scripts/e2e-phase70.sh
bash webui/scripts/e2e-phase71.sh
bash webui/scripts/e2e-phase72.sh
bash webui/scripts/e2e-phase73.sh
bash webui/scripts/e2e-phase74.sh
bash webui/scripts/e2e-phase75.sh
bash webui/scripts/e2e-phase76.sh
bash webui/scripts/e2e-phase77.sh
bash webui/scripts/e2e-phase78.sh
bash webui/scripts/e2e-phase79.sh
bash webui/scripts/e2e-phase80.sh
bash webui/scripts/e2e-phase81.sh
bash webui/scripts/e2e-phase82.sh
bash webui/scripts/e2e-phase83.sh
bash webui/scripts/e2e-phase84.sh
bash webui/scripts/e2e-phase85.sh
bash webui/scripts/e2e-phase86.sh
bash webui/scripts/e2e-phase87.sh
bash webui/scripts/e2e-phase88.sh
bash webui/scripts/e2e-phase89.sh
bash webui/scripts/e2e-phase90.sh
bash webui/scripts/e2e-phase91.sh
bash webui/scripts/e2e-phase92.sh
bash webui/scripts/e2e-phase93.sh
bash webui/scripts/e2e-phase94.sh
bash webui/scripts/e2e-phase95.sh
bash webui/scripts/e2e-phase96.sh
bash webui/scripts/e2e-phase97.sh
bash webui/scripts/e2e-phase98.sh
bash webui/scripts/e2e-phase99.sh
bash webui/scripts/e2e-phase100.sh
bash webui/scripts/e2e-phase101.sh
bash webui/scripts/e2e-phase102.sh
bash webui/scripts/e2e-phase103.sh
bash webui/scripts/e2e-phase104.sh
bash webui/scripts/e2e-phase105.sh
bash webui/scripts/e2e-phase106.sh
bash webui/scripts/e2e-phase107.sh
bash webui/scripts/e2e-phase108.sh
bash webui/scripts/e2e-phase109.sh
bash webui/scripts/e2e-phase110.sh
bash webui/scripts/e2e-phase111.sh
bash webui/scripts/e2e-phase112.sh
bash webui/scripts/e2e-phase113.sh
bash webui/scripts/e2e-phase114.sh
bash webui/scripts/e2e-phase115.sh
bash webui/scripts/e2e-phase116.sh
bash webui/scripts/e2e-phase117.sh
bash webui/scripts/e2e-phase118.sh
bash webui/scripts/e2e-phase119.sh
bash webui/scripts/e2e-phase120.sh
bash webui/scripts/e2e-phase121.sh
bash webui/scripts/e2e-phase122.sh
bash webui/scripts/e2e-phase123.sh
bash webui/scripts/e2e-phase124.sh
bash webui/scripts/e2e-phase125.sh
bash webui/scripts/e2e-phase126.sh
bash webui/scripts/e2e-phase127.sh
bash webui/scripts/e2e-phase128.sh
bash webui/scripts/e2e-phase129.sh
bash webui/scripts/e2e-phase130.sh
bash webui/scripts/e2e-phase131.sh
bash webui/scripts/e2e-phase132.sh
bash webui/scripts/e2e-phase133.sh
bash webui/scripts/e2e-phase134.sh
bash webui/scripts/e2e-phase135.sh
bash webui/scripts/e2e-phase136.sh
bash webui/scripts/e2e-phase137.sh
bash webui/scripts/e2e-phase138.sh
bash webui/scripts/e2e-phase139.sh
bash webui/scripts/e2e-phase140.sh
bash webui/scripts/e2e-phase141.sh
bash webui/scripts/e2e-phase142.sh
bash webui/scripts/e2e-phase143.sh
bash webui/scripts/e2e-phase144.sh
bash webui/scripts/e2e-phase145.sh
bash webui/scripts/e2e-phase146.sh
bash webui/scripts/e2e-phase147.sh
bash webui/scripts/e2e-phase148.sh
bash webui/scripts/e2e-phase149.sh
bash webui/scripts/e2e-phase150.sh
bash webui/scripts/e2e-phase151.sh
bash webui/scripts/e2e-phase152.sh
bash webui/scripts/e2e-phase153.sh
bash webui/scripts/e2e-phase154.sh
bash webui/scripts/e2e-phase155.sh
bash webui/scripts/e2e-phase156.sh
bash webui/scripts/e2e-phase157.sh
# or everything:
bash webui/scripts/e2e-all.sh
```
