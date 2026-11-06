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
| Compile-first deploy toggle | done | FirewallExtras; E2E phase158 |
| Res/configlets status API | done | `GET /res-status`; E2E phase159 |
| Live gate for interactive OS installers | done | `force_limited_installer`; E2E phase160 |
| Download install plan | done | FirewallExtras; E2E phase161 |
| App live deploy force_limited after confirm | done | E2E phase162 |
| Res-status hint in FirewallExtras | done | E2E phase163 |
| Reset deploy prefs + hard backlog STATUS | done | E2E phase164 |
| QGridLayout row/col on option fields | done | extract + OptionField; E2E phase165 |
| qt-grid on Rule/Interface options | done | E2E phase166 |
| Expect-installer stub API | done | `GET /expect-installer`; E2E phase167 |
| Expect desktop_steps in UI warning | done | E2E phase168 |
| Qt grid placement toggle | done | FirewallExtras; E2E phase169 |
| Persist Qt grid placement pref | done | sessionStorage; E2E phase170 |
| Expandable expect desktop steps | done | FirewallExtras details; E2E phase171 |
| Page-local QGridLayout positions | done | extract per tab page; E2E phase172 |
| Dynamic CSS grid template from .ui extents | done | FirewallExtras; E2E phase173 |
| Dynamic grid on Rule/Interface options | done | E2E phase174 |
| Shared qtGridStyle helper | done | `frontend/src/qtGrid.ts`; E2E phase175 |
| Fix phase165 after qtGrid extract | done | grep `qtGrid.ts`; E2E phase176 |
| Extract .ui QSpacerItem cells | done | dialog_fields pages.spacers; E2E phase177 |
| Render Qt spacer holes in options grid | done | `qt-spacer` + qtSpacerStyle; E2E phase178 |
| Gzip script transfer on compress | done | scp `.gz` + remote gunzip; E2E phase179 |
| SSH BatchMode / password honesty | done | deploy `ssh_auth` + UI note; E2E phase180 |
| .ui columnstretch + layout counts | done | dialog_fields pages; E2E phase181 |
| CSS columns from columnstretch | done | qtGridStyle fr weights; E2E phase182 |
| Expect steps from pre/post configlets | done | expect_installer; E2E phase183 |
| Expect configlet names in UI | done | FirewallExtras; E2E phase184 |
| Layout/stretch page hint | done | FirewallExtras; E2E phase185 |
| Raw installer configlet file API | done | `GET /installer-configlet-file`; E2E phase186 |
| Configlet preview buttons in UI | done | FirewallExtras; E2E phase187 |
| SSH auth line in deploy plan | done | plan_and_deploy; E2E phase188 |
| Free QLabel annotations from .ui | done | dialog_fields pages.annotations; E2E phase189 |
| Annotation cells in options grid | done | FirewallExtras qt-annotation; E2E phase190 |
| Spacers/annotations on Rule/Interface | done | RuleOptions + InterfaceOptions; E2E phase191 |
| Soft-complete STATUS through 192 | done | E2E phase192 |
| Annotation extents in qtGridStyle | done | E2E phase193 |
| GET /ssh-auth capabilities | done | E2E phase194 |
| Expanded configlet file preview | done | expand=true; E2E phase195 |
| Expand buttons + sshAuthNote UI | done | FirewallExtras; E2E phase196 |
| ssh_auth on installer-capabilities | done | E2E phase197 |
| Refuse deploy allow_password_auth | done | 400 password_auth_not_implemented; E2E phase198 |
| post_config expand preview | done | E2E phase199 |
| Soft-complete STATUS through 200 | done | E2E phase200 |
| Expect install plan API | done | `GET /expect-install-plan`; E2E phase201 |
| Expect plan UI button | done | FirewallExtras; E2E phase202 |
| row_stretch extract wiring | done | extract + platforms; E2E phase203 |
| Soft-complete STATUS through 204 | done | E2E phase204 |
| .ui sizePolicy on option fields | done | dialog_fields size_policy; E2E phase205 |
| size-h-/size-v- CSS on OptionField | done | E2E phase206 |
| Download expect plan | done | FirewallExtras; E2E phase207 |
| Soft-complete STATUS through 208 | done | E2E phase208 |
| .ui minimumSize on option fields | done | dialog_fields minimum_size; E2E phase209 |
| minWidth/minHeight from minimum_size | done | OptionField; E2E phase210 |
| POST expect-install-plan/run → 501 | done | refuse_expect_install; E2E phase211 |
| Soft-complete STATUS through 212 | done | E2E phase212 |
| .ui maximumSize on option fields | done | filtered unbounded; E2E phase213 |
| maxWidth/maxHeight from maximum_size | done | OptionField; E2E phase214 |
| expect_install_plan on capabilities | done | E2E phase215 |
| Soft-complete STATUS through 216 | done | E2E phase216 |
| health/res soft_complete_phase | done | `WEBUI_SOFT_COMPLETE_PHASE`; E2E phase217 |
| soft-complete phase in resHint UI | done | FirewallExtras; E2E phase218 |
| soft_complete marker consistency | done | E2E phase219 |
| Soft-complete STATUS through 220 | done | honesty track marker; E2E phase220 |
| hard_gap_open list in UI footer | done | FirewallExtras; E2E phase221 |
| Compress ratio (−%) in deploy plan | done | E2E phase222 |
| hard_gap wiring check | done | E2E phase223 |
| Soft-complete STATUS through 224 | done | marker bumped; E2E phase224 |
| GET /hard-gaps | done | E2E phase225 |
| Dialog windowTitle + geometry extract | done | dialog chrome; E2E phase226 |
| Dialog title in FirewallExtras | done | E2E phase227 |
| Soft-complete STATUS through 228 | done | E2E phase228 |
| Dialog geometry → options max-height | done | CSS var; E2E phase229 |
| fetchHardGaps client | done | E2E phase230 |
| hard-gaps client wiring | done | E2E phase231 |
| Soft-complete STATUS through 232 | done | E2E phase232 |
| fetchHardGaps in FirewallExtras | done | E2E phase233 |
| Dialog geometry WxH in header | done | E2E phase234 |
| 233/234 wiring check | done | E2E phase235 |
| Soft-complete STATUS through 236 | done | E2E phase236 |
| hardGapsNote in UI | done | E2E phase237 |
| Smoke compress/expect/hard-gaps | done | E2E phase238 |
| 237 wiring check | done | E2E phase239 |
| Soft-complete STATUS through 240 | done | E2E phase240 |
| QGridLayout spacing/margins extract | done | pages.spacing; E2E phase241 |
| CSS gap/padding from spacing | done | qtGridStyle; E2E phase242 |
| spacing wiring check | done | E2E phase243 |
| Soft-complete STATUS through 244 | done | E2E phase244 |
| Spacing on Rule/Interface grids | done | E2E phase245 |
| Rule catalog spacing check | done | E2E phase246 |
| 245 wiring check | done | E2E phase247 |
| Soft-complete STATUS through 248 | done | E2E phase248 |
| Gap hint on options page | done | E2E phase249 |
| Smoke spacing + soft marker | done | E2E phase250 |
| 249 wiring check | done | E2E phase251 |
| Soft-complete STATUS through 252 | done | E2E phase252 |
| Persist expect plan in sessionStorage | done | E2E phase253 |
| soft_fertig_honesty_track on /hard-gaps | done | E2E phase254 |
| 253/254 wiring | done | E2E phase255 |
| Soft-fertig honesty track (phase256) | done | E2E phase256 |
| Spacer sizeHint extract | done | E2E phase257 |
| Spacer sizeHint CSS | done | E2E phase258 |
| row_stretch in qtGridStyle | done | E2E phase259 |
| Qt alignment extract + CSS | done | E2E phase260 |
| Expect plan reg_user + safety_net_acl | done | E2E phase261 |
| 257–261 wiring | done | E2E phase262 |
| Soft marker 264 | done | E2E phase263 |
| Soft-complete STATUS through 264 | done | E2E phase264 |
| QGroupBox flat/checkable extract | done | E2E phase265 |
| QGroupBox flat/checkable UI | done | E2E phase266 |
| Nested layout_tree extract | done | E2E phase267 |
| Expect walkthrough preview_only | done | E2E phase268 |
| Walkthrough UI + password probe 501 | done | E2E phase269 |
| 265–269 wiring | done | E2E phase270 |
| Soft marker 272 | done | E2E phase271 |
| Soft-complete STATUS through 272 | done | E2E phase272 |
| Buddy QLabel cells + external_label | done | E2E phase273 |
| buddy_labels UI on option grids | done | E2E phase274 |
| QTabWidget tab_position chrome | done | E2E phase275 |
| Buddy/tab CSS | done | E2E phase276 |
| 273–276 wiring | done | E2E phase277 |
| Soft marker 280 | done | E2E phase278 |
| STATUS buddy/tab mentions | done | E2E phase279 |
| Soft-complete STATUS through 280 | done | E2E phase280 |
| Widget enabled + sizeGrip extract | done | E2E phase281 |
| enabled/sizeGrip UI | done | E2E phase282 |
| layout_tree hint + walkthrough persist | done | E2E phase283 |
| hard_gap_notes on /hard-gaps | done | E2E phase284 |
| 281–284 wiring | done | E2E phase285 |
| Soft marker 288 | done | E2E phase286 |
| STATUS 281+ mentions | done | E2E phase287 |
| Soft-complete STATUS through 288 | done | E2E phase288 |
| hard_gap_notes UI list | done | E2E phase289 |
| Expect run step= still 501 | done | E2E phase290 |
| visible=false extract/hide | done | E2E phase291 |
| 289–291 wiring | done | E2E phase292 |
| Soft marker 296 | done | E2E phase293 |
| STATUS 289+ mentions | done | E2E phase294 |
| Typecheck after 289–291 | done | E2E phase295 |
| Soft-complete STATUS through 296 | done | E2E phase296 |
| layout_fidelity API | done | E2E phase297 |
| layout fidelity UI header | done | E2E phase298 |
| fidelity honesty (not pixel) | done | E2E phase299 |
| 297–299 wiring | done | E2E phase300 |
| Soft marker 304 | done | E2E phase301 |
| STATUS fidelity mentions | done | E2E phase302 |
| Multi-platform fidelity | done | E2E phase303 |
| Soft-complete STATUS through 304 | done | E2E phase304 |
| Walkthrough timeline stamps | done | E2E phase305 |
| Timeline UI | done | E2E phase306 |
| hard-gaps + schema fidelity link | done | E2E phase307 |
| 305–307 wiring | done | E2E phase308 |
| Soft marker 312 | done | E2E phase309 |
| STATUS 305+ mentions | done | E2E phase310 |
| Typecheck after timeline | done | E2E phase311 |
| Soft-complete STATUS through 312 | done | E2E phase312 |
| Download expect walkthrough | done | E2E phase313 |
| Rule/iface layout_fidelity | done | E2E phase314 |
| 313–314 wiring | done | E2E phase315 |
| Soft marker 320 | done | E2E phase316 |
| STATUS 313+ mentions | done | E2E phase317 |
| Shared fidelity helper check | done | E2E phase318 |
| Hard gaps still 3 @ 320 | done | E2E phase319 |
| Soft-complete STATUS through 320 | done | E2E phase320 |
| Rule/Interface fidelity headers | done | E2E phase321 |
| Soft marker 328 | done | E2E phase322 |
| STATUS 321+ mentions | done | E2E phase323 |
| Fidelity on all option panels | done | E2E phase324 |
| Hard gaps still 3 @ 328 | done | E2E phase325 |
| Typecheck after 321 | done | E2E phase326 |
| e2e-all lists 321–328 | done | E2E phase327 |
| Soft-complete STATUS through 328 | done | E2E phase328 |
| hard_gap_closure criteria | done | E2E phase329 |
| Closure criteria UI | done | E2E phase330 |
| 329–330 wiring | done | E2E phase331 |
| Soft marker 336 | done | E2E phase332 |
| STATUS closure mentions | done | E2E phase333 |
| Hard gaps+closure @ 336 | done | E2E phase334 |
| Typecheck after closure | done | E2E phase335 |
| Soft-complete STATUS through 336 | done | E2E phase336 |
| GET /hard-gaps/closure | done | E2E phase337 |
| Soft marker 344 + typecheck | done | E2E phase338 |
| 337–338 wiring | done | E2E phase339 |
| STATUS closure endpoint | done | E2E phase340 |
| Hard gaps still 3 @ 344 | done | E2E phase341 |
| e2e-all lists 337–344 | done | E2E phase342 |
| Closure vs fidelity honesty | done | E2E phase343 |
| Soft-complete STATUS through 344 | done | E2E phase344 |
| QStackedWidget sections extract | done | E2E phase345 |
| Stacked section UI | done | E2E phase346 |
| 345–346 wiring | done | E2E phase347 |
| Soft marker 352 | done | E2E phase348 |
| STATUS stacked mentions | done | E2E phase349 |
| ipt Logging stack pages | done | E2E phase350 |
| Typecheck after stacked | done | E2E phase351 |
| Soft-complete STATUS through 352 | done | E2E phase352 |
| InterfaceOptions stacked sections | done | E2E phase353 |
| SchemaGroup.sections client types | done | E2E phase354 |
| linux24 iface stacked schema | done | E2E phase355 |
| Hard-gap note QStackedWidget+iface | done | E2E phase356 |
| Soft marker 360 | done | E2E phase357 |
| STATUS iface stacked 353–360 | done | E2E phase358 |
| Typecheck after iface sections | done | E2E phase359 |
| Soft-complete STATUS through 360 | done | E2E phase360 |
| Empty QStackedWidget pages extract | done | E2E phase361 |
| InterfaceOptions stack switcher | done | E2E phase362 |
| FirewallExtras stack switcher | done | E2E phase363 |
| Stack switcher CSS | done | E2E phase364 |
| Client empty section flag | done | E2E phase365 |
| Soft marker 368 | done | E2E phase366 |
| Typecheck after stack switcher | done | E2E phase367 |
| Soft-complete STATUS through 368 | done | E2E phase368 |
| stack_switch schema hints | done | E2E phase369 |
| Device-type stack preview (iface) | done | E2E phase370 |
| use_ULOG follows logTargetStack | done | E2E phase371 |
| bsd/pixos iface stack maps | done | E2E phase372 |
| Soft marker 376 | done | E2E phase373 |
| STATUS stack_switch 369–376 | done | E2E phase374 |
| Typecheck after stack_switch | done | E2E phase375 |
| Soft-complete STATUS through 376 | done | E2E phase376 |
| Fidelity stacked_sections counts | done | E2E phase377 |
| GET /stack-switch | done | E2E phase378 |
| hard-gaps stack_switch_path | done | E2E phase379 |
| Client fetchStackSwitch | done | E2E phase380 |
| Soft marker 384 | done | E2E phase381 |
| STATUS stack-switch 377–384 | done | E2E phase382 |
| Typecheck after stack-switch | done | E2E phase383 |
| Soft-complete STATUS through 384 | done | E2E phase384 |
| Extract whatsThis separately | done | E2E phase385 |
| _infer_type meta passthrough | done | E2E phase386 |
| OptionField whats_this titles | done | E2E phase387 |
| Hard-gap paths + stacked× UI | done | E2E phase388 |
| Soft marker 392 | done | E2E phase389 |
| STATUS whats_this 385–392 | done | E2E phase390 |
| Typecheck after whats_this | done | E2E phase391 |
| Soft-complete STATUS through 392 | done | E2E phase392 |
| Extract readOnly → read_only | done | E2E phase393 |
| OptionField read_only | done | E2E phase394 |
| hard-gaps expect/password paths | done | E2E phase395 |
| Soft-complete phase + 501 paths UI | done | E2E phase396 |
| Soft marker 400 | done | E2E phase397 |
| STATUS read_only 393–400 | done | E2E phase398 |
| Typecheck after read_only | done | E2E phase399 |
| Soft-complete STATUS through 400 | done | E2E phase400 |
| QTabWidget page toolTip extract | done | E2E phase401 |
| Schema group.tooltip wiring | done | E2E phase402 |
| Tab buttons use page tooltip | done | E2E phase403 |
| Client + fidelity page tooltips | done | E2E phase404 |
| Soft marker 408 | done | E2E phase405 |
| STATUS tab tooltips 401–408 | done | E2E phase406 |
| Typecheck after tab tooltips | done | E2E phase407 |
| Soft-complete STATUS through 408 | done | E2E phase408 |
| iface option_enable (bonding→xmit) | done | E2E phase409 |
| InterfaceOptions option_enable UI | done | E2E phase410 |
| Soft marker 416 | done | E2E phase411 |
| STATUS option_enable 409–416 | done | E2E phase412 |
| Typecheck after option_enable | done | E2E phase413 |
| e2e-all lists 409–416 | done | E2E phase414 |
| option_enable table present | done | E2E phase415 |
| Soft-complete STATUS through 416 | done | E2E phase416 |
| ipt option_enable LOG/ULOG fields | done | E2E phase417 |
| FirewallExtras option_enable UI | done | E2E phase418 |
| Soft marker 424 | done | E2E phase419 |
| STATUS ipt option_enable 417–424 | done | E2E phase420 |
| Typecheck after ipt option_enable | done | E2E phase421 |
| e2e-all lists 417–424 | done | E2E phase422 |
| _OPTION_OPTION_ENABLE table | done | E2E phase423 |
| Soft-complete STATUS through 424 | done | E2E phase424 |
| Shared LOG/ULOG enable ipt/ipcop/secuwall | done | E2E phase425 |
| /stack-switch option_enable maps | done | E2E phase426 |
| Client stack-switch enable types | done | E2E phase427 |
| Soft marker 432 | done | E2E phase428 |
| STATUS 425–432 | done | E2E phase429 |
| Typecheck after shared enable | done | E2E phase430 |
| e2e-all lists 425–432 | done | E2E phase431 |
| Soft-complete STATUS through 432 | done | E2E phase432 |
| Stack-switch summary enable rules | done | E2E phase433 |
| OptionField field-ui-readonly | done | E2E phase434 |
| Soft marker 440 | done | E2E phase435 |
| STATUS 433–440 | done | E2E phase436 |
| Typecheck after readonly CSS | done | E2E phase437 |
| e2e-all lists 433–440 | done | E2E phase438 |
| Hard gaps still 3 @ 440 | done | E2E phase439 |
| Soft-complete STATUS through 440 | done | E2E phase440 |
| iface options.type enum from stack | done | E2E phase441 |
| Device type writes options.type | done | E2E phase442 |
| Soft marker 448 | done | E2E phase443 |
| STATUS 441–448 | done | E2E phase444 |
| Typecheck after type write | done | E2E phase445 |
| e2e-all lists 441–448 | done | E2E phase446 |
| Hard gaps still 3 @ 448 | done | E2E phase447 |
| Soft-complete STATUS through 448 | done | E2E phase448 |
| Dedupe type OptionField vs Device type | done | E2E phase449 |
| Soft marker 456 | done | E2E phase450 |
| STATUS 449–456 | done | E2E phase451 |
| Typecheck after type dedupe | done | E2E phase452 |
| e2e-all lists 449–456 | done | E2E phase453 |
| Hard gaps still 3 @ 456 | done | E2E phase454 |
| Health soft-phase wiring | done | E2E phase455 |
| Soft-complete STATUS through 456 | done | E2E phase456 |
| GET /option-enable | done | E2E phase457 |
| hard-gaps option_enable_path + UI | done | E2E phase458 |
| Soft marker 464 | done | E2E phase459 |
| STATUS 457–464 | done | E2E phase460 |
| Typecheck after option-enable API | done | E2E phase461 |
| e2e-all lists 457–464 | done | E2E phase462 |
| Hard gaps still 3 @ 464 | done | E2E phase463 |
| Soft-complete STATUS through 464 | done | E2E phase464 |
| EXPECT_PLAN_STEP_IDS + hard-gaps | done | E2E phase465 |
| Expect steps UI list (all 501) | done | E2E phase466 |
| Soft marker 472 | done | E2E phase467 |
| STATUS 465–472 | done | E2E phase468 |
| Typecheck after expect step ids | done | E2E phase469 |
| e2e-all lists 465–472 | done | E2E phase470 |
| Hard gaps still 3 @ 472 | done | E2E phase471 |
| Soft-complete STATUS through 472 | done | E2E phase472 |
| Plan/walkthrough canonical_step_ids + unknown refuse | done | E2E phase473 |
| GET /expect-install-plan/steps | done | E2E phase474 |
| hard-gaps expect_steps_path | done | E2E phase475 |
| Expect steps catalog UI + client | done | E2E phase476 |
| Soft marker 480 | done | E2E phase477 |
| STATUS 473–480 | done | E2E phase478 |
| Typecheck + e2e-all 473–480 | done | E2E phase479 |
| Soft-complete STATUS through 480 | done | E2E phase480 |
| refuseExpectInstallStep parses unknown_step | done | E2E phase481 |
| Probe-step select + unknown probe UI | done | E2E phase482 |
| fetchExpectPlanSteps catalog fallback | done | E2E phase483 |
| Capabilities canonical_step_ids | done | E2E phase484 |
| Client plan/walkthrough canonical_step_ids | done | E2E phase485 |
| Soft marker 488 | done | E2E phase486 |
| STATUS/typecheck/e2e-all 481–488 | done | E2E phase487 |
| Soft-complete STATUS through 488 | done | E2E phase488 |
| Layout fidelity with_visible + signal_keys | done | E2E phase489 |
| Fidelity UI visible/keys summary | done | E2E phase490 |
| ssh_auth batch_mode_only + refusal_paths | done | E2E phase491 |
| Password refuse + UI alternatives note | done | E2E phase492 |
| Expect plan download canonical_step_ids | done | E2E phase493 |
| Soft marker 496 | done | E2E phase494 |
| STATUS/typecheck/e2e-all 489–496 | done | E2E phase495 |
| Soft-complete STATUS through 496 | done | E2E phase496 |
| hard-gaps ssh_auth_path + refusal_paths | done | E2E phase497 |
| refusePasswordSsh parses honesty fields | done | E2E phase498 |
| SSH refusal summary UI | done | E2E phase499 |
| Walkthrough download canonical_step_ids | done | E2E phase500 |
| Pixel hard-gap note visible/signal_keys | done | E2E phase501 |
| Soft marker 504 | done | E2E phase502 |
| STATUS/typecheck/e2e-all 497–504 | done | E2E phase503 |
| Soft-complete STATUS through 504 | done | E2E phase504 |
| OptionField field-ui-hidden grid holes | done | E2E phase505 |
| layout_tree_max_depth fidelity | done | E2E phase506 |
| Fidelity UI layout_tree depth | done | E2E phase507 |
| Hard-gap note hidden/tree depth | done | E2E phase508 |
| Soft marker 512 | done | E2E phase509 |
| STATUS 505–512 | done | E2E phase510 |
| Typecheck + e2e-all 505–512 | done | E2E phase511 |
| Soft-complete STATUS through 512 | done | E2E phase512 |
| Schema layout_fidelity summary + buddy pages | done | E2E phase513 |
| Client schema fidelity extended fields | done | E2E phase514 |
| InterfaceOptions rich fidelity UI | done | E2E phase515 |
| RuleOptions rich fidelity UI | done | E2E phase516 |
| Soft marker 520 | done | E2E phase517 |
| STATUS 513–520 | done | E2E phase518 |
| Typecheck + e2e-all 513–520 | done | E2E phase519 |
| Soft-complete STATUS through 520 | done | E2E phase520 |
| hard-gaps layout_fidelity_signal_catalog | done | E2E phase521 |
| Download hard-gaps JSON UI | done | E2E phase522 |
| Score pages_with_buddy_labels | done | E2E phase523 |
| Interface/Rule buddy× fidelity | done | E2E phase524 |
| Soft marker 528 | done | E2E phase525 |
| STATUS 521–528 | done | E2E phase526 |
| Typecheck + e2e-all 521–528 | done | E2E phase527 |
| Soft-complete STATUS through 528 | done | E2E phase528 |
| Fidelity score whats_this/tooltip/tab | done | E2E phase529 |
| Signal catalog details UI | done | E2E phase530 |
| Soft marker 536 | done | E2E phase531 |
| STATUS 529–536 | done | E2E phase532 |
| Typecheck after catalog details | done | E2E phase533 |
| e2e-all lists 529–536 | done | E2E phase534 |
| Hard gaps still 3 @ 536 | done | E2E phase535 |
| Soft-complete STATUS through 536 | done | E2E phase536 |
| score_parts_count + enabled/alignment weights | done | E2E phase537 |
| UI weights× score_parts_count | done | E2E phase538 |
| Soft marker 544 | done | E2E phase539 |
| STATUS 537–544 | done | E2E phase540 |
| Typecheck after score_parts | done | E2E phase541 |
| e2e-all lists 537–544 | done | E2E phase542 |
| Hard gaps still 3 @ 544 | done | E2E phase543 |
| Soft-complete STATUS through 544 | done | E2E phase544 |
| GET /expect-install-plan/steps/refusals | done | E2E phase545 |
| hard-gaps expect_steps_refusals_path | done | E2E phase546 |
| Preview all step refusals UI | done | E2E phase547 |
| Soft marker 552 | done | E2E phase548 |
| STATUS 545–552 | done | E2E phase549 |
| Typecheck after refusals API | done | E2E phase550 |
| e2e-all + hard gaps @ 552 | done | E2E phase551 |
| Soft-complete STATUS through 552 | done | E2E phase552 |
| Expect hard-gap note steps/refusals | done | E2E phase553 |
| UI closure path + hard_gap_count | done | E2E phase554 |
| Soft marker 560 | done | E2E phase555 |
| STATUS 553–560 | done | E2E phase556 |
| Typecheck after closure UI | done | E2E phase557 |
| e2e-all lists 553–560 | done | E2E phase558 |
| Hard gaps still 3 @ 560 | done | E2E phase559 |
| Soft-complete STATUS through 560 | done | E2E phase560 |
| Show hard-gap closure button | done | E2E phase561 |
| Soft marker 568 | done | E2E phase562 |
| STATUS 561–568 | done | E2E phase563 |
| Typecheck after closure show | done | E2E phase564 |
| e2e-all lists 561–568 | done | E2E phase565 |
| Hard gaps still 3 @ 568 | done | E2E phase566 |
| Closure endpoint honesty note | done | E2E phase567 |
| Soft-complete STATUS through 568 | done | E2E phase568 |
| Download hard-gap closure | done | E2E phase569 |
| Closure sessionStorage persistence | done | E2E phase570 |
| Soft marker 576 | done | E2E phase571 |
| STATUS 569–576 | done | E2E phase572 |
| Typecheck after closure download | done | E2E phase573 |
| e2e-all lists 569–576 | done | E2E phase574 |
| Hard gaps still 3 @ 576 | done | E2E phase575 |
| Soft-complete STATUS through 576 | done | E2E phase576 |
| Closure endpoint notes + parent_path | done | E2E phase577 |
| Closure UI shows notes + parent | done | E2E phase578 |
| Soft marker 584 | done | E2E phase579 |
| STATUS 577–584 | done | E2E phase580 |
| Typecheck after closure notes | done | E2E phase581 |
| e2e-all lists 577–584 | done | E2E phase582 |
| Hard gaps still 3 @ 584 | done | E2E phase583 |
| Soft-complete STATUS through 584 | done | E2E phase584 |
| Refusals unknown_step_probe | done | E2E phase585 |
| UI unknown_step_probe in refusals | done | E2E phase586 |
| Soft marker 592 | done | E2E phase587 |
| STATUS 585–592 | done | E2E phase588 |
| Typecheck after unknown probe | done | E2E phase589 |
| e2e-all lists 585–592 | done | E2E phase590 |
| Hard gaps still 3 @ 592 | done | E2E phase591 |
| Soft-complete STATUS through 592 | done | E2E phase592 |
| Expect refusals download + sessionStorage (expectRefusalsKey / Download refusals) | done | E2E phase593 |
| Soft marker 600 | done | E2E phase594 |
| STATUS 593–600 | done | E2E phase595 |
| Typecheck after refusals persist | done | E2E phase596 |
| e2e-all lists 593–600 | done | E2E phase597 |
| Hard gaps still 3 @ 600 | done | E2E phase598 |
| Health soft_complete_phase 600 | done | E2E phase599 |
| Soft-complete STATUS through 600 | done | E2E phase600 |
| honesty_milestone on /hard-gaps | done | E2E phase601 |
| UI honesty milestone | done | E2E phase602 |
| Soft marker 608 | done | E2E phase603 |
| STATUS 601–608 | done | E2E phase604 |
| Typecheck after honesty milestone | done | E2E phase605 |
| e2e-all lists 601–608 | done | E2E phase606 |
| Hard gaps still 3 @ 608 | done | E2E phase607 |
| Soft-complete STATUS through 608 | done | E2E phase608 |
| Closure honesty_milestone + soft_fertig | done | E2E phase609 |
| honesty_paths catalog on /hard-gaps | done | E2E phase610 |
| Soft-fertig track + honesty paths UI | done | E2E phase611 |
| Hard-gaps sessionStorage snapshot | done | E2E phase612 |
| Client types honesty_paths/closure | done | E2E phase613 |
| Soft marker 616 + typecheck | done | E2E phase614 |
| e2e-all lists 609–616; gaps=3 | done | E2E phase615 |
| Soft-complete STATUS through 616 | done | E2E phase616 |
| Health honesty milestone/count | done | E2E phase617 |
| res-status honesty fields | done | E2E phase618 |
| honesty_paths_count on /hard-gaps | done | E2E phase619 |
| Copy hard-gaps JSON UI | done | E2E phase620 |
| Client honesty_paths_count type | done | E2E phase621 |
| Soft marker 624 + typecheck | done | E2E phase622 |
| e2e-all lists 617–624; gaps=3 | done | E2E phase623 |
| Soft-complete STATUS through 624 | done | E2E phase624 |
| GET /hard-gaps/summary | done | E2E phase625 |
| summary_path on hard-gaps/closure | done | E2E phase626 |
| Summary UI + clear snapshot | done | E2E phase627 |
| Client fetchHardGapsSummary | done | E2E phase628 |
| STATUS 625–632 mentions | done | E2E phase629 |
| Soft marker 632 + typecheck | done | E2E phase630 |
| e2e-all lists 625–632; gaps=3 | done | E2E phase631 |
| Soft-complete STATUS through 632 | done | E2E phase632 |
| Summary layout_fidelity sample score | done | E2E phase633 |
| UI sample fidelity from summary | done | E2E phase634 |
| Client summary fidelity types | done | E2E phase635 |
| STATUS 633–640 mentions | done | E2E phase636 |
| Soft marker 640 | done | E2E phase637 |
| Typecheck after summary fidelity | done | E2E phase638 |
| e2e-all lists 633–640; gaps=3 | done | E2E phase639 |
| Soft-complete STATUS through 640 | done | E2E phase640 |
| /hard-gaps layout_fidelity sample | done | E2E phase641 |
| UI seeds sample from /hard-gaps | done | E2E phase642 |
| Client /hard-gaps sample types | done | E2E phase643 |
| STATUS 641–648 mentions | done | E2E phase644 |
| Soft marker 648 | done | E2E phase645 |
| Typecheck after hard-gaps sample | done | E2E phase646 |
| e2e-all lists 641–648; gaps=3 | done | E2E phase647 |
| Soft-complete STATUS through 648 | done | E2E phase648 |
| Honesty milestone 650 + note | done | E2E phase649 |
| Milestone note on all honesty endpoints | done | E2E phase650 |
| UI honesty milestone note | done | E2E phase651 |
| Client honesty_milestone_note | done | E2E phase652 |
| STATUS milestone 650 | done | E2E phase653 |
| Soft marker 656 + typecheck | done | E2E phase654 |
| e2e-all lists 649–656; gaps=3 | done | E2E phase655 |
| Soft-complete STATUS through 656 | done | E2E phase656 |
| EXPECT_PLAN_STEP_NOTES catalog | done | E2E phase657 |
| UI expect step notes details | done | E2E phase658 |
| Client step_notes types | done | E2E phase659 |
| STATUS 657–664 mentions | done | E2E phase660 |
| Soft marker 664 | done | E2E phase661 |
| Typecheck after step notes | done | E2E phase662 |
| e2e-all lists 657–664; gaps=3 | done | E2E phase663 |
| Soft-complete STATUS through 664 | done | E2E phase664 |
| expect_plan_step_notes_count | done | E2E phase665 |
| UI notes=N in expect summary | done | E2E phase666 |
| Client step count types | done | E2E phase667 |
| STATUS 665–672 mentions | done | E2E phase668 |
| Soft marker 672 | done | E2E phase669 |
| Typecheck after step counts | done | E2E phase670 |
| e2e-all lists 665–672; gaps=3 | done | E2E phase671 |
| Soft-complete STATUS through 672 | done | E2E phase672 |
| SSH alternative/refusal path notes | done | E2E phase673 |
| UI SSH notes details | done | E2E phase674 |
| Client SSH note types | done | E2E phase675 |
| STATUS 673–680 mentions | done | E2E phase676 |
| Soft marker 680 | done | E2E phase677 |
| Typecheck after SSH notes | done | E2E phase678 |
| e2e-all lists 673–680; gaps=3 | done | E2E phase679 |
| Soft-complete STATUS through 680 | done | E2E phase680 |
| Honesty milestone 700 + note | done | E2E phase681 |
| Milestone 700 on all honesty endpoints | done | E2E phase682 |
| UI honesty milestone at 700 | done | E2E phase683 |
| STATUS milestone 700 | done | E2E phase684 |
| Soft marker 688 | done | E2E phase685 |
| Typecheck after milestone 700 | done | E2E phase686 |
| e2e-all lists 681–688; gaps=3 | done | E2E phase687 |
| Soft-complete STATUS through 688 | done | E2E phase688 |
| Spacer sizeType extract + fidelity weights | done | E2E phase689 |
| dialog_fields spacer size_type | done | E2E phase690 |
| signal_keys spacer orientation/size_type | done | E2E phase691 |
| STATUS 689–696 mentions | done | E2E phase692 |
| Soft marker 696 | done | E2E phase693 |
| Typecheck after spacer fidelity | done | E2E phase694 |
| e2e-all lists 689–696; gaps=3 | done | E2E phase695 |
| Soft-complete STATUS through 696 | done | E2E phase696 |
| qtSpacerStyle size_type + data-size-type | done | E2E phase697 |
| CSS Expanding/Fixed size-type | done | E2E phase698 |
| Client spacer size_type types | done | E2E phase699 |
| STATUS 697–704 mentions | done | E2E phase700 |
| Soft marker 704 | done | E2E phase701 |
| Typecheck after size_type UI | done | E2E phase702 |
| e2e-all lists 697–704; gaps=3 | done | E2E phase703 |
| Soft-complete STATUS through 704 | done | E2E phase704 |
| Summary spacer sample counts | done | E2E phase705 |
| UI summary spacer bits | done | E2E phase706 |
| Client summary spacer types | done | E2E phase707 |
| STATUS 705–712 mentions | done | E2E phase708 |
| Soft marker 712 | done | E2E phase709 |
| Typecheck after summary spacers | done | E2E phase710 |
| e2e-all lists 705–712; gaps=3 | done | E2E phase711 |
| Soft-complete STATUS through 712 | done | E2E phase712 |
| Honesty milestone 750 + note | done | E2E phase713 |
| Milestone 750 on all honesty endpoints | done | E2E phase714 |
| UI honesty milestone at 750 | done | E2E phase715 |
| STATUS milestone 750 | done | E2E phase716 |
| Soft marker 720 | done | E2E phase717 |
| Typecheck after milestone 750 | done | E2E phase718 |
| e2e-all lists 713–720; gaps=3 | done | E2E phase719 |
| Soft-complete STATUS through 720 | done | E2E phase720 |
| /hard-gaps mirrors spacer sample counts | done | E2E phase721 |
| UI seeds spacer bits from /hard-gaps | done | E2E phase722 |
| Client /hard-gaps spacer sample types | done | E2E phase723 |
| STATUS 721–728 mentions | done | E2E phase724 |
| Soft marker 728 | done | E2E phase725 |
| Typecheck after hard-gaps spacers | done | E2E phase726 |
| e2e-all lists 721–728; gaps=3 | done | E2E phase727 |
| Soft-complete STATUS through 728 | done | E2E phase728 |
| with_size_policy_expanding fidelity | done | E2E phase729 |
| UI expanding= sample bit | done | E2E phase730 |
| Client expanding sample types | done | E2E phase731 |
| STATUS 729–736 mentions | done | E2E phase732 |
| Soft marker 736 | done | E2E phase733 |
| Typecheck after expanding sample | done | E2E phase734 |
| e2e-all lists 729–736; gaps=3 | done | E2E phase735 |
| Soft-complete STATUS through 736 | done | E2E phase736 |
| Honesty milestone 800 + note | done | E2E phase737 |
| Milestone 800 on all honesty endpoints | done | E2E phase738 |
| UI honesty milestone at 800 | done | E2E phase739 |
| STATUS milestone 800 | done | E2E phase740 |
| Soft marker 744 | done | E2E phase741 |
| Typecheck after milestone 800 | done | E2E phase742 |
| e2e-all lists 737–744; gaps=3 | done | E2E phase743 |
| Soft-complete STATUS through 744 | done | E2E phase744 |
| CSS size-h/v Minimum/Preferred/Fixed | done | E2E phase745 |
| OptionField size-h/v class emission | done | E2E phase746 |
| Soft marker 752 | done | E2E phase747 |
| STATUS 745–752 mentions | done | E2E phase748 |
| Typecheck after size-policy CSS | done | E2E phase749 |
| Hard gaps still 3 @ ≥752 | done | E2E phase750 |
| e2e-all lists 745–752 | done | E2E phase751 |
| Soft-complete STATUS through 752 | done | E2E phase752 |
| Honesty milestone 850 + note | done | E2E phase753 |
| Milestone 850 on all honesty endpoints | done | E2E phase754 |
| UI honesty milestone at 850 | done | E2E phase755 |
| STATUS milestone 850 | done | E2E phase756 |
| Soft marker 760 | done | E2E phase757 |
| Typecheck after milestone 850 | done | E2E phase758 |
| e2e-all lists 753–760; gaps=3 | done | E2E phase759 |
| Soft-complete STATUS through 760 | done | E2E phase760 |
| with_size_policy_fixed fidelity | done | E2E phase761 |
| UI fixed= sample bit | done | E2E phase762 |
| Client fixed sample types | done | E2E phase763 |
| STATUS 761–768 mentions | done | E2E phase764 |
| Soft marker 768 | done | E2E phase765 |
| Typecheck after fixed sample | done | E2E phase766 |
| e2e-all lists 761–768; gaps=3 | done | E2E phase767 |
| Soft-complete STATUS through 768 | done | E2E phase768 |
| Spacer CSS Maximum/Minimum/Preferred | done | E2E phase769 |
| qtSpacerStyle Maximum/Minimum/Preferred | done | E2E phase770 |
| STATUS 769–776 mentions | done | E2E phase771 |
| Soft marker 776 | done | E2E phase772 |
| Typecheck after spacer sizeTypes | done | E2E phase773 |
| Catalog has Maximum/Minimum spacers | done | E2E phase774 |
| e2e-all lists 769–776; gaps=3 | done | E2E phase775 |
| Soft-complete STATUS through 776 | done | E2E phase776 |
| with_size_policy_minimum fidelity | done | E2E phase777 |
| UI minimum= sample bit | done | E2E phase778 |
| Client minimum sample types | done | E2E phase779 |
| STATUS 777–784 mentions | done | E2E phase780 |
| Soft marker 784 | done | E2E phase781 |
| Typecheck after minimum sample | done | E2E phase782 |
| e2e-all lists 777–784; gaps=3 | done | E2E phase783 |
| Soft-complete STATUS through 784 | done | E2E phase784 |
| min/max size hard-gaps sample | done | E2E phase785 |
| UI minSize=/maxSize= sample bits | done | E2E phase786 |
| Client min/max size sample types | done | E2E phase787 |
| STATUS 785–792 mentions | done | E2E phase788 |
| Soft marker 792 | done | E2E phase789 |
| Typecheck after min/max size | done | E2E phase790 |
| e2e-all lists 785–792; gaps=3 | done | E2E phase791 |
| Soft-complete STATUS through 792 | done | E2E phase792 |
| Honesty milestone 900 + note | done | E2E phase793 |
| Milestone 900 on all honesty endpoints | done | E2E phase794 |
| UI honesty milestone at 900 | done | E2E phase795 |
| STATUS milestone 900 | done | E2E phase796 |
| Soft marker 800 | done | E2E phase797 |
| Typecheck after milestone 900 | done | E2E phase798 |
| e2e-all lists 793–800; gaps=3 | done | E2E phase799 |
| Soft-complete STATUS through 800 | done | E2E phase800 |
| tree depth / buddy hard-gaps sample | done | E2E phase801 |
| UI treeDepth=/buddies= sample bits | done | E2E phase802 |
| Client tree/buddy sample types | done | E2E phase803 |
| STATUS 801–808 mentions | done | E2E phase804 |
| Soft marker 808 | done | E2E phase805 |
| Typecheck after tree/buddy | done | E2E phase806 |
| e2e-all lists 801–808; gaps=3 | done | E2E phase807 |
| Soft-complete STATUS through 808 | done | E2E phase808 |
| with_size_policy_preferred fidelity | done | E2E phase809 |
| UI preferred= sample bit | done | E2E phase810 |
| Client preferred sample types | done | E2E phase811 |
| STATUS 809–816 mentions | done | E2E phase812 |
| Soft marker 816 | done | E2E phase813 |
| Typecheck after preferred sample | done | E2E phase814 |
| e2e-all lists 809–816; gaps=3 | done | E2E phase815 |
| Soft-complete STATUS through 816 | done | E2E phase816 |
| stacked_sections hard-gaps sample | done | E2E phase817 |
| UI stacked=/emptyStacked= bits | done | E2E phase818 |
| Client stacked sample types | done | E2E phase819 |
| STATUS 817–824 mentions | done | E2E phase820 |
| Soft marker 824 | done | E2E phase821 |
| Typecheck after stacked sample | done | E2E phase822 |
| e2e-all lists 817–824; gaps=3 | done | E2E phase823 |
| Soft-complete STATUS through 824 | done | E2E phase824 |
| Honesty milestone 950 + note | done | E2E phase825 |
| Milestone 950 on all honesty endpoints | done | E2E phase826 |
| UI honesty milestone at 950 | done | E2E phase827 |
| STATUS milestone 950 | done | E2E phase828 |
| Soft marker 832 | done | E2E phase829 |
| Typecheck after milestone 950 | done | E2E phase830 |
| e2e-all lists 825–832; gaps=3 | done | E2E phase831 |
| Soft-complete STATUS through 832 | done | E2E phase832 |
| flat/checkable/annotations sample | done | E2E phase833 |
| UI flat=/checkable=/annotations= | done | E2E phase834 |
| Client section/annotation types | done | E2E phase835 |
| STATUS 833–840 mentions | done | E2E phase836 |
| Soft marker 840 | done | E2E phase837 |
| Typecheck after section samples | done | E2E phase838 |
| e2e-all lists 833–840; gaps=3 | done | E2E phase839 |
| Soft-complete STATUS through 840 | done | E2E phase840 |
| min/max size score weights | done | E2E phase841 |
| Sample mirrors min/max after weights | done | E2E phase842 |
| STATUS 841–848 mentions | done | E2E phase843 |
| Soft marker 848 | done | E2E phase844 |
| Typecheck after min/max score | done | E2E phase845 |
| UI minSize=/maxSize= still present | done | E2E phase846 |
| e2e-all lists 841–848; gaps=3 | done | E2E phase847 |
| Soft-complete STATUS through 848 | done | E2E phase848 |
| Honesty milestone 1000 + note | done | E2E phase849 |
| Milestone 1000 on all honesty endpoints | done | E2E phase850 |
| UI honesty milestone at 1000 | done | E2E phase851 |
| STATUS milestone 1000 | done | E2E phase852 |
| Soft marker 856 | done | E2E phase853 |
| Typecheck after milestone 1000 | done | E2E phase854 |
| e2e-all lists 849–856; gaps=3 | done | E2E phase855 |
| Soft-complete STATUS through 856 | done | E2E phase856 |
| stretch/spacing/chrome hard-gaps sample | done | E2E phase857 |
| UI colStretch/spacing/geometry/sizeGrip | done | E2E phase858 |
| Client stretch/chrome sample types | done | E2E phase859 |
| STATUS 857–864 mentions | done | E2E phase860 |
| Soft marker 864 | done | E2E phase861 |
| Typecheck after stretch/chrome | done | E2E phase862 |
| e2e-all lists 857–864; gaps=3 | done | E2E phase863 |
| Soft-complete STATUS through 864 | done | E2E phase864 |
| Honesty milestone 1050 + note | done | E2E phase865 |
| Milestone 1050 on all honesty endpoints | done | E2E phase866 |
| UI honesty milestone at 1050 | done | E2E phase867 |
| STATUS milestone 1050 | done | E2E phase868 |
| Soft marker 872 | done | E2E phase869 |
| Typecheck after milestone 1050 | done | E2E phase870 |
| e2e-all lists 865–872; gaps=3 | done | E2E phase871 |
| Soft-complete STATUS through 872 | done | E2E phase872 |
| with_grid/label/tooltip field samples | done | E2E phase873 |
| UI fields=/grid=/labels=/tooltips= | done | E2E phase874 |
| Client field sample types | done | E2E phase875 |
| STATUS 873–880 mentions | done | E2E phase876 |
| Soft marker 880 | done | E2E phase877 |
| Typecheck after field samples | done | E2E phase878 |
| e2e-all lists 873–880; gaps=3 | done | E2E phase879 |
| Soft-complete STATUS through 880 | done | E2E phase880 |
| Honesty milestone 1100 + note | done | E2E phase881 |
| Milestone 1100 on all honesty endpoints | done | E2E phase882 |
| UI honesty milestone at 1100 | done | E2E phase883 |
| STATUS milestone 1100 | done | E2E phase884 |
| Soft marker 888 | done | E2E phase885 |
| Typecheck after milestone 1100 | done | E2E phase886 |
| e2e-all lists 881–888; gaps=3 | done | E2E phase887 |
| Soft-complete STATUS through 888 | done | E2E phase888 |
| pages/sections/stack_names samples | done | E2E phase889 |
| UI pages=/sections=/stacks= | done | E2E phase890 |
| Client pages/sections/stacks types | done | E2E phase891 |
| STATUS 889–896 mentions | done | E2E phase892 |
| Soft marker 896 | done | E2E phase893 |
| Typecheck after pages/sections/stacks | done | E2E phase894 |
| e2e-all lists 889–896; gaps=3 | done | E2E phase895 |
| Soft-complete STATUS through 896 | done | E2E phase896 |
| Honesty milestone 1150 + note | done | E2E phase897 |
| Milestone 1150 on all honesty endpoints | done | E2E phase898 |
| UI honesty milestone at 1150 | done | E2E phase899 |
| STATUS milestone 1150 | done | E2E phase900 |
| Soft marker 904 | done | E2E phase901 |
| Typecheck after milestone 1150 | done | E2E phase902 |
| e2e-all lists 897–904; gaps=3 | done | E2E phase903 |
| Soft-complete STATUS through 904 | done | E2E phase904 |
| chrome window_title/tab_position sample | done | E2E phase905 |
| UI windowTitle=/tabPos= | done | E2E phase906 |
| Client chrome title/tabPos types | done | E2E phase907 |
| STATUS 905–912 mentions | done | E2E phase908 |
| Soft marker 912 | done | E2E phase909 |
| Typecheck after chrome title/tabPos | done | E2E phase910 |
| e2e-all lists 905–912; gaps=3 | done | E2E phase911 |
| Soft-complete STATUS through 912 | done | E2E phase912 |
| Honesty milestone 1200 + note | done | E2E phase913 |
| Milestone 1200 on all honesty endpoints | done | E2E phase914 |
| UI honesty milestone at 1200 | done | E2E phase915 |
| STATUS milestone 1200 | done | E2E phase916 |
| Soft marker 920 | done | E2E phase917 |
| Typecheck after milestone 1200 | done | E2E phase918 |
| e2e-all lists 913–920; gaps=3 | done | E2E phase919 |
| Soft-complete STATUS through 920 | done | E2E phase920 |
| UI truncates long sample fidelity | done | E2E phase921 |
| Truncate helper shape | done | E2E phase922 |
| STATUS 921–928 mentions | done | E2E phase923 |
| Soft marker 928 | done | E2E phase924 |
| Typecheck after fidelity truncate | done | E2E phase925 |
| Clear resets fidelity title | done | E2E phase926 |
| e2e-all lists 921–928; gaps=3 | done | E2E phase927 |
| Soft-complete STATUS through 928 | done | E2E phase928 |
| Honesty milestone 1250 + note | done | E2E phase929 |
| Milestone 1250 on all honesty endpoints | done | E2E phase930 |
| UI honesty milestone at 1250 | done | E2E phase931 |
| STATUS milestone 1250 | done | E2E phase932 |
| Soft marker 936 | done | E2E phase933 |
| Typecheck after milestone 1250 | done | E2E phase934 |
| e2e-all lists 929–936; gaps=3 | done | E2E phase935 |
| Soft-complete STATUS through 936 | done | E2E phase936 |
| with_size_policy total sample | done | E2E phase937 |
| UI sizePolicy= sample bit | done | E2E phase938 |
| Client sizePolicy total types | done | E2E phase939 |
| STATUS 937–944 mentions | done | E2E phase940 |
| Soft marker 944 | done | E2E phase941 |
| Typecheck after sizePolicy total | done | E2E phase942 |
| e2e-all lists 937–944; gaps=3 | done | E2E phase943 |
| Soft-complete STATUS through 944 | done | E2E phase944 |
| Honesty milestone 1300 + note | done | E2E phase945 |
| Milestone 1300 on all honesty endpoints | done | E2E phase946 |
| UI honesty milestone at 1300 | done | E2E phase947 |
| STATUS milestone 1300 | done | E2E phase948 |
| Soft marker 952 | done | E2E phase949 |
| Typecheck after milestone 1300 | done | E2E phase950 |
| e2e-all lists 945–952; gaps=3 | done | E2E phase951 |
| Soft-complete STATUS through 952 | done | E2E phase952 |
| layout_fidelity_sample_key_count | done | E2E phase953 |
| UI sampleKeys= bit | done | E2E phase954 |
| Client sample_key_count types | done | E2E phase955 |
| STATUS 953–960 mentions | done | E2E phase956 |
| Soft marker 960 | done | E2E phase957 |
| Typecheck after sample_key_count | done | E2E phase958 |
| e2e-all lists 953–960; gaps=3 | done | E2E phase959 |
| Soft-complete STATUS through 960 | done | E2E phase960 |
| with_visible hard-gaps sample | done | E2E phase961 |
| UI visible= bit | done | E2E phase962 |
| Client with_visible types | done | E2E phase963 |
| STATUS 961–968 mentions | done | E2E phase964 |
| Soft marker 968 | done | E2E phase965 |
| Typecheck after with_visible | done | E2E phase966 |
| e2e-all lists 961–968; gaps=3 | done | E2E phase967 |
| Soft-complete STATUS through 968 | done | E2E phase968 |
| spacers_with_size_hint sample | done | E2E phase969 |
| UI sizeHint= bit | done | E2E phase970 |
| Client spacers_with_size_hint types | done | E2E phase971 |
| STATUS 969–976 mentions | done | E2E phase972 |
| Soft marker 976 | done | E2E phase973 |
| Typecheck after size_hint | done | E2E phase974 |
| e2e-all lists 969–976; gaps=3 | done | E2E phase975 |
| Soft-complete STATUS through 976 | done | E2E phase976 |
| signal_key_count hard-gaps sample | done | E2E phase977 |
| UI signalKeys= bit | done | E2E phase978 |
| Client signal_key_count types | done | E2E phase979 |
| STATUS 977–984 mentions | done | E2E phase980 |
| Soft marker 984 | done | E2E phase981 |
| Typecheck after signal_key_count | done | E2E phase982 |
| e2e-all lists 977–984; gaps=3 | done | E2E phase983 |
| Soft-complete STATUS through 984 | done | E2E phase984 |
| with_whats_this hard-gaps sample | done | E2E phase985 |
| UI whatsThis= bit | done | E2E phase986 |
| Client with_whats_this types | done | E2E phase987 |
| STATUS 985–992 mentions | done | E2E phase988 |
| Soft marker 992 | done | E2E phase989 |
| Typecheck after with_whats_this | done | E2E phase990 |
| e2e-all lists 985–992; gaps=3 | done | E2E phase991 |
| Soft-complete STATUS through 992 | done | E2E phase992 |
| Honesty milestone 1350 + note | done | E2E phase993 |
| Milestone 1350 on all honesty endpoints | done | E2E phase994 |
| UI honesty milestone at 1350 | done | E2E phase995 |
| STATUS milestone 1350 | done | E2E phase996 |
| Soft marker 1000 | done | E2E phase997 |
| Typecheck after milestone 1350 | done | E2E phase998 |
| e2e-all lists 993–1000; gaps=3 | done | E2E phase999 |
| Soft-complete STATUS through 1000 | done | E2E phase1000 |
| with_enabled hard-gaps sample | done | E2E phase1001 |
| UI enabled= bit | done | E2E phase1002 |
| Client with_enabled types | done | E2E phase1003 |
| STATUS 1001–1008 mentions | done | E2E phase1004 |
| Soft marker 1008 | done | E2E phase1005 |
| Typecheck after with_enabled | done | E2E phase1006 |
| e2e-all lists 1001–1008; gaps=3 | done | E2E phase1007 |
| Soft-complete STATUS through 1008 | done | E2E phase1008 |
| with_alignment hard-gaps sample | done | E2E phase1009 |
| UI align= bit | done | E2E phase1010 |
| Client with_alignment types | done | E2E phase1011 |
| STATUS 1009–1016 mentions | done | E2E phase1012 |
| Soft marker 1016 | done | E2E phase1013 |
| Typecheck after with_alignment | done | E2E phase1014 |
| e2e-all lists 1009–1016; gaps=3 | done | E2E phase1015 |
| Soft-complete STATUS through 1016 | done | E2E phase1016 |
| with_read_only hard-gaps sample | done | E2E phase1017 |
| UI readOnly= bit | done | E2E phase1018 |
| Client with_read_only types | done | E2E phase1019 |
| STATUS 1017–1024 mentions | done | E2E phase1020 |
| Soft marker 1024 | done | E2E phase1021 |
| Typecheck after with_read_only | done | E2E phase1022 |
| e2e-all lists 1017–1024; gaps=3 | done | E2E phase1023 |
| Soft-complete STATUS through 1024 | done | E2E phase1024 |
| pages_with_row_stretch hard-gaps sample | done | E2E phase1025 |
| UI rowStretch= bit | done | E2E phase1026 |
| Client pages_with_row_stretch types | done | E2E phase1027 |
| STATUS 1025–1032 mentions | done | E2E phase1028 |
| Soft marker 1032 | done | E2E phase1029 |
| Typecheck after pages_with_row_stretch | done | E2E phase1030 |
| e2e-all lists 1025–1032; gaps=3 | done | E2E phase1031 |
| Soft-complete STATUS through 1032 | done | E2E phase1032 |
| pages_with_tooltip hard-gaps sample | done | E2E phase1033 |
| UI pageTip= bit | done | E2E phase1034 |
| Client pages_with_tooltip types | done | E2E phase1035 |
| STATUS 1033–1040 mentions | done | E2E phase1036 |
| Soft marker 1040 | done | E2E phase1037 |
| Typecheck after pages_with_tooltip | done | E2E phase1038 |
| e2e-all lists 1033–1040; gaps=3 | done | E2E phase1039 |
| Soft-complete STATUS through 1040 | done | E2E phase1040 |
| Honesty milestone 1400 + note | done | E2E phase1041 |
| Milestone 1400 on all honesty endpoints | done | E2E phase1042 |
| UI honesty milestone at 1400 | done | E2E phase1043 |
| STATUS milestone 1400 | done | E2E phase1044 |
| Soft marker 1048 | done | E2E phase1045 |
| Typecheck after milestone 1400 | done | E2E phase1046 |
| e2e-all lists 1041–1048; gaps=3 | done | E2E phase1047 |
| Soft-complete STATUS through 1048 | done | E2E phase1048 |
| with_external_label hard-gaps sample | done | E2E phase1049 |
| UI extLabel= bit | done | E2E phase1050 |
| Client with_external_label types | done | E2E phase1051 |
| STATUS 1049–1056 mentions | done | E2E phase1052 |
| Soft marker 1056 | done | E2E phase1053 |
| Typecheck after with_external_label | done | E2E phase1054 |
| e2e-all lists 1049–1056; gaps=3 | done | E2E phase1055 |
| Soft-complete STATUS through 1056 | done | E2E phase1056 |
| pages_with_buddy_labels hard-gaps sample | done | E2E phase1057 |
| UI pageBuddies= bit | done | E2E phase1058 |
| Client pages_with_buddy_labels types | done | E2E phase1059 |
| STATUS 1057–1064 mentions | done | E2E phase1060 |
| Soft marker 1064 | done | E2E phase1061 |
| Typecheck after pages_with_buddy_labels | done | E2E phase1062 |
| e2e-all lists 1057–1064; gaps=3 | done | E2E phase1063 |
| Soft-complete STATUS through 1064 | done | E2E phase1064 |
| Honesty milestone 1450 + note | done | E2E phase1065 |
| Milestone 1450 on all honesty endpoints | done | E2E phase1066 |
| UI honesty milestone at 1450 | done | E2E phase1067 |
| STATUS milestone 1450 | done | E2E phase1068 |
| Soft marker 1072 | done | E2E phase1069 |
| Typecheck after milestone 1450 | done | E2E phase1070 |
| e2e-all lists 1065–1072; gaps=3 | done | E2E phase1071 |
| Soft-complete STATUS through 1072 | done | E2E phase1072 |
| catalog_complete hard-gaps flag | done | E2E phase1073 |
| UI catalog= bit | done | E2E phase1074 |
| Client catalog_complete types | done | E2E phase1075 |
| STATUS 1073–1080 mentions | done | E2E phase1076 |
| Soft marker 1080 | done | E2E phase1077 |
| Typecheck after catalog_complete | done | E2E phase1078 |
| e2e-all lists 1073–1080; gaps=3 | done | E2E phase1079 |
| Soft-complete STATUS through 1080 | done | E2E phase1080 |
| Honesty milestone 1500 + note | done | E2E phase1081 |
| Milestone 1500 on all honesty endpoints | done | E2E phase1082 |
| UI honesty milestone at 1500 | done | E2E phase1083 |
| STATUS milestone 1500 | done | E2E phase1084 |
| Soft marker 1088 | done | E2E phase1085 |
| Typecheck after milestone 1500 | done | E2E phase1086 |
| e2e-all lists 1081–1088; gaps=3 | done | E2E phase1087 |
| Soft-complete STATUS through 1088 | done | E2E phase1088 |
| Alt iosacl hard-gaps sample | done | E2E phase1089 |
| UI alt=/altBuddies= bits | done | E2E phase1090 |
| Client alt sample types | done | E2E phase1091 |
| STATUS 1089–1096 mentions | done | E2E phase1092 |
| Soft marker 1096 | done | E2E phase1093 |
| Typecheck after alt sample | done | E2E phase1094 |
| e2e-all lists 1089–1096; gaps=3 | done | E2E phase1095 |
| Soft-complete STATUS through 1096 | done | E2E phase1096 |
| Honesty milestone 1550 + note | done | E2E phase1097 |
| Milestone 1550 on all honesty endpoints | done | E2E phase1098 |
| UI honesty milestone at 1550 | done | E2E phase1099 |
| STATUS milestone 1550 | done | E2E phase1100 |
| Soft marker 1104 | done | E2E phase1101 |
| Typecheck after milestone 1550 | done | E2E phase1102 |
| e2e-all lists 1097–1104; gaps=3 | done | E2E phase1103 |
| Soft-complete STATUS through 1104 | done | E2E phase1104 |
| Alt2 junosacl hard-gaps sample | done | E2E phase1105 |
| UI alt2=/alt2Enabled= bits | done | E2E phase1106 |
| Client alt2 sample types | done | E2E phase1107 |
| STATUS 1105–1112 mentions | done | E2E phase1108 |
| Soft marker 1112 | done | E2E phase1109 |
| Typecheck after alt2 sample | done | E2E phase1110 |
| e2e-all lists 1105–1112; gaps=3 | done | E2E phase1111 |
| Soft-complete STATUS through 1112 | done | E2E phase1112 |
| Honesty milestone 1600 + note | done | E2E phase1113 |
| Milestone 1600 on all honesty endpoints | done | E2E phase1114 |
| UI honesty milestone at 1600 | done | E2E phase1115 |
| STATUS milestone 1600 | done | E2E phase1116 |
| Soft marker 1120 | done | E2E phase1117 |
| Typecheck after milestone 1600 | done | E2E phase1118 |
| e2e-all lists 1113–1120; gaps=3 | done | E2E phase1119 |
| Soft-complete STATUS through 1120 | done | E2E phase1120 |
| Alt pages_with_buddy_labels sample | done | E2E phase1121 |
| UI altPageBuddies= bit | done | E2E phase1122 |
| Client alt pageBuddies types | done | E2E phase1123 |
| STATUS 1121–1128 mentions | done | E2E phase1124 |
| Soft marker 1128 | done | E2E phase1125 |
| Typecheck after alt pageBuddies | done | E2E phase1126 |
| e2e-all lists 1121–1128; gaps=3 | done | E2E phase1127 |
| Soft-complete STATUS through 1128 | done | E2E phase1128 |
| Honesty milestone 1650 + note | done | E2E phase1129 |
| Milestone 1650 on all honesty endpoints | done | E2E phase1130 |
| UI honesty milestone at 1650 | done | E2E phase1131 |
| STATUS milestone 1650 | done | E2E phase1132 |
| Soft marker 1136 | done | E2E phase1133 |
| Typecheck after milestone 1650 | done | E2E phase1134 |
| e2e-all lists 1129–1136; gaps=3 | done | E2E phase1135 |
| Soft-complete STATUS through 1136 | done | E2E phase1136 |
| hard_gap_open_labels | done | E2E phase1137 |
| UI open labels bit | done | E2E phase1138 |
| Client hard_gap_open_labels types | done | E2E phase1139 |
| STATUS 1137–1144 mentions | done | E2E phase1140 |
| Soft marker 1144 | done | E2E phase1141 |
| Typecheck after open labels | done | E2E phase1142 |
| e2e-all lists 1137–1144; gaps=3 | done | E2E phase1143 |
| Soft-complete STATUS through 1144 | done | E2E phase1144 |
| Honesty milestone 1700 + note | done | E2E phase1145 |
| Milestone 1700 on all honesty endpoints | done | E2E phase1146 |
| UI honesty milestone at 1700 | done | E2E phase1147 |
| STATUS milestone 1700 | done | E2E phase1148 |
| Soft marker 1152 | done | E2E phase1149 |
| Typecheck after milestone 1700 | done | E2E phase1150 |
| e2e-all lists 1145–1152; gaps=3 | done | E2E phase1151 |
| Soft-complete STATUS through 1152 | done | E2E phase1152 |
| hard_gap_closure_titles | done | E2E phase1153 |
| UI closure titles bit | done | E2E phase1154 |
| Client hard_gap_closure_titles types | done | E2E phase1155 |
| STATUS 1153–1160 mentions | done | E2E phase1156 |
| Soft marker 1160 | done | E2E phase1157 |
| Typecheck after closure titles | done | E2E phase1158 |
| e2e-all lists 1153–1160; gaps=3 | done | E2E phase1159 |
| Soft-complete STATUS through 1160 | done | E2E phase1160 |
| Honesty milestone 1750 + note | done | E2E phase1161 |
| Milestone 1750 on all honesty endpoints | done | E2E phase1162 |
| UI honesty milestone at 1750 | done | E2E phase1163 |
| STATUS milestone 1750 | done | E2E phase1164 |
| Soft marker 1168 | done | E2E phase1165 |
| Typecheck after milestone 1750 | done | E2E phase1166 |
| e2e-all lists 1161–1168; gaps=3 | done | E2E phase1167 |
| Soft-complete STATUS through 1168 | done | E2E phase1168 |
| expect_plan_step_titles | done | E2E phase1169 |
| UI expect step titles bit | done | E2E phase1170 |
| Client expect_plan_step_titles types | done | E2E phase1171 |
| STATUS 1169–1176 mentions | done | E2E phase1172 |
| Soft marker 1176 | done | E2E phase1173 |
| Typecheck after expect step titles | done | E2E phase1174 |
| e2e-all lists 1169–1176; gaps=3 | done | E2E phase1175 |
| Soft-complete STATUS through 1176 | done | E2E phase1176 |
| Honesty milestone 1800 + note | done | E2E phase1177 |
| Milestone 1800 on all honesty endpoints | done | E2E phase1178 |
| UI honesty milestone at 1800 | done | E2E phase1179 |
| STATUS milestone 1800 | done | E2E phase1180 |
| Soft marker 1184 | done | E2E phase1181 |
| Typecheck after milestone 1800 | done | E2E phase1182 |
| e2e-all lists 1177–1184; gaps=3 | done | E2E phase1183 |
| Soft-complete STATUS through 1184 | done | E2E phase1184 |
| ssh_alternative/refusal_path titles | done | E2E phase1185 |
| UI ssh alt titles bit | done | E2E phase1186 |
| Client ssh title types | done | E2E phase1187 |
| STATUS 1185–1192 mentions | done | E2E phase1188 |
| Soft marker 1192 | done | E2E phase1189 |
| Typecheck after ssh titles | done | E2E phase1190 |
| e2e-all lists 1185–1192; gaps=3 | done | E2E phase1191 |
| Soft-complete STATUS through 1192 | done | E2E phase1192 |
| Honesty milestone 1850 + note | done | E2E phase1193 |
| Milestone 1850 on all honesty endpoints | done | E2E phase1194 |
| UI honesty milestone at 1850 | done | E2E phase1195 |
| STATUS milestone 1850 | done | E2E phase1196 |
| Soft marker 1200 | done | E2E phase1197 |
| Typecheck after milestone 1850 | done | E2E phase1198 |
| e2e-all lists 1193–1200; gaps=3 | done | E2E phase1199 |
| Soft-complete STATUS through 1200 | done | E2E phase1200 |
| honesty_path_titles | done | E2E phase1201 |
| UI honesty path titles bit | done | E2E phase1202 |
| Client honesty_path_titles types | done | E2E phase1203 |
| STATUS 1201–1208 mentions | done | E2E phase1204 |
| Soft marker 1208 | done | E2E phase1205 |
| Typecheck after honesty path titles | done | E2E phase1206 |
| e2e-all lists 1201–1208; gaps=3 | done | E2E phase1207 |
| Soft-complete STATUS through 1208 | done | E2E phase1208 |
| Honesty milestone 1900 + note | done | E2E phase1209 |
| Milestone 1900 on all honesty endpoints | done | E2E phase1210 |
| UI honesty milestone at 1900 | done | E2E phase1211 |
| STATUS milestone 1900 | done | E2E phase1212 |
| Soft marker 1216 | done | E2E phase1213 |
| Typecheck after milestone 1900 | done | E2E phase1214 |
| e2e-all lists 1209–1216; gaps=3 | done | E2E phase1215 |
| Soft-complete STATUS through 1216 | done | E2E phase1216 |
| honesty_path_notes | done | E2E phase1217 |
| UI honesty path notes + detail | done | E2E phase1218 |
| Client honesty_path_notes types | done | E2E phase1219 |
| STATUS 1217–1224 mentions | done | E2E phase1220 |
| Soft marker 1224 | done | E2E phase1221 |
| Typecheck after honesty path notes | done | E2E phase1222 |
| e2e-all lists 1217–1224; gaps=3 | done | E2E phase1223 |
| Soft-complete STATUS through 1224 | done | E2E phase1224 |
| Honesty milestone 1950 + note | done | E2E phase1225 |
| Milestone 1950 on all honesty endpoints | done | E2E phase1226 |
| UI honesty milestone at 1950 | done | E2E phase1227 |
| STATUS milestone 1950 | done | E2E phase1228 |
| Soft marker 1232 | done | E2E phase1229 |
| Typecheck after milestone 1950 | done | E2E phase1230 |
| e2e-all lists 1225–1232; gaps=3 | done | E2E phase1231 |
| Soft-complete STATUS through 1232 | done | E2E phase1232 |
| soft_fertig_surface_keys | done | E2E phase1233 |
| UI soft-fertig surface keys | done | E2E phase1234 |
| Client soft_fertig_surface types | done | E2E phase1235 |
| STATUS 1233–1240 mentions | done | E2E phase1236 |
| Soft marker 1240 | done | E2E phase1237 |
| Typecheck after soft_fertig_surface | done | E2E phase1238 |
| e2e-all lists 1233–1240; gaps=3 | done | E2E phase1239 |
| Soft-complete STATUS through 1240 | done | E2E phase1240 |
| Honesty milestone 2000 + note | done | E2E phase1241 |
| Milestone 2000 on all honesty endpoints | done | E2E phase1242 |
| UI honesty milestone at 2000 | done | E2E phase1243 |
| STATUS milestone 2000 | done | E2E phase1244 |
| Soft marker 1248 | done | E2E phase1245 |
| Typecheck after milestone 2000 | done | E2E phase1246 |
| e2e-all lists 1241–1248; gaps=3 | done | E2E phase1247 |
| Soft-complete STATUS through 1248 | done | E2E phase1248 |
| hard_gap_related_refusals | done | E2E phase1249 |
| UI related refusal titles | done | E2E phase1250 |
| Client related refusal types | done | E2E phase1251 |
| STATUS 1249–1256 mentions | done | E2E phase1252 |
| Soft marker 1256 | done | E2E phase1253 |
| Typecheck after related refusals | done | E2E phase1254 |
| e2e-all lists 1249–1256; gaps=3 | done | E2E phase1255 |
| Soft-complete STATUS through 1256 | done | E2E phase1256 |
| Honesty milestone 2050 + note | done | E2E phase1257 |
| Milestone 2050 on all honesty endpoints | done | E2E phase1258 |
| UI honesty milestone at 2050 | done | E2E phase1259 |
| STATUS milestone 2050 | done | E2E phase1260 |
| Soft marker 1264 | done | E2E phase1261 |
| Typecheck after milestone 2050 | done | E2E phase1262 |
| e2e-all lists 1257–1264; gaps=3 | done | E2E phase1263 |
| Soft-complete STATUS through 1264 | done | E2E phase1264 |
| related refusals in surface keys | done | E2E phase1265 |
| UI surface keys after expansion | done | E2E phase1266 |
| Client surface + refusal types | done | E2E phase1267 |
| STATUS 1265–1272 mentions | done | E2E phase1268 |
| Soft marker 1272 | done | E2E phase1269 |
| Typecheck after surface expansion | done | E2E phase1270 |
| e2e-all lists 1265–1272; gaps=3 | done | E2E phase1271 |
| Soft-complete STATUS through 1272 | done | E2E phase1272 |
| Soft-fertig surface expandable detail | done | E2E phase1273 |
| UI surface detail wiring | done | E2E phase1274 |
| Client surface keys type check | done | E2E phase1275 |
| STATUS 1273–1280 mentions | done | E2E phase1276 |
| Soft marker 1280 | done | E2E phase1277 |
| Typecheck after surface detail UI | done | E2E phase1278 |
| e2e-all lists 1273–1280; gaps=3 | done | E2E phase1279 |
| Soft-complete STATUS through 1280 | done | E2E phase1280 |
| Honesty milestone 2100 + note | done | E2E phase1281 |
| Milestone 2100 on all honesty endpoints | done | E2E phase1282 |
| UI honesty milestone at 2100 | done | E2E phase1283 |
| STATUS milestone 2100 | done | E2E phase1284 |
| Soft marker 1288 | done | E2E phase1285 |
| Typecheck after milestone 2100 | done | E2E phase1286 |
| e2e-all lists 1281–1288; gaps=3 | done | E2E phase1287 |
| Soft-complete STATUS through 1288 | done | E2E phase1288 |
| Related refusals expandable detail | done | E2E phase1289 |
| UI related refusals wiring | done | E2E phase1290 |
| Client related refusals type check | done | E2E phase1291 |
| STATUS 1289–1296 mentions | done | E2E phase1292 |
| Soft marker 1296 | done | E2E phase1293 |
| Typecheck after related refusals UI | done | E2E phase1294 |
| e2e-all lists 1289–1296; gaps=3 | done | E2E phase1295 |
| Soft-complete STATUS through 1296 | done | E2E phase1296 |
| Honesty milestone 2150 + note | done | E2E phase1297 |
| Milestone 2150 on all honesty endpoints | done | E2E phase1298 |
| UI honesty milestone at 2150 | done | E2E phase1299 |
| STATUS milestone 2150 | done | E2E phase1300 |
| Soft marker 1304 | done | E2E phase1301 |
| Typecheck after milestone 2150 | done | E2E phase1302 |
| e2e-all lists 1297–1304; gaps=3 | done | E2E phase1303 |
| Soft-complete STATUS through 1304 | done | E2E phase1304 |
| soft_fertig_surface_notes | done | E2E phase1305 |
| UI surface notes | done | E2E phase1306 |
| Client surface notes types | done | E2E phase1307 |
| STATUS 1305–1312 mentions | done | E2E phase1308 |
| Soft marker 1312 | done | E2E phase1309 |
| Typecheck after surface notes | done | E2E phase1310 |
| e2e-all lists 1305–1312; gaps=3 | done | E2E phase1311 |
| Soft-complete STATUS through 1312 | done | E2E phase1312 |
| Honesty milestone 2200 + note | done | E2E phase1313 |
| Milestone 2200 on all honesty endpoints | done | E2E phase1314 |
| UI honesty milestone at 2200 | done | E2E phase1315 |
| STATUS milestone 2200 | done | E2E phase1316 |
| Soft marker 1320 | done | E2E phase1317 |
| Typecheck after milestone 2200 | done | E2E phase1318 |
| e2e-all lists 1313–1320; gaps=3 | done | E2E phase1319 |
| Soft-complete STATUS through 1320 | done | E2E phase1320 |
| related refusals on closure+summary | done | E2E phase1321 |
| UI related refusals still wired | done | E2E phase1322 |
| Client related refusals type | done | E2E phase1323 |
| STATUS 1321–1328 mentions | done | E2E phase1324 |
| Soft marker 1328 | done | E2E phase1325 |
| Typecheck after closure refusals | done | E2E phase1326 |
| e2e-all lists 1321–1328; gaps=3 | done | E2E phase1327 |
| Soft-complete STATUS through 1328 | done | E2E phase1328 |
| Honesty milestone 2250 + note | done | E2E phase1329 |
| Milestone 2250 on all honesty endpoints | done | E2E phase1330 |
| UI honesty milestone at 2250 | done | E2E phase1331 |
| STATUS milestone 2250 | done | E2E phase1332 |
| Soft marker 1336 | done | E2E phase1333 |
| Typecheck after milestone 2250 | done | E2E phase1334 |
| e2e-all lists 1329–1336; gaps=3 | done | E2E phase1335 |
| Soft-complete STATUS through 1336 | done | E2E phase1336 |
| soft_fertig_surface on summary | done | E2E phase1337 |
| UI surface detail still wired | done | E2E phase1338 |
| Client soft_fertig_surface types | done | E2E phase1339 |
| STATUS 1337–1344 mentions | done | E2E phase1340 |
| Soft marker 1344 | done | E2E phase1341 |
| Typecheck after summary soft_fertig_surface | done | E2E phase1342 |
| e2e-all lists 1337–1344; gaps=3 | done | E2E phase1343 |
| Soft-complete STATUS through 1344 | done | E2E phase1344 |
| Honesty milestone 2300 + note | done | E2E phase1345 |
| Milestone 2300 on all honesty endpoints | done | E2E phase1346 |
| UI honesty milestone at 2300 | done | E2E phase1347 |
| STATUS milestone 2300 | done | E2E phase1348 |
| Soft marker 1352 | done | E2E phase1349 |
| Typecheck after milestone 2300 | done | E2E phase1350 |
| e2e-all lists 1345–1352; gaps=3 | done | E2E phase1351 |
| Soft-complete STATUS through 1352 | done | E2E phase1352 |
| soft_fertig_surface on closure | done | E2E phase1353 |
| UI surface detail still wired | done | E2E phase1354 |
| Client soft_fertig_surface types | done | E2E phase1355 |
| STATUS 1353–1360 mentions | done | E2E phase1356 |
| Soft marker 1360 | done | E2E phase1357 |
| Typecheck after closure soft_fertig_surface | done | E2E phase1358 |
| e2e-all lists 1353–1360; gaps=3 | done | E2E phase1359 |
| Soft-complete STATUS through 1360 | done | E2E phase1360 |
| Honesty milestone 2350 + note | done | E2E phase1361 |
| Milestone 2350 on all honesty endpoints | done | E2E phase1362 |
| UI honesty milestone at 2350 | done | E2E phase1363 |
| STATUS milestone 2350 | done | E2E phase1364 |
| Soft marker 1368 | done | E2E phase1365 |
| Typecheck after milestone 2350 | done | E2E phase1366 |
| e2e-all lists 1361–1368; gaps=3 | done | E2E phase1367 |
| Soft-complete STATUS through 1368 | done | E2E phase1368 |
| honesty_paths on summary | done | E2E phase1369 |
| UI honesty paths still wired | done | E2E phase1370 |
| Client honesty paths types | done | E2E phase1371 |
| STATUS 1369–1376 mentions | done | E2E phase1372 |
| Soft marker 1376 | done | E2E phase1373 |
| Typecheck after summary honesty_paths | done | E2E phase1374 |
| e2e-all lists 1369–1376; gaps=3 | done | E2E phase1375 |
| Soft-complete STATUS through 1376 | done | E2E phase1376 |
| Honesty milestone 2400 + note | done | E2E phase1377 |
| Milestone 2400 on all honesty endpoints | done | E2E phase1378 |
| UI honesty milestone at 2400 | done | E2E phase1379 |
| STATUS milestone 2400 | done | E2E phase1380 |
| Soft marker 1384 | done | E2E phase1381 |
| Typecheck after milestone 2400 | done | E2E phase1382 |
| e2e-all lists 1377–1384; gaps=3 | done | E2E phase1383 |
| Soft-complete STATUS through 1384 | done | E2E phase1384 |
| honesty_paths on closure | done | E2E phase1385 |
| UI honesty paths still wired | done | E2E phase1386 |
| Client honesty_paths types | done | E2E phase1387 |
| STATUS 1385–1392 mentions | done | E2E phase1388 |
| Soft marker 1392 | done | E2E phase1389 |
| Typecheck after closure honesty_paths | done | E2E phase1390 |
| e2e-all lists 1385–1392; gaps=3 | done | E2E phase1391 |
| Soft-complete STATUS through 1392 | done | E2E phase1392 |
| Honesty milestone 2450 + note | done | E2E phase1393 |
| Milestone 2450 on all honesty endpoints | done | E2E phase1394 |
| UI honesty milestone at 2450 | done | E2E phase1395 |
| STATUS milestone 2450 | done | E2E phase1396 |
| Soft marker 1400 | done | E2E phase1397 |
| Typecheck after milestone 2450 | done | E2E phase1398 |
| e2e-all lists 1393–1400; gaps=3 | done | E2E phase1399 |
| Soft-complete STATUS through 1400 | done | E2E phase1400 |
| Download soft-fertig surface | done | E2E phase1401 |
| UI surface catalog fields | done | E2E phase1402 |
| Client soft_fertig_surface types | done | E2E phase1403 |
| STATUS 1401–1408 mentions | done | E2E phase1404 |
| Soft marker 1408 | done | E2E phase1405 |
| Typecheck after surface download UI | done | E2E phase1406 |
| e2e-all lists 1401–1408; gaps=3 | done | E2E phase1407 |
| Soft-complete STATUS through 1408 | done | E2E phase1408 |
| Honesty milestone 2500 + note | done | E2E phase1409 |
| Milestone 2500 on all honesty endpoints | done | E2E phase1410 |
| UI honesty milestone at 2500 | done | E2E phase1411 |
| STATUS milestone 2500 | done | E2E phase1412 |
| Soft marker 1416 | done | E2E phase1413 |
| Typecheck after milestone 2500 | done | E2E phase1414 |
| e2e-all lists 1409–1416; gaps=3 | done | E2E phase1415 |
| Soft-complete STATUS through 1416 | done | E2E phase1416 |
| Download related refusals | done | E2E phase1417 |
| UI related refusals fields | done | E2E phase1418 |
| Client related refusals types | done | E2E phase1419 |
| STATUS 1417–1424 mentions | done | E2E phase1420 |
| Soft marker 1424 | done | E2E phase1421 |
| Typecheck after related refusals download | done | E2E phase1422 |
| e2e-all lists 1417–1424; gaps=3 | done | E2E phase1423 |
| Soft-complete STATUS through 1424 | done | E2E phase1424 |
| Honesty milestone 2550 + note | done | E2E phase1425 |
| Milestone 2550 on all honesty endpoints | done | E2E phase1426 |
| UI honesty milestone at 2550 | done | E2E phase1427 |
| STATUS milestone 2550 | done | E2E phase1428 |
| Soft marker 1432 | done | E2E phase1429 |
| Typecheck after milestone 2550 | done | E2E phase1430 |
| e2e-all lists 1425–1432; gaps=3 | done | E2E phase1431 |
| Soft-complete STATUS through 1432 | done | E2E phase1432 |
| Download honesty paths | done | E2E phase1433 |
| UI honesty path fields | done | E2E phase1434 |
| Client honesty_paths types | done | E2E phase1435 |
| STATUS 1433–1440 mentions | done | E2E phase1436 |
| Soft marker 1440 | done | E2E phase1437 |
| Typecheck after honesty paths download | done | E2E phase1438 |
| e2e-all lists 1433–1440; gaps=3 | done | E2E phase1439 |
| Soft-complete STATUS through 1440 | done | E2E phase1440 |
| Honesty milestone 2600 + note | done | E2E phase1441 |
| Milestone 2600 on all honesty endpoints | done | E2E phase1442 |
| UI honesty milestone at 2600 | done | E2E phase1443 |
| STATUS milestone 2600 | done | E2E phase1444 |
| Soft marker 1448 | done | E2E phase1445 |
| Typecheck after milestone 2600 | done | E2E phase1446 |
| e2e-all lists 1441–1448; gaps=3 | done | E2E phase1447 |
| Soft-complete STATUS through 1448 | done | E2E phase1448 |
| sessionStorage catalog keys | done | E2E phase1449 |
| Persist catalogs on download | done | E2E phase1450 |
| Clear removes catalog keys | done | E2E phase1451 |
| STATUS 1449–1456 mentions | done | E2E phase1452 |
| Soft marker 1456 | done | E2E phase1453 |
| Typecheck after sessionStorage catalogs | done | E2E phase1454 |
| e2e-all lists 1449–1456; gaps=3 | done | E2E phase1455 |
| Soft-complete STATUS through 1456 | done | E2E phase1456 |
| Honesty milestone 2650 + note | done | E2E phase1457 |
| Milestone 2650 on all honesty endpoints | done | E2E phase1458 |
| UI honesty milestone at 2650 | done | E2E phase1459 |
| STATUS milestone 2650 | done | E2E phase1460 |
| Soft marker 1464 | done | E2E phase1461 |
| Typecheck after milestone 2650 | done | E2E phase1462 |
| e2e-all lists 1457–1464; gaps=3 | done | E2E phase1463 |
| Soft-complete STATUS through 1464 | done | E2E phase1464 |
| soft_fertig_session_storage_keys | done | E2E phase1465 |
| UI sessionStorage keys bit | done | E2E phase1466 |
| Client session storage types | done | E2E phase1467 |
| STATUS 1465–1472 mentions | done | E2E phase1468 |
| Soft marker 1472 | done | E2E phase1469 |
| Typecheck after session storage catalog | done | E2E phase1470 |
| e2e-all lists 1465–1472; gaps=3 | done | E2E phase1471 |
| Soft-complete STATUS through 1472 | done | E2E phase1472 |
| Honesty milestone 2700 + note | done | E2E phase1473 |
| Milestone 2700 on all honesty endpoints | done | E2E phase1474 |
| UI honesty milestone at 2700 | done | E2E phase1475 |
| STATUS milestone 2700 | done | E2E phase1476 |
| Soft marker 1480 | done | E2E phase1477 |
| Typecheck after milestone 2700 | done | E2E phase1478 |
| e2e-all lists 1473–1480; gaps=3 | done | E2E phase1479 |
| Soft-complete STATUS through 1480 | done | E2E phase1480 |
| session storage keys on summary+closure | done | E2E phase1481 |
| UI sessionStorage keys still wired | done | E2E phase1482 |
| Client session storage types | done | E2E phase1483 |
| STATUS 1481–1488 mentions | done | E2E phase1484 |
| Soft marker 1488 | done | E2E phase1485 |
| Typecheck after session storage summary/closure | done | E2E phase1486 |
| e2e-all lists 1481–1488; gaps=3 | done | E2E phase1487 |
| Soft-complete STATUS through 1488 | done | E2E phase1488 |
| Honesty milestone 2750 + note | done | E2E phase1489 |
| Milestone 2750 on all honesty endpoints | done | E2E phase1490 |
| UI honesty milestone at 2750 | done | E2E phase1491 |
| STATUS milestone 2750 | done | E2E phase1492 |
| Soft marker 1496 | done | E2E phase1493 |
| Typecheck after milestone 2750 | done | E2E phase1494 |
| e2e-all lists 1489–1496; gaps=3 | done | E2E phase1495 |
| Soft-complete STATUS through 1496 | done | E2E phase1496 |
| Soft-fertig sessionStorage keys expandable | done | E2E phase1497 |
| UI sessionStorage detail wiring | done | E2E phase1498 |
| Client session storage types | done | E2E phase1499 |
| STATUS 1497–1504 mentions | done | E2E phase1500 |
| Soft marker 1504 | done | E2E phase1501 |
| Typecheck after sessionStorage detail UI | done | E2E phase1502 |
| e2e-all lists 1497–1504; gaps=3 | done | E2E phase1503 |
| Soft-complete STATUS through 1504 | done | E2E phase1504 |
| Honesty milestone 2800 + note | done | E2E phase1505 |
| Milestone 2800 on all honesty endpoints | done | E2E phase1506 |
| UI honesty milestone at 2800 | done | E2E phase1507 |
| STATUS milestone 2800 | done | E2E phase1508 |
| Soft marker 1512 | done | E2E phase1509 |
| Typecheck after milestone 2800 | done | E2E phase1510 |
| e2e-all lists 1505–1512; gaps=3 | done | E2E phase1511 |
| Soft-complete STATUS through 1512 | done | E2E phase1512 |
| Download sessionStorage keys | done | E2E phase1513 |
| UI session storage key fields | done | E2E phase1514 |
| Client session storage types | done | E2E phase1515 |
| STATUS 1513–1520 mentions | done | E2E phase1516 |
| Soft marker 1520 | done | E2E phase1517 |
| Typecheck after sessionStorage keys download | done | E2E phase1518 |
| e2e-all lists 1513–1520; gaps=3 | done | E2E phase1519 |
| Soft-complete STATUS through 1520 | done | E2E phase1520 |
| Honesty milestone 2850 + note | done | E2E phase1521 |
| Milestone 2850 on all honesty endpoints | done | E2E phase1522 |
| UI honesty milestone at 2850 | done | E2E phase1523 |
| STATUS milestone 2850 | done | E2E phase1524 |
| Soft marker 1528 | done | E2E phase1525 |
| Typecheck after milestone 2850 | done | E2E phase1526 |
| e2e-all lists 1521–1528; gaps=3 | done | E2E phase1527 |
| Soft-complete STATUS through 1528 | done | E2E phase1528 |
| session storage in surface keys | done | E2E phase1529 |
| UI surface+session keys still wired | done | E2E phase1530 |
| Client surface+session types | done | E2E phase1531 |
| STATUS 1529–1536 mentions | done | E2E phase1532 |
| Soft marker 1536 | done | E2E phase1533 |
| Typecheck after surface keys expansion | done | E2E phase1534 |
| e2e-all lists 1529–1536; gaps=3 | done | E2E phase1535 |
| Soft-complete STATUS through 1536 | done | E2E phase1536 |
| Honesty milestone 2900 + note | done | E2E phase1537 |
| Milestone 2900 on all honesty endpoints | done | E2E phase1538 |
| UI honesty milestone at 2900 | done | E2E phase1539 |
| STATUS milestone 2900 | done | E2E phase1540 |
| Soft marker 1544 | done | E2E phase1541 |
| Typecheck after milestone 2900 | done | E2E phase1542 |
| e2e-all lists 1537–1544; gaps=3 | done | E2E phase1543 |
| Soft-complete STATUS through 1544 | done | E2E phase1544 |
| soft_fertig_session_storage_notes | done | E2E phase1545 |
| UI sessionStorage notes in detail/download | done | E2E phase1546 |
| Client session storage notes types | done | E2E phase1547 |
| STATUS 1545–1552 mentions | done | E2E phase1548 |
| Soft marker 1552 | done | E2E phase1549 |
| Typecheck after session storage notes | done | E2E phase1550 |
| e2e-all lists 1545–1552; gaps=3 | done | E2E phase1551 |
| Soft-complete STATUS through 1552 | done | E2E phase1552 |
| Honesty milestone 2950 + note | done | E2E phase1553 |
| Milestone 2950 on all honesty endpoints | done | E2E phase1554 |
| UI honesty milestone at 2950 | done | E2E phase1555 |
| STATUS milestone 2950 | done | E2E phase1556 |
| Soft marker 1560 | done | E2E phase1557 |
| Typecheck after milestone 2950 | done | E2E phase1558 |
| e2e-all lists 1553–1560; gaps=3 | done | E2E phase1559 |
| Soft-complete STATUS through 1560 | done | E2E phase1560 |
| session storage notes in surface keys | done | E2E phase1561 |
| UI surface+session notes still wired | done | E2E phase1562 |
| Client surface+session notes types | done | E2E phase1563 |
| STATUS 1561–1568 mentions | done | E2E phase1564 |
| Soft marker 1568 | done | E2E phase1565 |
| Typecheck after surface notes expansion | done | E2E phase1566 |
| e2e-all lists 1561–1568; gaps=3 | done | E2E phase1567 |
| Soft-complete STATUS through 1568 | done | E2E phase1568 |
| Honesty milestone 3000 + note | done | E2E phase1569 |
| Milestone 3000 on all honesty endpoints | done | E2E phase1570 |
| UI honesty milestone at 3000 | done | E2E phase1571 |
| STATUS milestone 3000 | done | E2E phase1572 |
| Soft marker 1576 | done | E2E phase1573 |
| Typecheck after milestone 3000 | done | E2E phase1574 |
| e2e-all lists 1569–1576; gaps=3 | done | E2E phase1575 |
| Soft-complete STATUS through 1576 | done | E2E phase1576 |
| soft_fertig_honesty_export_keys | done | E2E phase1577 |
| UI honesty exports + session notes count | done | E2E phase1578 |
| Client honesty export types | done | E2E phase1579 |
| STATUS 1577–1584 mentions | done | E2E phase1580 |
| Soft marker 1584 | done | E2E phase1581 |
| Typecheck after honesty export catalog | done | E2E phase1582 |
| e2e-all lists 1577–1584; gaps=3 | done | E2E phase1583 |
| Soft-complete STATUS through 1584 | done | E2E phase1584 |
| Honesty milestone 3050 + note | done | E2E phase1585 |
| Milestone 3050 on all honesty endpoints | done | E2E phase1586 |
| UI honesty milestone at 3050 | done | E2E phase1587 |
| STATUS milestone 3050 | done | E2E phase1588 |
| Soft marker 1592 | done | E2E phase1589 |
| Typecheck after milestone 3050 | done | E2E phase1590 |
| e2e-all lists 1585–1592; gaps=3 | done | E2E phase1591 |
| Soft-complete STATUS through 1592 | done | E2E phase1592 |
| honesty export in surface keys | done | E2E phase1593 |
| UI surface+honesty export still wired | done | E2E phase1594 |
| Client surface+honesty export types | done | E2E phase1595 |
| STATUS 1593–1600 mentions | done | E2E phase1596 |
| Soft marker 1600 | done | E2E phase1597 |
| Typecheck after surface honesty export | done | E2E phase1598 |
| e2e-all lists 1593–1600; gaps=3 | done | E2E phase1599 |
| Soft-complete STATUS through 1600 | done | E2E phase1600 |
| Honesty milestone 3100 + note | done | E2E phase1601 |
| Milestone 3100 on all honesty endpoints | done | E2E phase1602 |
| UI honesty milestone at 3100 | done | E2E phase1603 |
| STATUS milestone 3100 | done | E2E phase1604 |
| Soft marker 1608 | done | E2E phase1605 |
| Typecheck after milestone 3100 | done | E2E phase1606 |
| e2e-all lists 1601–1608; gaps=3 | done | E2E phase1607 |
| Soft-complete STATUS through 1608 | done | E2E phase1608 |
| soft_fertig_honesty_bundle_sections | done | E2E phase1609 |
| UI honesty bundle download/copy | done | E2E phase1610 |
| Client honesty bundle types | done | E2E phase1611 |
| STATUS 1609–1616 mentions | done | E2E phase1612 |
| Soft marker 1616 | done | E2E phase1613 |
| Typecheck after honesty bundle | done | E2E phase1614 |
| e2e-all lists 1609–1616; gaps=3 | done | E2E phase1615 |
| Soft-complete STATUS through 1616 | done | E2E phase1616 |
| Honesty milestone 3150 + note | done | E2E phase1617 |
| Milestone 3150 on all honesty endpoints | done | E2E phase1618 |
| UI honesty milestone at 3150 | done | E2E phase1619 |
| STATUS milestone 3150 | done | E2E phase1620 |
| Soft marker 1624 | done | E2E phase1621 |
| Typecheck after milestone 3150 | done | E2E phase1622 |
| e2e-all lists 1617–1624; gaps=3 | done | E2E phase1623 |
| Soft-complete STATUS through 1624 | done | E2E phase1624 |
| honesty bundle in surface keys | done | E2E phase1625 |
| UI surface+honesty bundle still wired | done | E2E phase1626 |
| Client surface+honesty bundle types | done | E2E phase1627 |
| STATUS 1625–1632 mentions | done | E2E phase1628 |
| Soft marker 1632 | done | E2E phase1629 |
| Typecheck after surface honesty bundle | done | E2E phase1630 |
| e2e-all lists 1625–1632; gaps=3 | done | E2E phase1631 |
| Soft-complete STATUS through 1632 | done | E2E phase1632 |
| Honesty milestone 3200 + note | done | E2E phase1633 |
| Milestone 3200 on all honesty endpoints | done | E2E phase1634 |
| UI honesty milestone at 3200 | done | E2E phase1635 |
| STATUS milestone 3200 | done | E2E phase1636 |
| Soft marker 1640 | done | E2E phase1637 |
| Typecheck after milestone 3200 | done | E2E phase1638 |
| e2e-all lists 1633–1640; gaps=3 | done | E2E phase1639 |
| Soft-complete STATUS through 1640 | done | E2E phase1640 |
| honesty_bundle in session/export catalogs | done | E2E phase1641 |
| UI honestyBundleStorageKey wiring | done | E2E phase1642 |
| Client session/export types still ok | done | E2E phase1643 |
| STATUS 1641–1648 mentions | done | E2E phase1644 |
| Soft marker 1648 | done | E2E phase1645 |
| Typecheck after honesty_bundle catalogs | done | E2E phase1646 |
| e2e-all lists 1641–1648; gaps=3 | done | E2E phase1647 |
| Soft-complete STATUS through 1648 | done | E2E phase1648 |
| Honesty milestone 3250 + note | done | E2E phase1649 |
| Milestone 3250 on all honesty endpoints | done | E2E phase1650 |
| UI honesty milestone at 3250 | done | E2E phase1651 |
| STATUS milestone 3250 | done | E2E phase1652 |
| Soft marker 1656 | done | E2E phase1653 |
| Typecheck after milestone 3250 | done | E2E phase1654 |
| e2e-all lists 1649–1656; gaps=3 | done | E2E phase1655 |
| Soft-complete STATUS through 1656 | done | E2E phase1656 |
| soft_fertig_session_storage_clear_* | done | E2E phase1657 |
| UI Clear honesty catalogs | done | E2E phase1658 |
| Client session storage clear types | done | E2E phase1659 |
| STATUS 1657–1664 mentions | done | E2E phase1660 |
| Soft marker 1664 | done | E2E phase1661 |
| Typecheck after session storage clear | done | E2E phase1662 |
| e2e-all lists 1657–1664; gaps=3 | done | E2E phase1663 |
| Soft-complete STATUS through 1664 | done | E2E phase1664 |
| Honesty milestone 3300 + note | done | E2E phase1665 |
| Milestone 3300 on all honesty endpoints | done | E2E phase1666 |
| UI honesty milestone at 3300 | done | E2E phase1667 |
| STATUS milestone 3300 | done | E2E phase1668 |
| Soft marker 1672 | done | E2E phase1669 |
| Typecheck after milestone 3300 | done | E2E phase1670 |
| e2e-all lists 1665–1672; gaps=3 | done | E2E phase1671 |
| Soft-complete STATUS through 1672 | done | E2E phase1672 |
| session storage clear in surface keys | done | E2E phase1673 |
| UI surface+clear still wired | done | E2E phase1674 |
| Client surface+clear types | done | E2E phase1675 |
| STATUS 1673–1680 mentions | done | E2E phase1676 |
| Soft marker 1680 | done | E2E phase1677 |
| Typecheck after surface clear expansion | done | E2E phase1678 |
| e2e-all lists 1673–1680; gaps=3 | done | E2E phase1679 |
| Soft-complete STATUS through 1680 | done | E2E phase1680 |
| Honesty milestone 3350 + note | done | E2E phase1681 |
| Milestone 3350 on all honesty endpoints | done | E2E phase1682 |
| UI honesty milestone at 3350 | done | E2E phase1683 |
| STATUS milestone 3350 | done | E2E phase1684 |
| Soft marker 1688 | done | E2E phase1685 |
| Typecheck after milestone 3350 | done | E2E phase1686 |
| e2e-all lists 1681–1688; gaps=3 | done | E2E phase1687 |
| Soft-complete STATUS through 1688 | done | E2E phase1688 |
| clear catalog API data for UI detail | done | E2E phase1689 |
| UI clear detail + download/copy | done | E2E phase1690 |
| Client clear types still ok | done | E2E phase1691 |
| STATUS 1689–1696 mentions | done | E2E phase1692 |
| Soft marker 1696 | done | E2E phase1693 |
| Typecheck after clear detail UI | done | E2E phase1694 |
| e2e-all lists 1689–1696; gaps=3 | done | E2E phase1695 |
| Soft-complete STATUS through 1696 | done | E2E phase1696 |
| Honesty milestone 3400 + note | done | E2E phase1697 |
| Milestone 3400 on all honesty endpoints | done | E2E phase1698 |
| UI honesty milestone at 3400 | done | E2E phase1699 |
| STATUS milestone 3400 | done | E2E phase1700 |
| Soft marker 1704 | done | E2E phase1701 |
| Typecheck after milestone 3400 | done | E2E phase1702 |
| e2e-all lists 1697–1704; gaps=3 | done | E2E phase1703 |
| Soft-complete STATUS through 1704 | done | E2E phase1704 |
| session_storage_clear in export/bundle | done | E2E phase1705 |
| UI bundle includes session_storage_clear | done | E2E phase1706 |
| Client export/bundle types still ok | done | E2E phase1707 |
| STATUS 1705–1712 mentions | done | E2E phase1708 |
| Soft marker 1712 | done | E2E phase1709 |
| Typecheck after clear in export/bundle | done | E2E phase1710 |
| e2e-all lists 1705–1712; gaps=3 | done | E2E phase1711 |
| Soft-complete STATUS through 1712 | done | E2E phase1712 |
| Honesty milestone 3450 + note | done | E2E phase1713 |
| Milestone 3450 on all honesty endpoints | done | E2E phase1714 |
| UI honesty milestone at 3450 | done | E2E phase1715 |
| STATUS milestone 3450 | done | E2E phase1716 |
| Soft marker 1720 | done | E2E phase1717 |
| Typecheck after milestone 3450 | done | E2E phase1718 |
| e2e-all lists 1713–1720; gaps=3 | done | E2E phase1719 |
| Soft-complete STATUS through 1720 | done | E2E phase1720 |
| soft_fertig_honesty_surface_version | done | E2E phase1721 |
| UI surface schema version bit | done | E2E phase1722 |
| Client surface version types | done | E2E phase1723 |
| STATUS 1721–1728 mentions | done | E2E phase1724 |
| Soft marker 1728 | done | E2E phase1725 |
| Typecheck after surface version | done | E2E phase1726 |
| e2e-all lists 1721–1728; gaps=3 | done | E2E phase1727 |
| Soft-complete STATUS through 1728 | done | E2E phase1728 |
| Honesty milestone 3500 + note | done | E2E phase1729 |
| Milestone 3500 on all honesty endpoints | done | E2E phase1730 |
| UI honesty milestone at 3500 | done | E2E phase1731 |
| STATUS milestone 3500 | done | E2E phase1732 |
| Soft marker 1736 | done | E2E phase1733 |
| Typecheck after milestone 3500 | done | E2E phase1734 |
| e2e-all lists 1729–1736; gaps=3 | done | E2E phase1735 |
| Soft-complete STATUS through 1736 | done | E2E phase1736 |
| surface_version in export/bundle | done | E2E phase1737 |
| UI surface_version download/copy | done | E2E phase1738 |
| Client surface_version types still ok | done | E2E phase1739 |
| STATUS 1737–1744 mentions | done | E2E phase1740 |
| Soft marker 1744 | done | E2E phase1741 |
| Typecheck after surface_version export/bundle | done | E2E phase1742 |
| e2e-all lists 1737–1744; gaps=3 | done | E2E phase1743 |
| Soft-complete STATUS through 1744 | done | E2E phase1744 |
| Honesty milestone 3550 + note | done | E2E phase1745 |
| Milestone 3550 on all honesty endpoints | done | E2E phase1746 |
| UI honesty milestone at 3550 | done | E2E phase1747 |
| STATUS milestone 3550 | done | E2E phase1748 |
| Soft marker 1752 | done | E2E phase1749 |
| Typecheck after milestone 3550 | done | E2E phase1750 |
| e2e-all lists 1745–1752; gaps=3 | done | E2E phase1751 |
| Soft-complete STATUS through 1752 | done | E2E phase1752 |
| soft_fertig_catalog_summary | done | E2E phase1753 |
| UI surface/summary still wired | done | E2E phase1754 |
| Client catalog summary type | done | E2E phase1755 |
| STATUS 1753–1760 mentions | done | E2E phase1756 |
| Soft marker 1760 | done | E2E phase1757 |
| Typecheck after catalog summary | done | E2E phase1758 |
| e2e-all lists 1753–1760; gaps=3 | done | E2E phase1759 |
| Soft-complete STATUS through 1760 | done | E2E phase1760 |
| Honesty milestone 3600 + note | done | E2E phase1761 |
| Milestone 3600 on all honesty endpoints | done | E2E phase1762 |
| UI honesty milestone at 3600 | done | E2E phase1763 |
| STATUS milestone 3600 | done | E2E phase1764 |
| Soft marker 1768 | done | E2E phase1765 |
| Typecheck after milestone 3600 | done | E2E phase1766 |
| e2e-all lists 1761–1768; gaps=3 | done | E2E phase1767 |
| Soft-complete STATUS through 1768 | done | E2E phase1768 |
| catalog summary API data for UI | done | E2E phase1769 |
| UI catalog summary detail/download | done | E2E phase1770 |
| Client catalog summary type still ok | done | E2E phase1771 |
| STATUS 1769–1776 mentions | done | E2E phase1772 |
| Soft marker 1776 | done | E2E phase1773 |
| Typecheck after catalog summary UI | done | E2E phase1774 |
| e2e-all lists 1769–1776; gaps=3 | done | E2E phase1775 |
| Soft-complete STATUS through 1776 | done | E2E phase1776 |
| Honesty milestone 3650 + note | done | E2E phase1777 |
| Milestone 3650 on all honesty endpoints | done | E2E phase1778 |
| UI honesty milestone at 3650 | done | E2E phase1779 |
| STATUS milestone 3650 | done | E2E phase1780 |
| Soft marker 1784 | done | E2E phase1781 |
| Typecheck after milestone 3650 | done | E2E phase1782 |
| e2e-all lists 1777–1784; gaps=3 | done | E2E phase1783 |
| Soft-complete STATUS through 1784 | done | E2E phase1784 |
| catalog_summary in export/bundle | done | E2E phase1785 |
| UI bundle includes catalog_summary | done | E2E phase1786 |
| Client catalog_summary types still ok | done | E2E phase1787 |
| STATUS 1785–1792 mentions | done | E2E phase1788 |
| Soft marker 1792 | done | E2E phase1789 |
| Typecheck after catalog_summary export/bundle | done | E2E phase1790 |
| e2e-all lists 1785–1792; gaps=3 | done | E2E phase1791 |
| Soft-complete STATUS through 1792 | done | E2E phase1792 |
| Honesty milestone 3700 + note | done | E2E phase1793 |
| Milestone 3700 on all honesty endpoints | done | E2E phase1794 |
| UI honesty milestone at 3700 | done | E2E phase1795 |
| STATUS milestone 3700 | done | E2E phase1796 |
| Soft marker 1800 | done | E2E phase1797 |
| Typecheck after milestone 3700 | done | E2E phase1798 |
| e2e-all lists 1793–1800; gaps=3 | done | E2E phase1799 |
| Soft-complete STATUS through 1800 | done | E2E phase1800 |
| soft_fertig_honesty_surface_version 1.1 | done | E2E phase1801 |
| UI surface schema still wired | done | E2E phase1802 |
| Client surface version types still ok | done | E2E phase1803 |
| STATUS 1801–1808 mentions | done | E2E phase1804 |
| Soft marker 1808 | done | E2E phase1805 |
| Typecheck after schema 1.1 | done | E2E phase1806 |
| e2e-all lists 1801–1808; gaps=3 | done | E2E phase1807 |
| Soft-complete STATUS through 1808 | done | E2E phase1808 |
| Honesty milestone 3750 + note | done | E2E phase1809 |
| Milestone 3750 on all honesty endpoints | done | E2E phase1810 |
| UI honesty milestone at 3750 | done | E2E phase1811 |
| STATUS milestone 3750 | done | E2E phase1812 |
| Soft marker 1816 | done | E2E phase1813 |
| Typecheck after milestone 3750 | done | E2E phase1814 |
| e2e-all lists 1809–1816; gaps=3 | done | E2E phase1815 |
| Soft-complete STATUS through 1816 | done | E2E phase1816 |
| soft_fertig_honesty_track_note | done | E2E phase1817 |
| UI track note wiring | done | E2E phase1818 |
| Client track note type | done | E2E phase1819 |
| STATUS 1817–1824 mentions | done | E2E phase1820 |
| Soft marker 1824 | done | E2E phase1821 |
| Typecheck after track note | done | E2E phase1822 |
| e2e-all lists 1817–1824; gaps=3 | done | E2E phase1823 |
| Soft-complete STATUS through 1824 | done | E2E phase1824 |
| Honesty milestone 3800 + note | done | E2E phase1825 |
| Milestone 3800 on all honesty endpoints | done | E2E phase1826 |
| UI honesty milestone at 3800 | done | E2E phase1827 |
| STATUS milestone 3800 | done | E2E phase1828 |
| Soft marker 1832 | done | E2E phase1829 |
| Typecheck after milestone 3800 | done | E2E phase1830 |
| e2e-all lists 1825–1832; gaps=3 | done | E2E phase1831 |
| Soft-complete STATUS through 1832 | done | E2E phase1832 |
| track_note in catalog_summary/export/bundle | done | E2E phase1833 |
| UI track_note download/copy | done | E2E phase1834 |
| Client track_note types still ok | done | E2E phase1835 |
| STATUS 1833–1840 mentions | done | E2E phase1836 |
| Soft marker 1840 | done | E2E phase1837 |
| Typecheck after track_note export/bundle | done | E2E phase1838 |
| e2e-all lists 1833–1840; gaps=3 | done | E2E phase1839 |
| Soft-complete STATUS through 1840 | done | E2E phase1840 |
| Honesty milestone 3850 + note | done | E2E phase1841 |
| Milestone 3850 on all honesty endpoints | done | E2E phase1842 |
| UI honesty milestone at 3850 | done | E2E phase1843 |
| STATUS milestone 3850 | done | E2E phase1844 |
| Soft marker 1848 | done | E2E phase1845 |
| Typecheck after milestone 3850 | done | E2E phase1846 |
| e2e-all lists 1841–1848; gaps=3 | done | E2E phase1847 |
| Soft-complete STATUS through 1848 | done | E2E phase1848 |
| track_note in sessionStorage + clear | done | E2E phase1849 |
| UI honestyTrackNoteStorageKey + clear | done | E2E phase1850 |
| Export/bundle notes mention track_note session | done | E2E phase1851 |
| STATUS 1849–1856 mentions | done | E2E phase1852 |
| Soft marker 1856 | done | E2E phase1853 |
| Typecheck after track_note sessionStorage | done | E2E phase1854 |
| e2e-all lists 1849–1856; gaps=3 | done | E2E phase1855 |
| Soft-complete STATUS through 1856 | done | E2E phase1856 |
| Honesty milestone 3900 + note | done | E2E phase1857 |
| Milestone 3900 on all honesty endpoints | done | E2E phase1858 |
| UI honesty milestone at 3900 | done | E2E phase1859 |
| STATUS milestone 3900 | done | E2E phase1860 |
| Soft marker 1864 | done | E2E phase1861 |
| Typecheck after milestone 3900 | done | E2E phase1862 |
| e2e-all lists 1857–1864; gaps=3 | done | E2E phase1863 |
| Soft-complete STATUS through 1864 | done | E2E phase1864 |
| soft_fertig_honesty_surface_version 1.2 | done | E2E phase1865 |
| UI surface schema still shows version | done | E2E phase1866 |
| Client surface version types still ok | done | E2E phase1867 |
| STATUS 1865–1872 mentions | done | E2E phase1868 |
| Soft marker 1872 | done | E2E phase1869 |
| Typecheck after schema 1.2 | done | E2E phase1870 |
| e2e-all lists 1865–1872; gaps=3 | done | E2E phase1871 |
| Soft-complete STATUS through 1872 | done | E2E phase1872 |
| Honesty milestone 3950 + note | done | E2E phase1873 |
| Milestone 3950 on all honesty endpoints | done | E2E phase1874 |
| UI honesty milestone at 3950 | done | E2E phase1875 |
| STATUS milestone 3950 | done | E2E phase1876 |
| Soft marker 1880 | done | E2E phase1877 |
| Typecheck after milestone 3950 | done | E2E phase1878 |
| e2e-all lists 1873–1880; gaps=3 | done | E2E phase1879 |
| Soft-complete STATUS through 1880 | done | E2E phase1880 |
| track_note session note mentions restore | done | E2E phase1881 |
| UI trackNoteDetail expandable | done | E2E phase1882 |
| UI restores track note from sessionStorage | done | E2E phase1883 |
| STATUS 1881–1888 mentions | done | E2E phase1884 |
| Soft marker 1888 | done | E2E phase1885 |
| Typecheck after track note detail/restore | done | E2E phase1886 |
| e2e-all lists 1881–1888; gaps=3 | done | E2E phase1887 |
| Soft-complete STATUS through 1888 | done | E2E phase1888 |
| Honesty milestone 4000 + note | done | E2E phase1889 |
| Milestone 4000 on all honesty endpoints | done | E2E phase1890 |
| UI honesty milestone at 4000 | done | E2E phase1891 |
| STATUS milestone 4000 | done | E2E phase1892 |
| Soft marker 1896 | done | E2E phase1893 |
| Typecheck after milestone 4000 | done | E2E phase1894 |
| e2e-all lists 1889–1896; gaps=3 | done | E2E phase1895 |
| Soft-complete STATUS through 1896 | done | E2E phase1896 |
| soft_fertig_honesty_readiness | done | E2E phase1897 |
| UI honesty readiness detail/download | done | E2E phase1898 |
| Client honesty readiness type | done | E2E phase1899 |
| STATUS 1897–1904 mentions | done | E2E phase1900 |
| Soft marker 1904 | done | E2E phase1901 |
| Typecheck after honesty readiness | done | E2E phase1902 |
| e2e-all lists 1897–1904; gaps=3 | done | E2E phase1903 |
| Soft-complete STATUS through 1904 | done | E2E phase1904 |
| Honesty milestone 4050 + note | done | E2E phase1905 |
| Milestone 4050 on all honesty endpoints | done | E2E phase1906 |
| UI honesty milestone at 4050 | done | E2E phase1907 |
| STATUS milestone 4050 | done | E2E phase1908 |
| Soft marker 1912 | done | E2E phase1909 |
| Typecheck after milestone 4050 | done | E2E phase1910 |
| e2e-all lists 1905–1912; gaps=3 | done | E2E phase1911 |
| Soft-complete STATUS through 1912 | done | E2E phase1912 |
| readiness in export/bundle | done | E2E phase1913 |
| UI readiness bundle section | done | E2E phase1914 |
| Export/bundle notes mention readiness | done | E2E phase1915 |
| STATUS 1913–1920 mentions | done | E2E phase1916 |
| Soft marker 1920 | done | E2E phase1917 |
| Typecheck after readiness export/bundle | done | E2E phase1918 |
| e2e-all lists 1913–1920; gaps=3 | done | E2E phase1919 |
| Soft-complete STATUS through 1920 | done | E2E phase1920 |
| Honesty milestone 4100 + note | done | E2E phase1921 |
| Milestone 4100 on all honesty endpoints | done | E2E phase1922 |
| UI honesty milestone at 4100 | done | E2E phase1923 |
| STATUS milestone 4100 | done | E2E phase1924 |
| Soft marker 1928 | done | E2E phase1925 |
| Typecheck after milestone 4100 | done | E2E phase1926 |
| e2e-all lists 1921–1928; gaps=3 | done | E2E phase1927 |
| Soft-complete STATUS through 1928 | done | E2E phase1928 |
| soft_fertig_honesty_surface_version 1.3 | done | E2E phase1929 |
| UI surface schema still shows version | done | E2E phase1930 |
| Client surface/readiness types still ok | done | E2E phase1931 |
| STATUS 1929–1936 mentions | done | E2E phase1932 |
| Soft marker 1936 | done | E2E phase1933 |
| Typecheck after schema 1.3 | done | E2E phase1934 |
| e2e-all lists 1929–1936; gaps=3 | done | E2E phase1935 |
| Soft-complete STATUS through 1936 | done | E2E phase1936 |
| Honesty milestone 4150 + note | done | E2E phase1937 |
| Milestone 4150 on all honesty endpoints | done | E2E phase1938 |
| UI honesty milestone at 4150 | done | E2E phase1939 |
| STATUS milestone 4150 | done | E2E phase1940 |
| Soft marker 1944 | done | E2E phase1941 |
| Typecheck after milestone 4150 | done | E2E phase1942 |
| e2e-all lists 1937–1944; gaps=3 | done | E2E phase1943 |
| Soft-complete STATUS through 1944 | done | E2E phase1944 |
| readiness in sessionStorage + clear | done | E2E phase1945 |
| UI honestyReadinessStorageKey + clear/restore | done | E2E phase1946 |
| Export/bundle notes mention readiness session | done | E2E phase1947 |
| STATUS 1945–1952 mentions | done | E2E phase1948 |
| Soft marker 1952 | done | E2E phase1949 |
| Typecheck after readiness sessionStorage | done | E2E phase1950 |
| e2e-all lists 1945–1952; gaps=3 | done | E2E phase1951 |
| Soft-complete STATUS through 1952 | done | E2E phase1952 |
| Honesty milestone 4200 + note | done | E2E phase1953 |
| Milestone 4200 on all honesty endpoints | done | E2E phase1954 |
| UI honesty milestone at 4200 | done | E2E phase1955 |
| STATUS milestone 4200 | done | E2E phase1956 |
| Soft marker 1960 | done | E2E phase1957 |
| Typecheck after milestone 4200 | done | E2E phase1958 |
| e2e-all lists 1953–1960; gaps=3 | done | E2E phase1959 |
| Soft-complete STATUS through 1960 | done | E2E phase1960 |
| catalog_summary catalogs_complete + hard_gaps_remain | done | E2E phase1961 |
| UI catalog summary still present | done | E2E phase1962 |
| Client catalog summary type still ok | done | E2E phase1963 |
| STATUS 1961–1968 mentions | done | E2E phase1964 |
| Soft marker 1968 | done | E2E phase1965 |
| Typecheck after catalog_summary flags | done | E2E phase1966 |
| e2e-all lists 1961–1968; gaps=3 | done | E2E phase1967 |
| Soft-complete STATUS through 1968 | done | E2E phase1968 |
| Honesty milestone 4250 + note | done | E2E phase1969 |
| Milestone 4250 on all honesty endpoints | done | E2E phase1970 |
| UI honesty milestone at 4250 | done | E2E phase1971 |
| STATUS milestone 4250 | done | E2E phase1972 |
| Soft marker 1976 | done | E2E phase1973 |
| Typecheck after milestone 4250 | done | E2E phase1974 |
| e2e-all lists 1969–1976; gaps=3 | done | E2E phase1975 |
| Soft-complete STATUS through 1976 | done | E2E phase1976 |
| soft_fertig_honesty_surface_version 1.4 | done | E2E phase1977 |
| UI surface schema still shows version | done | E2E phase1978 |
| Client surface version types still ok | done | E2E phase1979 |
| STATUS 1977–1984 mentions | done | E2E phase1980 |
| Soft marker 1984 | done | E2E phase1981 |
| Typecheck after schema 1.4 | done | E2E phase1982 |
| e2e-all lists 1977–1984; gaps=3 | done | E2E phase1983 |
| Soft-complete STATUS through 1984 | done | E2E phase1984 |
| Honesty milestone 4300 + note | done | E2E phase1985 |
| Milestone 4300 on all honesty endpoints | done | E2E phase1986 |
| UI honesty milestone at 4300 | done | E2E phase1987 |
| STATUS milestone 4300 | done | E2E phase1988 |
| Soft marker 1992 | done | E2E phase1989 |
| Typecheck after milestone 4300 | done | E2E phase1990 |
| e2e-all lists 1985–1992; gaps=3 | done | E2E phase1991 |
| Soft-complete STATUS through 1992 | done | E2E phase1992 |
| soft_fertig_soft_complete_note | done | E2E phase1993 |
| UI softCompleteNote wiring | done | E2E phase1994 |
| Client soft_complete_note type | done | E2E phase1995 |
| STATUS 1993–2000 mentions | done | E2E phase1996 |
| Soft marker 2000 | done | E2E phase1997 |
| Typecheck after soft_complete_note | done | E2E phase1998 |
| e2e-all lists 1993–2000; gaps=3 | done | E2E phase1999 |
| Soft-complete STATUS through 2000 | done | E2E phase2000 |
| Honesty milestone 4350 + note | done | E2E phase2001 |
| Milestone 4350 on all honesty endpoints | done | E2E phase2002 |
| UI honesty milestone at 4350 | done | E2E phase2003 |
| STATUS milestone 4350 | done | E2E phase2004 |
| Soft marker 2008 | done | E2E phase2005 |
| Typecheck after milestone 4350 | done | E2E phase2006 |
| e2e-all lists 2001–2008; gaps=3 | done | E2E phase2007 |
| Soft-complete STATUS through 2008 | done | E2E phase2008 |
| soft_complete_note in export/bundle | done | E2E phase2009 |
| UI soft_complete_note download/copy | done | E2E phase2010 |
| Export/bundle notes mention soft_complete_note | done | E2E phase2011 |
| STATUS 2009–2016 mentions | done | E2E phase2012 |
| Soft marker 2016 | done | E2E phase2013 |
| Typecheck after soft_complete_note export/bundle | done | E2E phase2014 |
| e2e-all lists 2009–2016; gaps=3 | done | E2E phase2015 |
| Soft-complete STATUS through 2016 | done | E2E phase2016 |
| Honesty milestone 4400 + note | done | E2E phase2017 |
| Milestone 4400 on all honesty endpoints | done | E2E phase2018 |
| UI honesty milestone at 4400 | done | E2E phase2019 |
| STATUS milestone 4400 | done | E2E phase2020 |
| Soft marker 2024 | done | E2E phase2021 |
| Typecheck after milestone 4400 | done | E2E phase2022 |
| e2e-all lists 2017–2024; gaps=3 | done | E2E phase2023 |
| Soft-complete STATUS through 2024 | done | E2E phase2024 |
| soft_fertig_honesty_surface_version 1.5 | done | E2E phase2025 |
| UI surface schema still shows version | done | E2E phase2026 |
| Client surface/soft_complete types still ok | done | E2E phase2027 |
| STATUS 2025–2032 mentions | done | E2E phase2028 |
| Soft marker 2032 | done | E2E phase2029 |
| Typecheck after schema 1.5 | done | E2E phase2030 |
| e2e-all lists 2025–2032; gaps=3 | done | E2E phase2031 |
| Soft-complete STATUS through 2032 | done | E2E phase2032 |
| Honesty milestone 4450 + note | done | E2E phase2033 |
| Milestone 4450 on all honesty endpoints | done | E2E phase2034 |
| UI honesty milestone at 4450 | done | E2E phase2035 |
| STATUS milestone 4450 | done | E2E phase2036 |
| Soft marker 2040 | done | E2E phase2037 |
| Typecheck after milestone 4450 | done | E2E phase2038 |
| e2e-all lists 2033–2040; gaps=3 | done | E2E phase2039 |
| Soft-complete STATUS through 2040 | done | E2E phase2040 |
| soft_complete_note in sessionStorage + clear | done | E2E phase2041 |
| UI softCompleteNoteStorageKey + clear/restore | done | E2E phase2042 |
| Export/bundle notes mention soft_complete_note session | done | E2E phase2043 |
| STATUS 2041–2048 mentions | done | E2E phase2044 |
| Soft marker 2048 | done | E2E phase2045 |
| Typecheck after soft_complete_note sessionStorage | done | E2E phase2046 |
| e2e-all lists 2041–2048; gaps=3 | done | E2E phase2047 |
| Soft-complete STATUS through 2048 | done | E2E phase2048 |
| Honesty milestone 4500 + note | done | E2E phase2049 |
| Milestone 4500 on all honesty endpoints | done | E2E phase2050 |
| UI honesty milestone at 4500 | done | E2E phase2051 |
| STATUS milestone 4500 | done | E2E phase2052 |
| Soft marker 2056 | done | E2E phase2053 |
| Typecheck after milestone 4500 | done | E2E phase2054 |
| e2e-all lists 2049–2056; gaps=3 | done | E2E phase2055 |
| Soft-complete STATUS through 2056 | done | E2E phase2056 |
| soft_complete_note UI detail/restore note | done | E2E phase2057 |
| UI softCompleteNoteDetail expandable | done | E2E phase2058 |
| UI soft-complete note session restore wiring | done | E2E phase2059 |
| STATUS soft-complete note detail/restore | done | E2E phase2060 |
| Soft marker 2064 | done | E2E phase2061 |
| Typecheck after soft-complete note detail | done | E2E phase2062 |
| e2e-all lists 2057–2064; gaps=3 | done | E2E phase2063 |
| Soft-complete STATUS through 2064 | done | E2E phase2064 |
| Honesty milestone 4550 + note | done | E2E phase2065 |
| Milestone 4550 on all honesty endpoints | done | E2E phase2066 |
| UI honesty milestone at 4550 | done | E2E phase2067 |
| STATUS milestone 4550 | done | E2E phase2068 |
| Soft marker 2072 | done | E2E phase2069 |
| Typecheck after milestone 4550 | done | E2E phase2070 |
| e2e-all lists 2065–2072; gaps=3 | done | E2E phase2071 |
| Soft-complete STATUS through 2072 | done | E2E phase2072 |
| soft_fertig_honesty_surface_changelog API | done | E2E phase2073 |
| UI honesty surface changelog detail/download | done | E2E phase2074 |
| Client soft_fertig_honesty_surface_changelog type | done | E2E phase2075 |
| STATUS honesty surface changelog | done | E2E phase2076 |
| Soft marker 2080 | done | E2E phase2077 |
| Typecheck after honesty surface changelog | done | E2E phase2078 |
| e2e-all lists 2073–2080; gaps=3 | done | E2E phase2079 |
| Soft-complete STATUS through 2080 | done | E2E phase2080 |
| Honesty milestone 4600 + note | done | E2E phase2081 |
| Milestone 4600 on all honesty endpoints | done | E2E phase2082 |
| UI honesty milestone at 4600 | done | E2E phase2083 |
| STATUS milestone 4600 | done | E2E phase2084 |
| Soft marker 2088 | done | E2E phase2085 |
| Typecheck after milestone 4600 | done | E2E phase2086 |
| e2e-all lists 2081–2088; gaps=3 | done | E2E phase2087 |
| Soft-complete STATUS through 2088 | done | E2E phase2088 |
| surface_changelog in export/bundle catalogs | done | E2E phase2089 |
| UI surface_changelog bundle section | done | E2E phase2090 |
| Export/bundle notes mention surface_changelog | done | E2E phase2091 |
| STATUS surface_changelog export/bundle | done | E2E phase2092 |
| Soft marker 2096 | done | E2E phase2093 |
| Typecheck after surface_changelog export | done | E2E phase2094 |
| e2e-all lists 2089–2096; gaps=3 | done | E2E phase2095 |
| Soft-complete STATUS through 2096 | done | E2E phase2096 |
| Honesty milestone 4650 + note | done | E2E phase2097 |
| Milestone 4650 on all honesty endpoints | done | E2E phase2098 |
| UI honesty milestone at 4650 | done | E2E phase2099 |
| STATUS milestone 4650 | done | E2E phase2100 |
| Soft marker 2104 | done | E2E phase2101 |
| Typecheck after milestone 4650 | done | E2E phase2102 |
| e2e-all lists 2097–2104; gaps=3 | done | E2E phase2103 |
| Soft-complete STATUS through 2104 | done | E2E phase2104 |
| soft_fertig_honesty_surface_version 1.6 | done | E2E phase2105 |
| UI surface schema still shows version | done | E2E phase2106 |
| Client surface/changelog types | done | E2E phase2107 |
| STATUS schema 1.6 | done | E2E phase2108 |
| Soft marker 2112 | done | E2E phase2109 |
| Typecheck after schema 1.6 | done | E2E phase2110 |
| e2e-all lists 2105–2112; gaps=3 | done | E2E phase2111 |
| Soft-complete STATUS through 2112 | done | E2E phase2112 |
| Honesty milestone 4700 + note | done | E2E phase2113 |
| Milestone 4700 on all honesty endpoints | done | E2E phase2114 |
| UI honesty milestone at 4700 | done | E2E phase2115 |
| STATUS milestone 4700 | done | E2E phase2116 |
| Soft marker 2120 | done | E2E phase2117 |
| Typecheck after milestone 4700 | done | E2E phase2118 |
| e2e-all lists 2113–2120; gaps=3 | done | E2E phase2119 |
| Soft-complete STATUS through 2120 | done | E2E phase2120 |
| surface_changelog in sessionStorage + clear | done | E2E phase2121 |
| UI honestySurfaceChangelogStorageKey + clear/restore | done | E2E phase2122 |
| Export/bundle notes mention surface_changelog session | done | E2E phase2123 |
| STATUS surface_changelog sessionStorage | done | E2E phase2124 |
| Soft marker 2128 | done | E2E phase2125 |
| Typecheck after surface_changelog sessionStorage | done | E2E phase2126 |
| e2e-all lists 2121–2128; gaps=3 | done | E2E phase2127 |
| Soft-complete STATUS through 2128 | done | E2E phase2128 |
| Honesty milestone 4750 + note | done | E2E phase2129 |
| Milestone 4750 on all honesty endpoints | done | E2E phase2130 |
| UI honesty milestone at 4750 | done | E2E phase2131 |
| STATUS milestone 4750 | done | E2E phase2132 |
| Soft marker 2136 | done | E2E phase2133 |
| Typecheck after milestone 4750 | done | E2E phase2134 |
| e2e-all lists 2129–2136; gaps=3 | done | E2E phase2135 |
| Soft-complete STATUS through 2136 | done | E2E phase2136 |
| soft_fertig_honesty_operator_brief API | done | E2E phase2137 |
| UI honesty operator brief detail/download | done | E2E phase2138 |
| Client soft_fertig_honesty_operator_brief type | done | E2E phase2139 |
| STATUS honesty operator brief | done | E2E phase2140 |
| Soft marker 2144 | done | E2E phase2141 |
| Typecheck after honesty operator brief | done | E2E phase2142 |
| e2e-all lists 2137–2144; gaps=3 | done | E2E phase2143 |
| Soft-complete STATUS through 2144 | done | E2E phase2144 |
| Honesty milestone 4800 + note | done | E2E phase2145 |
| Milestone 4800 on all honesty endpoints | done | E2E phase2146 |
| UI honesty milestone at 4800 | done | E2E phase2147 |
| STATUS milestone 4800 | done | E2E phase2148 |
| Soft marker 2152 | done | E2E phase2149 |
| Typecheck after milestone 4800 | done | E2E phase2150 |
| e2e-all lists 2145–2152; gaps=3 | done | E2E phase2151 |
| Soft-complete STATUS through 2152 | done | E2E phase2152 |
| operator_brief in export/bundle catalogs | done | E2E phase2153 |
| UI operator_brief bundle section | done | E2E phase2154 |
| Export/bundle notes mention operator_brief | done | E2E phase2155 |
| STATUS operator_brief export/bundle | done | E2E phase2156 |
| Soft marker 2160 | done | E2E phase2157 |
| Typecheck after operator_brief export | done | E2E phase2158 |
| e2e-all lists 2153–2160; gaps=3 | done | E2E phase2159 |
| Soft-complete STATUS through 2160 | done | E2E phase2160 |
| Honesty milestone 4850 + note | done | E2E phase2161 |
| Milestone 4850 on all honesty endpoints | done | E2E phase2162 |
| UI honesty milestone at 4850 | done | E2E phase2163 |
| STATUS milestone 4850 | done | E2E phase2164 |
| Soft marker 2168 | done | E2E phase2165 |
| Typecheck after milestone 4850 | done | E2E phase2166 |
| e2e-all lists 2161–2168; gaps=3 | done | E2E phase2167 |
| Soft-complete STATUS through 2168 | done | E2E phase2168 |
| soft_fertig_honesty_surface_version 1.7 | done | E2E phase2169 |
| UI surface schema still shows version | done | E2E phase2170 |
| Client surface/operator brief types | done | E2E phase2171 |
| STATUS schema 1.7 | done | E2E phase2172 |
| Soft marker 2176 | done | E2E phase2173 |
| Typecheck after schema 1.7 | done | E2E phase2174 |
| e2e-all lists 2169–2176; gaps=3 | done | E2E phase2175 |
| Soft-complete STATUS through 2176 | done | E2E phase2176 |
| Honesty milestone 4900 + note | done | E2E phase2177 |
| Milestone 4900 on all honesty endpoints | done | E2E phase2178 |
| UI honesty milestone at 4900 | done | E2E phase2179 |
| STATUS milestone 4900 | done | E2E phase2180 |
| Soft marker 2184 | done | E2E phase2181 |
| Typecheck after milestone 4900 | done | E2E phase2182 |
| e2e-all lists 2177–2184; gaps=3 | done | E2E phase2183 |
| Soft-complete STATUS through 2184 | done | E2E phase2184 |
| operator_brief in sessionStorage + clear | done | E2E phase2185 |
| UI honestyOperatorBriefStorageKey + clear/restore | done | E2E phase2186 |
| Export/bundle notes mention operator_brief session | done | E2E phase2187 |
| STATUS operator_brief sessionStorage | done | E2E phase2188 |
| Soft marker 2192 | done | E2E phase2189 |
| Typecheck after operator_brief sessionStorage | done | E2E phase2190 |
| e2e-all lists 2185–2192; gaps=3 | done | E2E phase2191 |
| Soft-complete STATUS through 2192 | done | E2E phase2192 |
| Honesty milestone 4950 + note | done | E2E phase2193 |
| Milestone 4950 on all honesty endpoints | done | E2E phase2194 |
| UI honesty milestone at 4950 | done | E2E phase2195 |
| STATUS milestone 4950 | done | E2E phase2196 |
| Soft marker 2200 | done | E2E phase2197 |
| Typecheck after milestone 4950 | done | E2E phase2198 |
| e2e-all lists 2193–2200; gaps=3 | done | E2E phase2199 |
| Soft-complete STATUS through 2200 | done | E2E phase2200 |
| Soft 2200+ honesty surface still complete | done | E2E phase2201 |
| UI Soft 2200+ operator brief still wired | done | E2E phase2202 |
| Client Soft 2200+ honesty types | done | E2E phase2203 |
| STATUS Soft 2200+ / 2201–2208 | done | E2E phase2204 |
| Soft marker 2208 | done | E2E phase2205 |
| Typecheck after Soft 2200+ checkpoint | done | E2E phase2206 |
| e2e-all lists 2201–2208; gaps=3 | done | E2E phase2207 |
| Soft-complete STATUS through 2208 | done | E2E phase2208 |
| Honesty milestone 5000 + note | done | E2E phase2209 |
| Milestone 5000 on all honesty endpoints | done | E2E phase2210 |
| UI honesty milestone at 5000 | done | E2E phase2211 |
| STATUS milestone 5000 | done | E2E phase2212 |
| Soft marker 2216 | done | E2E phase2213 |
| Typecheck after milestone 5000 | done | E2E phase2214 |
| e2e-all lists 2209–2216; gaps=3 | done | E2E phase2215 |
| Soft-complete STATUS through 2216 | done | E2E phase2216 |
| soft_fertig_hard_gap_roster API | done | E2E phase2217 |
| UI hard-gap roster detail/download | done | E2E phase2218 |
| Client soft_fertig_hard_gap_roster type | done | E2E phase2219 |
| STATUS hard-gap roster | done | E2E phase2220 |
| Soft marker 2224 | done | E2E phase2221 |
| Typecheck after hard-gap roster | done | E2E phase2222 |
| e2e-all lists 2217–2224; gaps=3 | done | E2E phase2223 |
| Soft-complete STATUS through 2224 | done | E2E phase2224 |
| Honesty milestone 5050 + note | done | E2E phase2225 |
| Milestone 5050 on all honesty endpoints | done | E2E phase2226 |
| UI honesty milestone at 5050 | done | E2E phase2227 |
| STATUS milestone 5050 | done | E2E phase2228 |
| Soft marker 2232 | done | E2E phase2229 |
| Typecheck after milestone 5050 | done | E2E phase2230 |
| e2e-all lists 2225–2232; gaps=3 | done | E2E phase2231 |
| Soft-complete STATUS through 2232 | done | E2E phase2232 |
| hard_gap_roster in honesty export/bundle | done | E2E phase2233 |
| UI honesty bundle hard_gap_roster section | done | E2E phase2234 |
| Export/bundle titles/notes for hard_gap_roster | done | E2E phase2235 |
| STATUS hard_gap_roster export | done | E2E phase2236 |
| Soft marker 2240 | done | E2E phase2237 |
| Typecheck after hard_gap_roster export | done | E2E phase2238 |
| e2e-all lists 2233–2240; gaps=3 | done | E2E phase2239 |
| Soft-complete STATUS through 2240 | done | E2E phase2240 |
| Honesty milestone 5100 + note | done | E2E phase2241 |
| Milestone 5100 on all honesty endpoints | done | E2E phase2242 |
| UI honesty milestone at 5100 | done | E2E phase2243 |
| STATUS milestone 5100 | done | E2E phase2244 |
| Soft marker 2248 | done | E2E phase2245 |
| Typecheck after milestone 5100 | done | E2E phase2246 |
| e2e-all lists 2241–2248; gaps=3 | done | E2E phase2247 |
| Soft-complete STATUS through 2248 | done | E2E phase2248 |
| Honesty surface schema 1.8 (hard_gap_roster) | done | E2E phase2249 |
| UI surface schema still shows version | done | E2E phase2250 |
| Client surface + hard_gap_roster types | done | E2E phase2251 |
| STATUS schema 1.8 | done | E2E phase2252 |
| Soft marker 2256 | done | E2E phase2253 |
| Typecheck after schema 1.8 | done | E2E phase2254 |
| e2e-all lists 2249–2256; gaps=3 | done | E2E phase2255 |
| Soft-complete STATUS through 2256 | done | E2E phase2256 |
| Honesty milestone 5150 + note | done | E2E phase2257 |
| Milestone 5150 on all honesty endpoints | done | E2E phase2258 |
| UI honesty milestone at 5150 | done | E2E phase2259 |
| STATUS milestone 5150 | done | E2E phase2260 |
| Soft marker 2264 | done | E2E phase2261 |
| Typecheck after milestone 5150 | done | E2E phase2262 |
| e2e-all lists 2257–2264; gaps=3 | done | E2E phase2263 |
| Soft-complete STATUS through 2264 | done | E2E phase2264 |
| hard_gap_roster in sessionStorage/Clear | done | E2E phase2265 |
| UI hard_gap_roster sessionStorage persist | done | E2E phase2266 |
| Clear catalogs includes hard-gap roster | done | E2E phase2267 |
| STATUS hard_gap_roster sessionStorage | done | E2E phase2268 |
| Soft marker 2272 | done | E2E phase2269 |
| Typecheck after hard_gap_roster sessionStorage | done | E2E phase2270 |
| e2e-all lists 2265–2272; gaps=3 | done | E2E phase2271 |
| Soft-complete STATUS through 2272 | done | E2E phase2272 |
| Honesty milestone 5200 + note | done | E2E phase2273 |
| Milestone 5200 on all honesty endpoints | done | E2E phase2274 |
| UI honesty milestone at 5200 | done | E2E phase2275 |
| STATUS milestone 5200 | done | E2E phase2276 |
| Soft marker 2280 | done | E2E phase2277 |
| Typecheck after milestone 5200 | done | E2E phase2278 |
| e2e-all lists 2273–2280; gaps=3 | done | E2E phase2279 |
| Soft-complete STATUS through 2280 | done | E2E phase2280 |
| Soft 2280+ honesty surface checkpoint | done | E2E phase2281 |
| UI Soft 2280+ hard-gap roster | done | E2E phase2282 |
| Client Soft 2280+ hard_gap_roster type | done | E2E phase2283 |
| STATUS Soft 2280+ Checkpoint | done | E2E phase2284 |
| Soft marker 2288 | done | E2E phase2285 |
| Typecheck after Soft 2280+ | done | E2E phase2286 |
| e2e-all lists 2281–2288; gaps=3 | done | E2E phase2287 |
| Soft-complete STATUS through 2288 | done | E2E phase2288 |
| Honesty milestone 5250 + note | done | E2E phase2289 |
| Milestone 5250 on all honesty endpoints | done | E2E phase2290 |
| UI honesty milestone at 5250 | done | E2E phase2291 |
| STATUS milestone 5250 | done | E2E phase2292 |
| Soft marker 2296 | done | E2E phase2293 |
| Typecheck after milestone 5250 | done | E2E phase2294 |
| e2e-all lists 2289–2296; gaps=3 | done | E2E phase2295 |
| Soft-complete STATUS through 2296 | done | E2E phase2296 |
| soft_fertig_hard_gap_refusal_roster API | done | E2E phase2297 |
| UI hard-gap refusal roster detail/download | done | E2E phase2298 |
| Client soft_fertig_hard_gap_refusal_roster type | done | E2E phase2299 |
| STATUS hard-gap refusal roster | done | E2E phase2300 |
| Soft marker 2304 | done | E2E phase2301 |
| Typecheck after hard-gap refusal roster | done | E2E phase2302 |
| e2e-all lists 2297–2304; gaps=3 | done | E2E phase2303 |
| Soft-complete STATUS through 2304 | done | E2E phase2304 |
| Honesty milestone 5300 + note | done | E2E phase2305 |
| Milestone 5300 on all honesty endpoints | done | E2E phase2306 |
| UI honesty milestone at 5300 | done | E2E phase2307 |
| STATUS milestone 5300 | done | E2E phase2308 |
| Soft marker 2312 | done | E2E phase2309 |
| Typecheck after milestone 5300 | done | E2E phase2310 |
| e2e-all lists 2305–2312; gaps=3 | done | E2E phase2311 |
| Soft-complete STATUS through 2312 | done | E2E phase2312 |
| hard_gap_refusal_roster in honesty export/bundle | done | E2E phase2313 |
| UI honesty bundle hard_gap_refusal_roster section | done | E2E phase2314 |
| Export/bundle titles/notes for hard_gap_refusal_roster | done | E2E phase2315 |
| STATUS hard_gap_refusal_roster export | done | E2E phase2316 |
| Soft marker 2320 | done | E2E phase2317 |
| Typecheck after hard_gap_refusal_roster export | done | E2E phase2318 |
| e2e-all lists 2313–2320; gaps=3 | done | E2E phase2319 |
| Soft-complete STATUS through 2320 | done | E2E phase2320 |
| Honesty milestone 5350 + note | done | E2E phase2321 |
| Milestone 5350 on all honesty endpoints | done | E2E phase2322 |
| UI honesty milestone at 5350 | done | E2E phase2323 |
| STATUS milestone 5350 | done | E2E phase2324 |
| Soft marker 2328 | done | E2E phase2325 |
| Typecheck after milestone 5350 | done | E2E phase2326 |
| e2e-all lists 2321–2328; gaps=3 | done | E2E phase2327 |
| Soft-complete STATUS through 2328 | done | E2E phase2328 |
| Honesty surface schema 1.9 (hard_gap_refusal_roster) | done | E2E phase2329 |
| UI surface schema still shows version | done | E2E phase2330 |
| Client surface + hard_gap_refusal_roster types | done | E2E phase2331 |
| STATUS schema 1.9 | done | E2E phase2332 |
| Soft marker 2336 | done | E2E phase2333 |
| Typecheck after schema 1.9 | done | E2E phase2334 |
| e2e-all lists 2329–2336; gaps=3 | done | E2E phase2335 |
| Soft-complete STATUS through 2336 | done | E2E phase2336 |
| Honesty milestone 5400 + note | done | E2E phase2337 |
| Milestone 5400 on all honesty endpoints | done | E2E phase2338 |
| UI honesty milestone at 5400 | done | E2E phase2339 |
| STATUS milestone 5400 | done | E2E phase2340 |
| Soft marker 2344 | done | E2E phase2341 |
| Typecheck after milestone 5400 | done | E2E phase2342 |
| e2e-all lists 2337–2344; gaps=3 | done | E2E phase2343 |
| Soft-complete STATUS through 2344 | done | E2E phase2344 |
| hard_gap_refusal_roster in sessionStorage/Clear | done | E2E phase2345 |
| UI hard_gap_refusal_roster sessionStorage persist | done | E2E phase2346 |
| Clear catalogs includes hard-gap refusal roster | done | E2E phase2347 |
| STATUS hard_gap_refusal_roster sessionStorage | done | E2E phase2348 |
| Soft marker 2352 | done | E2E phase2349 |
| Typecheck after hard_gap_refusal_roster sessionStorage | done | E2E phase2350 |
| e2e-all lists 2345–2352; gaps=3 | done | E2E phase2351 |
| Soft-complete STATUS through 2352 | done | E2E phase2352 |
| Honesty milestone 5450 + note | done | E2E phase2353 |
| Milestone 5450 on all honesty endpoints | done | E2E phase2354 |
| UI honesty milestone at 5450 | done | E2E phase2355 |
| STATUS milestone 5450 | done | E2E phase2356 |
| Soft marker 2360 | done | E2E phase2357 |
| Typecheck after milestone 5450 | done | E2E phase2358 |
| e2e-all lists 2353–2360; gaps=3 | done | E2E phase2359 |
| Soft-complete STATUS through 2360 | done | E2E phase2360 |
| Soft 2360+ honesty surface checkpoint | done | E2E phase2361 |
| UI Soft 2360+ hard-gap refusal roster | done | E2E phase2362 |
| Client Soft 2360+ hard_gap_refusal_roster type | done | E2E phase2363 |
| STATUS Soft 2360+ Checkpoint | done | E2E phase2364 |
| Soft marker 2368 | done | E2E phase2365 |
| Typecheck after Soft 2360+ | done | E2E phase2366 |
| e2e-all lists 2361–2368; gaps=3 | done | E2E phase2367 |
| Soft-complete STATUS through 2368 | done | E2E phase2368 |
| Honesty milestone 5500 + note | done | E2E phase2369 |
| Milestone 5500 on all honesty endpoints | done | E2E phase2370 |
| UI honesty milestone at 5500 | done | E2E phase2371 |
| STATUS milestone 5500 | done | E2E phase2372 |
| Soft marker 2376 | done | E2E phase2373 |
| Typecheck after milestone 5500 | done | E2E phase2374 |
| e2e-all lists 2369–2376; gaps=3 | done | E2E phase2375 |
| Soft-complete STATUS through 2376 | done | E2E phase2376 |
| soft_fertig_honesty_path_roster API | done | E2E phase2377 |
| UI honesty path roster detail/download | done | E2E phase2378 |
| Client soft_fertig_honesty_path_roster type | done | E2E phase2379 |
| STATUS honesty path roster | done | E2E phase2380 |
| Soft marker 2384 | done | E2E phase2381 |
| Typecheck after honesty path roster | done | E2E phase2382 |
| e2e-all lists 2377–2384; gaps=3 | done | E2E phase2383 |
| Soft-complete STATUS through 2384 | done | E2E phase2384 |
| Honesty milestone 5550 + note | done | E2E phase2385 |
| Milestone 5550 on all honesty endpoints | done | E2E phase2386 |
| UI honesty milestone at 5550 | done | E2E phase2387 |
| STATUS milestone 5550 | done | E2E phase2388 |
| Soft marker 2392 | done | E2E phase2389 |
| Typecheck after milestone 5550 | done | E2E phase2390 |
| e2e-all lists 2385–2392; gaps=3 | done | E2E phase2391 |
| Soft-complete STATUS through 2392 | done | E2E phase2392 |
| honesty_path_roster in honesty export/bundle | done | E2E phase2393 |
| UI honesty bundle honesty_path_roster section | done | E2E phase2394 |
| Export/bundle titles/notes for honesty_path_roster | done | E2E phase2395 |
| STATUS honesty_path_roster export | done | E2E phase2396 |
| Soft marker 2400 | done | E2E phase2397 |
| Typecheck after honesty_path_roster export | done | E2E phase2398 |
| e2e-all lists 2393–2400; gaps=3 | done | E2E phase2399 |
| Soft-complete STATUS through 2400 | done | E2E phase2400 |
| Honesty milestone 5600 + note | done | E2E phase2401 |
| Milestone 5600 on all honesty endpoints | done | E2E phase2402 |
| UI honesty milestone at 5600 | done | E2E phase2403 |
| STATUS milestone 5600 | done | E2E phase2404 |
| Soft marker 2408 | done | E2E phase2405 |
| Typecheck after milestone 5600 | done | E2E phase2406 |
| e2e-all lists 2401–2408; gaps=3 | done | E2E phase2407 |
| Soft-complete STATUS through 2408 | done | E2E phase2408 |
| Honesty surface schema 2.0 (honesty_path_roster) | done | E2E phase2409 |
| UI surface schema still shows version | done | E2E phase2410 |
| Client surface + honesty_path_roster types | done | E2E phase2411 |
| STATUS schema 2.0 | done | E2E phase2412 |
| Soft marker 2416 | done | E2E phase2413 |
| Typecheck after schema 2.0 | done | E2E phase2414 |
| e2e-all lists 2409–2416; gaps=3 | done | E2E phase2415 |
| Soft-complete STATUS through 2416 | done | E2E phase2416 |
| Honesty milestone 5650 + note | done | E2E phase2417 |
| Milestone 5650 on all honesty endpoints | done | E2E phase2418 |
| UI honesty milestone at 5650 | done | E2E phase2419 |
| STATUS milestone 5650 | done | E2E phase2420 |
| Soft marker 2424 | done | E2E phase2421 |
| Typecheck after milestone 5650 | done | E2E phase2422 |
| e2e-all lists 2417–2424; gaps=3 | done | E2E phase2423 |
| Soft-complete STATUS through 2424 | done | E2E phase2424 |
| honesty_path_roster in sessionStorage/Clear | done | E2E phase2425 |
| UI honesty_path_roster sessionStorage persist | done | E2E phase2426 |
| Clear catalogs includes honesty path roster | done | E2E phase2427 |
| STATUS honesty_path_roster sessionStorage | done | E2E phase2428 |
| Soft marker 2432 | done | E2E phase2429 |
| Typecheck after honesty_path_roster sessionStorage | done | E2E phase2430 |
| e2e-all lists 2425–2432; gaps=3 | done | E2E phase2431 |
| Soft-complete STATUS through 2432 | done | E2E phase2432 |
| Honesty milestone 5700 + note | done | E2E phase2433 |
| Milestone 5700 on all honesty endpoints | done | E2E phase2434 |
| UI honesty milestone at 5700 | done | E2E phase2435 |
| STATUS milestone 5700 | done | E2E phase2436 |
| Soft marker 2440 | done | E2E phase2437 |
| Typecheck after milestone 5700 | done | E2E phase2438 |
| e2e-all lists 2433–2440; gaps=3 | done | E2E phase2439 |
| Soft-complete STATUS through 2440 | done | E2E phase2440 |
| Soft 2440+ honesty surface checkpoint | done | E2E phase2441 |
| UI Soft 2440+ honesty path roster | done | E2E phase2442 |
| Client Soft 2440+ honesty_path_roster type | done | E2E phase2443 |
| STATUS Soft 2440+ Checkpoint | done | E2E phase2444 |
| Soft marker 2448 | done | E2E phase2445 |
| Typecheck after Soft 2440+ | done | E2E phase2446 |
| e2e-all lists 2441–2448; gaps=3 | done | E2E phase2447 |
| Soft-complete STATUS through 2448 | done | E2E phase2448 |
| Honesty milestone 5750 + note | done | E2E phase2449 |
| Milestone 5750 on all honesty endpoints | done | E2E phase2450 |
| UI honesty milestone at 5750 | done | E2E phase2451 |
| STATUS milestone 5750 | done | E2E phase2452 |
| Soft marker 2456 | done | E2E phase2453 |
| Typecheck after milestone 5750 | done | E2E phase2454 |
| e2e-all lists 2449–2456; gaps=3 | done | E2E phase2455 |
| Soft-complete STATUS through 2456 | done | E2E phase2456 |
| soft_fertig_session_storage_roster API | done | E2E phase2457 |
| UI sessionStorage roster detail/download | done | E2E phase2458 |
| Client soft_fertig_session_storage_roster type | done | E2E phase2459 |
| STATUS sessionStorage roster | done | E2E phase2460 |
| Soft marker 2464 | done | E2E phase2461 |
| Typecheck after sessionStorage roster | done | E2E phase2462 |
| e2e-all lists 2457–2464; gaps=3 | done | E2E phase2463 |
| Soft-complete STATUS through 2464 | done | E2E phase2464 |
| Honesty milestone 5800 + note | done | E2E phase2465 |
| Milestone 5800 on all honesty endpoints | done | E2E phase2466 |
| UI honesty milestone at 5800 | done | E2E phase2467 |
| STATUS milestone 5800 | done | E2E phase2468 |
| Soft marker 2472 | done | E2E phase2469 |
| Typecheck after milestone 5800 | done | E2E phase2470 |
| e2e-all lists 2465–2472; gaps=3 | done | E2E phase2471 |
| Soft-complete STATUS through 2472 | done | E2E phase2472 |
| session_storage_roster in honesty export/bundle | done | E2E phase2473 |
| UI honesty bundle session_storage_roster section | done | E2E phase2474 |
| Export titles/notes session_storage_roster | done | E2E phase2475 |
| STATUS session_storage_roster export | done | E2E phase2476 |
| Soft marker 2480 | done | E2E phase2477 |
| Typecheck after session_storage_roster export | done | E2E phase2478 |
| e2e-all lists 2473–2480; gaps=3 | done | E2E phase2479 |
| Soft-complete STATUS through 2480 | done | E2E phase2480 |
| Honesty milestone 5850 + note | done | E2E phase2481 |
| Milestone 5850 on all honesty endpoints | done | E2E phase2482 |
| UI honesty milestone at 5850 | done | E2E phase2483 |
| STATUS milestone 5850 | done | E2E phase2484 |
| Soft marker 2488 | done | E2E phase2485 |
| Typecheck after milestone 5850 | done | E2E phase2486 |
| e2e-all lists 2481–2488; gaps=3 | done | E2E phase2487 |
| Soft-complete STATUS through 2488 | done | E2E phase2488 |
| Honesty surface schema 2.1 | done | E2E phase2489 |
| UI surface schema 2.1 | done | E2E phase2490 |
| Client surface version type unchanged | done | E2E phase2491 |
| STATUS schema 2.1 | done | E2E phase2492 |
| Soft marker 2496 | done | E2E phase2493 |
| Typecheck after schema 2.1 | done | E2E phase2494 |
| e2e-all lists 2489–2496; gaps=3 | done | E2E phase2495 |
| Soft-complete STATUS through 2496 | done | E2E phase2496 |
| Honesty milestone 5900 + note | done | E2E phase2497 |
| Milestone 5900 on all honesty endpoints | done | E2E phase2498 |
| UI honesty milestone at 5900 | done | E2E phase2499 |
| STATUS milestone 5900 | done | E2E phase2500 |
| Soft marker 2504 | done | E2E phase2501 |
| Typecheck after milestone 5900 | done | E2E phase2502 |
| e2e-all lists 2497–2504; gaps=3 | done | E2E phase2503 |
| Soft-complete STATUS through 2504 | done | E2E phase2504 |
| session_storage_roster in sessionStorage/clear | done | E2E phase2505 |
| UI sessionStorage roster persist/restore/clear | done | E2E phase2506 |
| Clear title mentions sessionStorage roster | done | E2E phase2507 |
| STATUS session_storage_roster session | done | E2E phase2508 |
| Soft marker 2512 | done | E2E phase2509 |
| Typecheck after session_storage_roster session | done | E2E phase2510 |
| e2e-all lists 2505–2512; gaps=3 | done | E2E phase2511 |
| Soft-complete STATUS through 2512 | done | E2E phase2512 |
| Honesty milestone 5950 + note | done | E2E phase2513 |
| Milestone 5950 on all honesty endpoints | done | E2E phase2514 |
| UI honesty milestone at 5950 | done | E2E phase2515 |
| STATUS milestone 5950 | done | E2E phase2516 |
| Soft marker 2520 | done | E2E phase2517 |
| Typecheck after milestone 5950 | done | E2E phase2518 |
| e2e-all lists 2513–2520; gaps=3 | done | E2E phase2519 |
| Soft-complete STATUS through 2520 | done | E2E phase2520 |
| Soft 2520+ honesty surface checkpoint | done | E2E phase2521 |
| UI Soft 2520+ surface still wired | done | E2E phase2522 |
| Client Soft 2520+ types | done | E2E phase2523 |
| STATUS Soft 2520+ checkpoint | done | E2E phase2524 |
| Soft marker 2528 | done | E2E phase2525 |
| Typecheck after Soft 2520+ | done | E2E phase2526 |
| e2e-all lists 2521–2528; gaps=3 | done | E2E phase2527 |
| Soft-complete STATUS through 2528 | done | E2E phase2528 |
| Honesty milestone 6000 + note | done | E2E phase2529 |
| Milestone 6000 on all honesty endpoints | done | E2E phase2530 |
| UI honesty milestone at 6000 | done | E2E phase2531 |
| STATUS milestone 6000 | done | E2E phase2532 |
| Soft marker 2536 | done | E2E phase2533 |
| Typecheck after milestone 6000 | done | E2E phase2534 |
| e2e-all lists 2529–2536; gaps=3 | done | E2E phase2535 |
| Soft-complete STATUS through 2536 | done | E2E phase2536 |
| soft_fertig_honesty_export_roster API | done | E2E phase2537 |
| UI honesty export roster detail/download | done | E2E phase2538 |
| Client soft_fertig_honesty_export_roster type | done | E2E phase2539 |
| STATUS honesty export roster | done | E2E phase2540 |
| Soft marker 2544 | done | E2E phase2541 |
| Typecheck after honesty export roster | done | E2E phase2542 |
| e2e-all lists 2537–2544; gaps=3 | done | E2E phase2543 |
| Soft-complete STATUS through 2544 | done | E2E phase2544 |
| Honesty milestone 6050 + note | done | E2E phase2545 |
| Milestone 6050 on all honesty endpoints | done | E2E phase2546 |
| UI honesty milestone at 6050 | done | E2E phase2547 |
| STATUS milestone 6050 | done | E2E phase2548 |
| Soft marker 2552 | done | E2E phase2549 |
| Typecheck after milestone 6050 | done | E2E phase2550 |
| e2e-all lists 2545–2552; gaps=3 | done | E2E phase2551 |
| Soft-complete STATUS through 2552 | done | E2E phase2552 |
| honesty_export_roster in honesty export/bundle | done | E2E phase2553 |
| UI honesty bundle honesty_export_roster section | done | E2E phase2554 |
| Export titles/notes honesty_export_roster | done | E2E phase2555 |
| STATUS honesty_export_roster export | done | E2E phase2556 |
| Soft marker 2560 | done | E2E phase2557 |
| Typecheck after honesty_export_roster export | done | E2E phase2558 |
| e2e-all lists 2553–2560; gaps=3 | done | E2E phase2559 |
| Soft-complete STATUS through 2560 | done | E2E phase2560 |
| Honesty milestone 6100 + note | done | E2E phase2561 |
| Milestone 6100 on all honesty endpoints | done | E2E phase2562 |
| UI honesty milestone at 6100 | done | E2E phase2563 |
| STATUS milestone 6100 | done | E2E phase2564 |
| Soft marker 2568 | done | E2E phase2565 |
| Typecheck after milestone 6100 | done | E2E phase2566 |
| e2e-all lists 2561–2568; gaps=3 | done | E2E phase2567 |
| Soft-complete STATUS through 2568 | done | E2E phase2568 |
| Honesty surface schema 2.2 | done | E2E phase2569 |
| UI surface schema 2.2 | done | E2E phase2570 |
| Client surface version type unchanged | done | E2E phase2571 |
| STATUS schema 2.2 | done | E2E phase2572 |
| Soft marker 2576 | done | E2E phase2573 |
| Typecheck after schema 2.2 | done | E2E phase2574 |
| e2e-all lists 2569–2576; gaps=3 | done | E2E phase2575 |
| Soft-complete STATUS through 2576 | done | E2E phase2576 |
| Honesty milestone 6150 + note | done | E2E phase2577 |
| Milestone 6150 on all honesty endpoints | done | E2E phase2578 |
| UI honesty milestone at 6150 | done | E2E phase2579 |
| STATUS milestone 6150 | done | E2E phase2580 |
| Soft marker 2584 | done | E2E phase2581 |
| Typecheck after milestone 6150 | done | E2E phase2582 |
| e2e-all lists 2577–2584; gaps=3 | done | E2E phase2583 |
| Soft-complete STATUS through 2584 | done | E2E phase2584 |
| honesty_export_roster in sessionStorage/clear | done | E2E phase2585 |
| UI honesty export roster persist/restore/clear | done | E2E phase2586 |
| Clear title mentions honesty export roster | done | E2E phase2587 |
| STATUS honesty_export_roster session | done | E2E phase2588 |
| Soft marker 2592 | done | E2E phase2589 |
| Typecheck after honesty_export_roster session | done | E2E phase2590 |
| e2e-all lists 2585–2592; gaps=3 | done | E2E phase2591 |
| Soft-complete STATUS through 2592 | done | E2E phase2592 |
| Honesty milestone 6200 + note | done | E2E phase2593 |
| Milestone 6200 on all honesty endpoints | done | E2E phase2594 |
| UI honesty milestone at 6200 | done | E2E phase2595 |
| STATUS milestone 6200 | done | E2E phase2596 |
| Soft marker 2600 | done | E2E phase2597 |
| Typecheck after milestone 6200 | done | E2E phase2598 |
| e2e-all lists 2593–2600; gaps=3 | done | E2E phase2599 |
| Soft-complete STATUS through 2600 | done | E2E phase2600 |
| Soft 2600+ honesty surface checkpoint | done | E2E phase2601 |
| UI Soft 2600+ surface still wired | done | E2E phase2602 |
| Client Soft 2600+ types | done | E2E phase2603 |
| STATUS Soft 2600+ checkpoint | done | E2E phase2604 |
| Soft marker 2608 | done | E2E phase2605 |
| Typecheck after Soft 2600+ | done | E2E phase2606 |
| e2e-all lists 2601–2608; gaps=3 | done | E2E phase2607 |
| Soft-complete STATUS through 2608 | done | E2E phase2608 |
| Honesty milestone 6250 + note | done | E2E phase2609 |
| Milestone 6250 on all honesty endpoints | done | E2E phase2610 |
| UI honesty milestone at 6250 | done | E2E phase2611 |
| STATUS milestone 6250 | done | E2E phase2612 |
| Soft marker 2616 | done | E2E phase2613 |
| Typecheck after milestone 6250 | done | E2E phase2614 |
| e2e-all lists 2609–2616; gaps=3 | done | E2E phase2615 |
| Soft-complete STATUS through 2616 | done | E2E phase2616 |
| soft_fertig_honesty_bundle_roster API | done | E2E phase2617 |
| UI honesty bundle roster detail/download | done | E2E phase2618 |
| Client soft_fertig_honesty_bundle_roster type | done | E2E phase2619 |
| STATUS honesty bundle roster | done | E2E phase2620 |
| Soft marker 2624 | done | E2E phase2621 |
| Typecheck after honesty bundle roster | done | E2E phase2622 |
| e2e-all lists 2617–2624; gaps=3 | done | E2E phase2623 |
| Soft-complete STATUS through 2624 | done | E2E phase2624 |
| Honesty milestone 6300 + note | done | E2E phase2625 |
| Milestone 6300 on all honesty endpoints | done | E2E phase2626 |
| UI honesty milestone at 6300 | done | E2E phase2627 |
| STATUS milestone 6300 | done | E2E phase2628 |
| Soft marker 2632 | done | E2E phase2629 |
| Typecheck after milestone 6300 | done | E2E phase2630 |
| e2e-all lists 2625–2632; gaps=3 | done | E2E phase2631 |
| Soft-complete STATUS through 2632 | done | E2E phase2632 |
| honesty_bundle_roster in honesty export/bundle | done | E2E phase2633 |
| UI honesty bundle honesty_bundle_roster section | done | E2E phase2634 |
| Export titles/notes honesty_bundle_roster | done | E2E phase2635 |
| STATUS honesty_bundle_roster export | done | E2E phase2636 |
| Soft marker 2640 | done | E2E phase2637 |
| Typecheck after honesty_bundle_roster export | done | E2E phase2638 |
| e2e-all lists 2633–2640; gaps=3 | done | E2E phase2639 |
| Soft-complete STATUS through 2640 | done | E2E phase2640 |
| Honesty milestone 6350 + note | done | E2E phase2641 |
| Milestone 6350 on all honesty endpoints | done | E2E phase2642 |
| UI honesty milestone at 6350 | done | E2E phase2643 |
| STATUS milestone 6350 | done | E2E phase2644 |
| Soft marker 2648 | done | E2E phase2645 |
| Typecheck after milestone 6350 | done | E2E phase2646 |
| e2e-all lists 2641–2648; gaps=3 | done | E2E phase2647 |
| Soft-complete STATUS through 2648 | done | E2E phase2648 |
| Honesty surface schema 2.3 | done | E2E phase2649 |
| UI surface schema 2.3 | done | E2E phase2650 |
| Client surface version type unchanged | done | E2E phase2651 |
| STATUS schema 2.3 | done | E2E phase2652 |
| Soft marker 2656 | done | E2E phase2653 |
| Typecheck after schema 2.3 | done | E2E phase2654 |
| e2e-all lists 2649–2656; gaps=3 | done | E2E phase2655 |
| Soft-complete STATUS through 2656 | done | E2E phase2656 |
| Honesty milestone 6400 + note | done | E2E phase2657 |
| Milestone 6400 on all honesty endpoints | done | E2E phase2658 |
| UI honesty milestone at 6400 | done | E2E phase2659 |
| STATUS milestone 6400 | done | E2E phase2660 |
| Soft marker 2664 | done | E2E phase2661 |
| Typecheck after milestone 6400 | done | E2E phase2662 |
| e2e-all lists 2657–2664; gaps=3 | done | E2E phase2663 |
| Soft-complete STATUS through 2664 | done | E2E phase2664 |
| honesty_bundle_roster in sessionStorage/clear | done | E2E phase2665 |
| UI honesty bundle roster persist/restore/clear | done | E2E phase2666 |
| Clear title mentions honesty bundle roster | done | E2E phase2667 |
| STATUS honesty_bundle_roster session | done | E2E phase2668 |
| Soft marker 2672 | done | E2E phase2669 |
| Typecheck after honesty_bundle_roster session | done | E2E phase2670 |
| e2e-all lists 2665–2672; gaps=3 | done | E2E phase2671 |
| Soft-complete STATUS through 2672 | done | E2E phase2672 |
| Honesty milestone 6450 + note | done | E2E phase2673 |
| Milestone 6450 on all honesty endpoints | done | E2E phase2674 |
| UI honesty milestone at 6450 | done | E2E phase2675 |
| STATUS milestone 6450 | done | E2E phase2676 |
| Soft marker 2680 | done | E2E phase2677 |
| Typecheck after milestone 6450 | done | E2E phase2678 |
| e2e-all lists 2673–2680; gaps=3 | done | E2E phase2679 |
| Soft-complete STATUS through 2680 | done | E2E phase2680 |
| Soft 2680+ honesty surface checkpoint | done | E2E phase2681 |
| UI Soft 2680+ surface still wired | done | E2E phase2682 |
| Client Soft 2680+ types | done | E2E phase2683 |
| STATUS Soft 2680+ checkpoint | done | E2E phase2684 |
| Soft marker 2688 | done | E2E phase2685 |
| Typecheck after Soft 2680+ | done | E2E phase2686 |
| e2e-all lists 2681–2688; gaps=3 | done | E2E phase2687 |
| Soft-complete STATUS through 2688 | done | E2E phase2688 |
| Honesty milestone 6500 + note | done | E2E phase2689 |
| Milestone 6500 on all honesty endpoints | done | E2E phase2690 |
| UI honesty milestone at 6500 | done | E2E phase2691 |
| STATUS milestone 6500 | done | E2E phase2692 |
| Soft marker 2696 | done | E2E phase2693 |
| Typecheck after milestone 6500 | done | E2E phase2694 |
| e2e-all lists 2689–2696; gaps=3 | done | E2E phase2695 |
| Soft-complete STATUS through 2696 | done | E2E phase2696 |
| soft_fertig_surface_roster API | done | E2E phase2697 |
| UI surface roster detail/download | done | E2E phase2698 |
| Client soft_fertig_surface_roster type | done | E2E phase2699 |
| STATUS surface roster | done | E2E phase2700 |
| Soft marker 2704 | done | E2E phase2701 |
| Typecheck after surface roster | done | E2E phase2702 |
| e2e-all lists 2697–2704; gaps=3 | done | E2E phase2703 |
| Soft-complete STATUS through 2704 | done | E2E phase2704 |
| Honesty milestone 6550 + note | done | E2E phase2705 |
| Milestone 6550 on all honesty endpoints | done | E2E phase2706 |
| UI honesty milestone at 6550 | done | E2E phase2707 |
| STATUS milestone 6550 | done | E2E phase2708 |
| Soft marker 2712 | done | E2E phase2709 |
| Typecheck after milestone 6550 | done | E2E phase2710 |
| e2e-all lists 2705–2712; gaps=3 | done | E2E phase2711 |
| Soft-complete STATUS through 2712 | done | E2E phase2712 |
| surface_roster in honesty export/bundle | done | E2E phase2713 |
| UI honesty bundle surface_roster section | done | E2E phase2714 |
| Export titles/notes surface_roster | done | E2E phase2715 |
| STATUS surface_roster export | done | E2E phase2716 |
| Soft marker 2720 | done | E2E phase2717 |
| Typecheck after surface_roster export | done | E2E phase2718 |
| e2e-all lists 2713–2720; gaps=3 | done | E2E phase2719 |
| Soft-complete STATUS through 2720 | done | E2E phase2720 |
| Honesty milestone 6600 + note | done | E2E phase2721 |
| Milestone 6600 on all honesty endpoints | done | E2E phase2722 |
| UI honesty milestone at 6600 | done | E2E phase2723 |
| STATUS milestone 6600 | done | E2E phase2724 |
| Soft marker 2728 | done | E2E phase2725 |
| Typecheck after milestone 6600 | done | E2E phase2726 |
| e2e-all lists 2721–2728; gaps=3 | done | E2E phase2727 |
| Soft-complete STATUS through 2728 | done | E2E phase2728 |
| Honesty surface schema 2.4 | done | E2E phase2729 |
| UI surface schema 2.4 | done | E2E phase2730 |
| Client surface version type unchanged | done | E2E phase2731 |
| STATUS schema 2.4 | done | E2E phase2732 |
| Soft marker 2736 | done | E2E phase2733 |
| Typecheck after schema 2.4 | done | E2E phase2734 |
| e2e-all lists 2729–2736; gaps=3 | done | E2E phase2735 |
| Soft-complete STATUS through 2736 | done | E2E phase2736 |
| Honesty milestone 6650 + note | done | E2E phase2737 |
| Milestone 6650 on all honesty endpoints | done | E2E phase2738 |
| UI honesty milestone at 6650 | done | E2E phase2739 |
| STATUS milestone 6650 | done | E2E phase2740 |
| Soft marker 2744 | done | E2E phase2741 |
| Typecheck after milestone 6650 | done | E2E phase2742 |
| e2e-all lists 2737–2744; gaps=3 | done | E2E phase2743 |
| Soft-complete STATUS through 2744 | done | E2E phase2744 |
| surface_roster in sessionStorage/clear | done | E2E phase2745 |
| UI surface roster persist/restore/clear | done | E2E phase2746 |
| Clear title mentions surface roster | done | E2E phase2747 |
| STATUS surface_roster session | done | E2E phase2748 |
| Soft marker 2752 | done | E2E phase2749 |
| Typecheck after surface_roster session | done | E2E phase2750 |
| e2e-all lists 2745–2752; gaps=3 | done | E2E phase2751 |
| Soft-complete STATUS through 2752 | done | E2E phase2752 |
| Honesty milestone 6700 + note | done | E2E phase2753 |
| Milestone 6700 on all honesty endpoints | done | E2E phase2754 |
| UI honesty milestone at 6700 | done | E2E phase2755 |
| STATUS milestone 6700 | done | E2E phase2756 |
| Soft marker 2760 | done | E2E phase2757 |
| Typecheck after milestone 6700 | done | E2E phase2758 |
| e2e-all lists 2753–2760; gaps=3 | done | E2E phase2759 |
| Soft-complete STATUS through 2760 | done | E2E phase2760 |
| Soft 2760+ honesty surface checkpoint | done | E2E phase2761 |
| UI Soft 2760+ surface still wired | done | E2E phase2762 |
| Client Soft 2760+ types | done | E2E phase2763 |
| STATUS Soft 2760+ checkpoint | done | E2E phase2764 |
| Soft marker 2768 | done | E2E phase2765 |
| Typecheck after Soft 2760+ | done | E2E phase2766 |
| e2e-all lists 2761–2768; gaps=3 | done | E2E phase2767 |
| Soft-complete STATUS through 2768 | done | E2E phase2768 |
| Honesty milestone 6750 + note | done | E2E phase2769 |
| Milestone 6750 on all honesty endpoints | done | E2E phase2770 |
| UI honesty milestone at 6750 | done | E2E phase2771 |
| STATUS milestone 6750 | done | E2E phase2772 |
| Soft marker 2776 | done | E2E phase2773 |
| Typecheck after milestone 6750 | done | E2E phase2774 |
| e2e-all lists 2769–2776; gaps=3 | done | E2E phase2775 |
| Soft-complete STATUS through 2776 | done | E2E phase2776 |
| soft_fertig_changelog_roster API | done | E2E phase2777 |
| UI changelog roster detail/download | done | E2E phase2778 |
| Client soft_fertig_changelog_roster type | done | E2E phase2779 |
| STATUS changelog roster | done | E2E phase2780 |
| Soft marker 2784 | done | E2E phase2781 |
| Typecheck after changelog roster | done | E2E phase2782 |
| e2e-all lists 2777–2784; gaps=3 | done | E2E phase2783 |
| Soft-complete STATUS through 2784 | done | E2E phase2784 |
| Honesty milestone 6800 + note | done | E2E phase2785 |
| Milestone 6800 on all honesty endpoints | done | E2E phase2786 |
| UI honesty milestone at 6800 | done | E2E phase2787 |
| STATUS milestone 6800 | done | E2E phase2788 |
| Soft marker 2792 | done | E2E phase2789 |
| Typecheck after milestone 6800 | done | E2E phase2790 |
| e2e-all lists 2785–2792; gaps=3 | done | E2E phase2791 |
| Soft-complete STATUS through 2792 | done | E2E phase2792 |
| changelog_roster in honesty export/bundle | done | E2E phase2793 |
| UI honesty bundle changelog_roster section | done | E2E phase2794 |
| Export titles/notes changelog_roster | done | E2E phase2795 |
| STATUS changelog_roster export | done | E2E phase2796 |
| Soft marker 2800 | done | E2E phase2797 |
| Typecheck after changelog_roster export | done | E2E phase2798 |
| e2e-all lists 2793–2800; gaps=3 | done | E2E phase2799 |
| Soft-complete STATUS through 2800 | done | E2E phase2800 |
| Honesty milestone 6850 + note | done | E2E phase2801 |
| Milestone 6850 on all honesty endpoints | done | E2E phase2802 |
| UI honesty milestone at 6850 | done | E2E phase2803 |
| STATUS milestone 6850 | done | E2E phase2804 |
| Soft marker 2808 | done | E2E phase2805 |
| Typecheck after milestone 6850 | done | E2E phase2806 |
| e2e-all lists 2801–2808; gaps=3 | done | E2E phase2807 |
| Soft-complete STATUS through 2808 | done | E2E phase2808 |
| Honesty surface schema 2.5 | done | E2E phase2809 |
| UI surface schema 2.5 | done | E2E phase2810 |
| Client surface version type unchanged | done | E2E phase2811 |
| STATUS schema 2.5 | done | E2E phase2812 |
| Soft marker 2816 | done | E2E phase2813 |
| Typecheck after schema 2.5 | done | E2E phase2814 |
| e2e-all lists 2809–2816; gaps=3 | done | E2E phase2815 |
| Soft-complete STATUS through 2816 | done | E2E phase2816 |
| Honesty milestone 6900 + note | done | E2E phase2817 |
| Milestone 6900 on all honesty endpoints | done | E2E phase2818 |
| UI honesty milestone at 6900 | done | E2E phase2819 |
| STATUS milestone 6900 | done | E2E phase2820 |
| Soft marker 2824 | done | E2E phase2821 |
| Typecheck after milestone 6900 | done | E2E phase2822 |
| e2e-all lists 2817–2824; gaps=3 | done | E2E phase2823 |
| Soft-complete STATUS through 2824 | done | E2E phase2824 |
| changelog_roster in sessionStorage/clear | done | E2E phase2825 |
| UI changelog roster persist/restore/clear | done | E2E phase2826 |
| Clear title mentions changelog roster | done | E2E phase2827 |
| STATUS changelog_roster session | done | E2E phase2828 |
| Soft marker 2832 | done | E2E phase2829 |
| Typecheck after changelog_roster session | done | E2E phase2830 |
| e2e-all lists 2825–2832; gaps=3 | done | E2E phase2831 |
| Soft-complete STATUS through 2832 | done | E2E phase2832 |
| Honesty milestone 6950 + note | done | E2E phase2833 |
| Milestone 6950 on all honesty endpoints | done | E2E phase2834 |
| UI honesty milestone at 6950 | done | E2E phase2835 |
| STATUS milestone 6950 | done | E2E phase2836 |
| Soft marker 2840 | done | E2E phase2837 |
| Typecheck after milestone 6950 | done | E2E phase2838 |
| e2e-all lists 2833–2840; gaps=3 | done | E2E phase2839 |
| Soft-complete STATUS through 2840 | done | E2E phase2840 |
| Soft 2840+ honesty surface checkpoint | done | E2E phase2841 |
| UI Soft 2840+ surface still wired | done | E2E phase2842 |
| Client Soft 2840+ types | done | E2E phase2843 |
| STATUS Soft 2840+ checkpoint | done | E2E phase2844 |
| Soft marker 2848 | done | E2E phase2845 |
| Typecheck after Soft 2840+ | done | E2E phase2846 |
| e2e-all lists 2841–2848; gaps=3 | done | E2E phase2847 |
| Soft-complete STATUS through 2848 | done | E2E phase2848 |
| Honesty milestone 7000 + note | done | E2E phase2849 |
| Milestone 7000 on all honesty endpoints | done | E2E phase2850 |
| UI honesty milestone at 7000 | done | E2E phase2851 |
| STATUS milestone 7000 | done | E2E phase2852 |
| Soft marker 2856 | done | E2E phase2853 |
| Typecheck after milestone 7000 | done | E2E phase2854 |
| e2e-all lists 2849–2856; gaps=3 | done | E2E phase2855 |
| Soft-complete STATUS through 2856 | done | E2E phase2856 |
| soft_fertig_expect_step_roster API | done | E2E phase2857 |
| UI expect step roster detail/download | done | E2E phase2858 |
| Client soft_fertig_expect_step_roster type | done | E2E phase2859 |
| STATUS expect step roster | done | E2E phase2860 |
| Soft marker 2864 | done | E2E phase2861 |
| Typecheck after expect step roster | done | E2E phase2862 |
| e2e-all lists 2857–2864; gaps=3 | done | E2E phase2863 |
| Soft-complete STATUS through 2864 | done | E2E phase2864 |
| Honesty milestone 7050 + note | done | E2E phase2865 |
| Milestone 7050 on all honesty endpoints | done | E2E phase2866 |
| UI honesty milestone at 7050 | done | E2E phase2867 |
| STATUS milestone 7050 | done | E2E phase2868 |
| Soft marker 2872 | done | E2E phase2869 |
| Typecheck after milestone 7050 | done | E2E phase2870 |
| e2e-all lists 2865–2872; gaps=3 | done | E2E phase2871 |
| Soft-complete STATUS through 2872 | done | E2E phase2872 |
| expect_step_roster in Export/Bundle | done | E2E phase2873 |
| UI expect_step_roster bundle section | done | E2E phase2874 |
| Export/bundle titles/notes expect_step_roster | done | E2E phase2875 |
| STATUS expect_step_roster export | done | E2E phase2876 |
| Soft marker 2880 | done | E2E phase2877 |
| Typecheck after expect_step_roster export | done | E2E phase2878 |
| e2e-all lists 2873–2880; gaps=3 | done | E2E phase2879 |
| Soft-complete STATUS through 2880 | done | E2E phase2880 |
| Honesty milestone 7100 + note | done | E2E phase2881 |
| Milestone 7100 on all honesty endpoints | done | E2E phase2882 |
| UI honesty milestone at 7100 | done | E2E phase2883 |
| STATUS milestone 7100 | done | E2E phase2884 |
| Soft marker 2888 | done | E2E phase2885 |
| Typecheck after milestone 7100 | done | E2E phase2886 |
| e2e-all lists 2881–2888; gaps=3 | done | E2E phase2887 |
| Soft-complete STATUS through 2888 | done | E2E phase2888 |
| Honesty surface schema 2.6 | done | E2E phase2889 |
| UI surface schema 2.6 | done | E2E phase2890 |
| Client surface + expect_step_roster types | done | E2E phase2891 |
| STATUS schema 2.6 | done | E2E phase2892 |
| Soft marker 2896 | done | E2E phase2893 |
| Typecheck after schema 2.6 | done | E2E phase2894 |
| e2e-all lists 2889–2896; gaps=3 | done | E2E phase2895 |
| Soft-complete STATUS through 2896 | done | E2E phase2896 |
| Honesty milestone 7150 + note | done | E2E phase2897 |
| Milestone 7150 on all honesty endpoints | done | E2E phase2898 |
| UI honesty milestone at 7150 | done | E2E phase2899 |
| STATUS milestone 7150 | done | E2E phase2900 |
| Soft marker 2904 | done | E2E phase2901 |
| Typecheck after milestone 7150 | done | E2E phase2902 |
| e2e-all lists 2897–2904; gaps=3 | done | E2E phase2903 |
| Soft-complete STATUS through 2904 | done | E2E phase2904 |
| expect_step_roster in sessionStorage/Clear | done | E2E phase2905 |
| UI expect_step_roster sessionStorage | done | E2E phase2906 |
| Clear catalogs expect_step_roster | done | E2E phase2907 |
| STATUS expect_step_roster sessionStorage | done | E2E phase2908 |
| Soft marker 2912 | done | E2E phase2909 |
| Typecheck after expect_step sessionStorage | done | E2E phase2910 |
| e2e-all lists 2905–2912; gaps=3 | done | E2E phase2911 |
| Soft-complete STATUS through 2912 | done | E2E phase2912 |
| Honesty milestone 7200 + note | done | E2E phase2913 |
| Milestone 7200 on all honesty endpoints | done | E2E phase2914 |
| UI honesty milestone at 7200 | done | E2E phase2915 |
| STATUS milestone 7200 | done | E2E phase2916 |
| Soft marker 2920 | done | E2E phase2917 |
| Typecheck after milestone 7200 | done | E2E phase2918 |
| e2e-all lists 2913–2920; gaps=3 | done | E2E phase2919 |
| Soft-complete STATUS through 2920 | done | E2E phase2920 |
| Soft 2920+ honesty surface (expect_step cycle) | done | E2E phase2921 |
| UI Soft 2920+ expect step roster | done | E2E phase2922 |
| Client Soft 2920+ expect_step_roster type | done | E2E phase2923 |
| STATUS Soft 2920+ Checkpoint | done | E2E phase2924 |
| Soft marker 2928 | done | E2E phase2925 |
| Typecheck after Soft 2920+ | done | E2E phase2926 |
| e2e-all lists 2921–2928; gaps=3 | done | E2E phase2927 |
| Soft-complete STATUS through 2928 | done | E2E phase2928 |
| Honesty milestone 7250 + note | done | E2E phase2929 |
| Milestone 7250 on all honesty endpoints | done | E2E phase2930 |
| UI honesty milestone at 7250 | done | E2E phase2931 |
| STATUS milestone 7250 | done | E2E phase2932 |
| Soft marker 2936 | done | E2E phase2933 |
| Typecheck after milestone 7250 | done | E2E phase2934 |
| e2e-all lists 2929–2936; gaps=3 | done | E2E phase2935 |
| Soft-complete STATUS through 2936 | done | E2E phase2936 |
| soft_fertig_ssh_honesty_roster API | done | E2E phase2937 |
| UI SSH honesty roster detail/download | done | E2E phase2938 |
| Client soft_fertig_ssh_honesty_roster type | done | E2E phase2939 |
| STATUS SSH honesty roster | done | E2E phase2940 |
| Soft marker 2944 | done | E2E phase2941 |
| Typecheck after SSH honesty roster | done | E2E phase2942 |
| e2e-all lists 2937–2944; gaps=3 | done | E2E phase2943 |
| Soft-complete STATUS through 2944 | done | E2E phase2944 |
| Honesty milestone 7300 + note | done | E2E phase2945 |
| Milestone 7300 on all honesty endpoints | done | E2E phase2946 |
| UI honesty milestone at 7300 | done | E2E phase2947 |
| STATUS milestone 7300 | done | E2E phase2948 |
| Soft marker 2952 | done | E2E phase2949 |
| Typecheck after milestone 7300 | done | E2E phase2950 |
| e2e-all lists 2945–2952; gaps=3 | done | E2E phase2951 |
| Soft-complete STATUS through 2952 | done | E2E phase2952 |
| ssh_honesty_roster in Export/Bundle | done | E2E phase2953 |
| UI ssh_honesty_roster bundle section | done | E2E phase2954 |
| Export/bundle titles/notes ssh_honesty_roster | done | E2E phase2955 |
| STATUS ssh_honesty_roster export | done | E2E phase2956 |
| Soft marker 2960 | done | E2E phase2957 |
| Typecheck after ssh_honesty export | done | E2E phase2958 |
| e2e-all lists 2953–2960; gaps=3 | done | E2E phase2959 |
| Soft-complete STATUS through 2960 | done | E2E phase2960 |
| Honesty milestone 7350 + note | done | E2E phase2961 |
| Milestone 7350 on all honesty endpoints | done | E2E phase2962 |
| UI honesty milestone at 7350 | done | E2E phase2963 |
| STATUS milestone 7350 | done | E2E phase2964 |
| Soft marker 2968 | done | E2E phase2965 |
| Typecheck after milestone 7350 | done | E2E phase2966 |
| e2e-all lists 2961–2968; gaps=3 | done | E2E phase2967 |
| Soft-complete STATUS through 2968 | done | E2E phase2968 |
| Honesty surface schema 2.7 | done | E2E phase2969 |
| UI surface schema 2.7 | done | E2E phase2970 |
| Client surface + ssh_honesty_roster types | done | E2E phase2971 |
| STATUS schema 2.7 | done | E2E phase2972 |
| Soft marker 2976 | done | E2E phase2973 |
| Typecheck after schema 2.7 | done | E2E phase2974 |
| e2e-all lists 2969–2976; gaps=3 | done | E2E phase2975 |
| Soft-complete STATUS through 2976 | done | E2E phase2976 |
| Honesty milestone 7400 + note | done | E2E phase2977 |
| Milestone 7400 on all honesty endpoints | done | E2E phase2978 |
| UI honesty milestone at 7400 | done | E2E phase2979 |
| STATUS milestone 7400 | done | E2E phase2980 |
| Soft marker 2984 | done | E2E phase2981 |
| Typecheck after milestone 7400 | done | E2E phase2982 |
| e2e-all lists 2977–2984; gaps=3 | done | E2E phase2983 |
| Soft-complete STATUS through 2984 | done | E2E phase2984 |
| ssh_honesty_roster in sessionStorage/Clear | done | E2E phase2985 |
| UI ssh_honesty_roster sessionStorage | done | E2E phase2986 |
| Clear catalogs ssh_honesty_roster | done | E2E phase2987 |
| STATUS ssh_honesty_roster sessionStorage | done | E2E phase2988 |
| Soft marker 2992 | done | E2E phase2989 |
| Typecheck after ssh_honesty sessionStorage | done | E2E phase2990 |
| e2e-all lists 2985–2992; gaps=3 | done | E2E phase2991 |
| Soft-complete STATUS through 2992 | done | E2E phase2992 |
| Honesty milestone 7450 + note | done | E2E phase2993 |
| Milestone 7450 on all honesty endpoints | done | E2E phase2994 |
| UI honesty milestone at 7450 | done | E2E phase2995 |
| STATUS milestone 7450 | done | E2E phase2996 |
| Soft marker 3000 | done | E2E phase2997 |
| Typecheck after milestone 7450 | done | E2E phase2998 |
| e2e-all lists 2993–3000; gaps=3 | done | E2E phase2999 |
| Soft-complete STATUS through 3000 | done | E2E phase3000 |
| Soft 3000+ honesty surface (ssh_honesty cycle) | done | E2E phase3001 |
| UI Soft 3000+ SSH honesty roster | done | E2E phase3002 |
| Client Soft 3000+ ssh_honesty_roster type | done | E2E phase3003 |
| STATUS Soft 3000+ Checkpoint | done | E2E phase3004 |
| Soft marker 3008 | done | E2E phase3005 |
| Typecheck after Soft 3000+ | done | E2E phase3006 |
| e2e-all lists 3001–3008; gaps=3 | done | E2E phase3007 |
| Soft-complete STATUS through 3008 | done | E2E phase3008 |
| Honesty milestone 7500 + note | done | E2E phase3009 |
| Milestone 7500 on all honesty endpoints | done | E2E phase3010 |
| UI honesty milestone at 7500 | done | E2E phase3011 |
| STATUS milestone 7500 | done | E2E phase3012 |
| Soft marker 3016 | done | E2E phase3013 |
| Typecheck after milestone 7500 | done | E2E phase3014 |
| e2e-all lists 3009–3016; gaps=3 | done | E2E phase3015 |
| Soft-complete STATUS through 3016 | done | E2E phase3016 |
| soft_fertig_layout_fidelity_signal_roster API | done | E2E phase3017 |
| UI layout fidelity signal roster detail/download | done | E2E phase3018 |
| Client soft_fertig_layout_fidelity_signal_roster type | done | E2E phase3019 |
| STATUS layout fidelity signal roster | done | E2E phase3020 |
| Soft marker 3024 | done | E2E phase3021 |
| Typecheck after layout fidelity signal roster | done | E2E phase3022 |
| e2e-all lists 3017–3024; gaps=3 | done | E2E phase3023 |
| Soft-complete STATUS through 3024 | done | E2E phase3024 |
| Honesty milestone 7550 + note | done | E2E phase3025 |
| Milestone 7550 on all honesty endpoints | done | E2E phase3026 |
| UI honesty milestone at 7550 | done | E2E phase3027 |
| STATUS milestone 7550 | done | E2E phase3028 |
| Soft marker 3032 | done | E2E phase3029 |
| Typecheck after milestone 7550 | done | E2E phase3030 |
| e2e-all lists 3025–3032; gaps=3 | done | E2E phase3031 |
| Soft-complete STATUS through 3032 | done | E2E phase3032 |
| layout_fidelity_signal_roster in Export/Bundle | done | E2E phase3033 |
| UI layout_fidelity_signal_roster bundle section | done | E2E phase3034 |
| Export/bundle titles/notes layout_fidelity_signal_roster | done | E2E phase3035 |
| STATUS layout_fidelity_signal_roster export | done | E2E phase3036 |
| Soft marker 3040 | done | E2E phase3037 |
| Typecheck after layout fidelity signal export | done | E2E phase3038 |
| e2e-all lists 3033–3040; gaps=3 | done | E2E phase3039 |
| Soft-complete STATUS through 3040 | done | E2E phase3040 |
| Honesty milestone 7600 + note | done | E2E phase3041 |
| Milestone 7600 on all honesty endpoints | done | E2E phase3042 |
| UI honesty milestone at 7600 | done | E2E phase3043 |
| STATUS milestone 7600 | done | E2E phase3044 |
| Soft marker 3048 | done | E2E phase3045 |
| Typecheck after milestone 7600 | done | E2E phase3046 |
| e2e-all lists 3041–3048; gaps=3 | done | E2E phase3047 |
| Soft-complete STATUS through 3048 | done | E2E phase3048 |
| Honesty surface schema 2.8 | done | E2E phase3049 |
| UI surface schema 2.8 | done | E2E phase3050 |
| Client surface + layout_fidelity_signal_roster types | done | E2E phase3051 |
| STATUS schema 2.8 | done | E2E phase3052 |
| Soft marker 3056 | done | E2E phase3053 |
| Typecheck after schema 2.8 | done | E2E phase3054 |
| e2e-all lists 3049–3056; gaps=3 | done | E2E phase3055 |
| Soft-complete STATUS through 3056 | done | E2E phase3056 |
| Honesty milestone 7650 + note | done | E2E phase3057 |
| Milestone 7650 on all honesty endpoints | done | E2E phase3058 |
| UI honesty milestone at 7650 | done | E2E phase3059 |
| STATUS milestone 7650 | done | E2E phase3060 |
| Soft marker 3064 | done | E2E phase3061 |
| Typecheck after milestone 7650 | done | E2E phase3062 |
| e2e-all lists 3057–3064; gaps=3 | done | E2E phase3063 |
| Soft-complete STATUS through 3064 | done | E2E phase3064 |
| layout_fidelity_signal_roster in sessionStorage/Clear | done | E2E phase3065 |
| UI layout_fidelity_signal_roster sessionStorage | done | E2E phase3066 |
| Clear catalogs layout_fidelity_signal_roster | done | E2E phase3067 |
| STATUS layout_fidelity_signal_roster sessionStorage | done | E2E phase3068 |
| Soft marker 3072 | done | E2E phase3069 |
| Typecheck after layout_fidelity_signal sessionStorage | done | E2E phase3070 |
| e2e-all lists 3065–3072; gaps=3 | done | E2E phase3071 |
| Soft-complete STATUS through 3072 | done | E2E phase3072 |
| Honesty milestone 7700 + note | done | E2E phase3073 |
| Milestone 7700 on all honesty endpoints | done | E2E phase3074 |
| UI honesty milestone at 7700 | done | E2E phase3075 |
| STATUS milestone 7700 | done | E2E phase3076 |
| Soft marker 3080 | done | E2E phase3077 |
| Typecheck after milestone 7700 | done | E2E phase3078 |
| e2e-all lists 3073–3080; gaps=3 | done | E2E phase3079 |
| Soft-complete STATUS through 3080 | done | E2E phase3080 |
| Soft 3080+ honesty surface (layout_fidelity_signal cycle) | done | E2E phase3081 |
| UI Soft 3080+ layout fidelity signal roster | done | E2E phase3082 |
| Client Soft 3080+ layout_fidelity_signal_roster type | done | E2E phase3083 |
| STATUS Soft 3080+ Checkpoint | done | E2E phase3084 |
| Soft marker 3088 | done | E2E phase3085 |
| Typecheck after Soft 3080+ | done | E2E phase3086 |
| e2e-all lists 3081–3088; gaps=3 | done | E2E phase3087 |
| Soft-complete STATUS through 3088 | done | E2E phase3088 |
| Honesty milestone 7750 + note | done | E2E phase3089 |
| Milestone 7750 on all honesty endpoints | done | E2E phase3090 |
| UI honesty milestone at 7750 | done | E2E phase3091 |
| STATUS milestone 7750 | done | E2E phase3092 |
| Soft marker 3096 | done | E2E phase3093 |
| Typecheck after milestone 7750 | done | E2E phase3094 |
| e2e-all lists 3089–3096; gaps=3 | done | E2E phase3095 |
| Soft-complete STATUS through 3096 | done | E2E phase3096 |
| soft_fertig_layout_fidelity_sample_roster API | done | E2E phase3097 |
| UI layout fidelity sample roster detail/download | done | E2E phase3098 |
| Client soft_fertig_layout_fidelity_sample_roster type | done | E2E phase3099 |
| STATUS layout fidelity sample roster | done | E2E phase3100 |
| Soft marker 3104 | done | E2E phase3101 |
| Typecheck after layout fidelity sample roster | done | E2E phase3102 |
| e2e-all lists 3097–3104; gaps=3 | done | E2E phase3103 |
| Soft-complete STATUS through 3104 | done | E2E phase3104 |
| Honesty milestone 7800 + note | done | E2E phase3105 |
| Milestone 7800 on all honesty endpoints | done | E2E phase3106 |
| UI honesty milestone at 7800 | done | E2E phase3107 |
| STATUS milestone 7800 | done | E2E phase3108 |
| Soft marker 3112 | done | E2E phase3109 |
| Typecheck after milestone 7800 | done | E2E phase3110 |
| e2e-all lists 3105–3112; gaps=3 | done | E2E phase3111 |
| Soft-complete STATUS through 3112 | done | E2E phase3112 |
| layout_fidelity_sample_roster in Export/Bundle | done | E2E phase3113 |
| UI layout_fidelity_sample_roster bundle section | done | E2E phase3114 |
| Export/bundle titles/notes layout_fidelity_sample_roster | done | E2E phase3115 |
| STATUS layout_fidelity_sample_roster export | done | E2E phase3116 |
| Soft marker 3120 | done | E2E phase3117 |
| Typecheck after layout fidelity sample export | done | E2E phase3118 |
| e2e-all lists 3113–3120; gaps=3 | done | E2E phase3119 |
| Soft-complete STATUS through 3120 | done | E2E phase3120 |
| Honesty milestone 7850 + note | done | E2E phase3121 |
| Milestone 7850 on all honesty endpoints | done | E2E phase3122 |
| UI honesty milestone at 7850 | done | E2E phase3123 |
| STATUS milestone 7850 | done | E2E phase3124 |
| Soft marker 3128 | done | E2E phase3125 |
| Typecheck after milestone 7850 | done | E2E phase3126 |
| e2e-all lists 3121–3128; gaps=3 | done | E2E phase3127 |
| Soft-complete STATUS through 3128 | done | E2E phase3128 |
| Honesty surface schema 2.9 | done | E2E phase3129 |
| UI surface schema 2.9 | done | E2E phase3130 |
| Client surface + layout_fidelity_sample_roster types | done | E2E phase3131 |
| STATUS schema 2.9 | done | E2E phase3132 |
| Soft marker 3136 | done | E2E phase3133 |
| Typecheck after schema 2.9 | done | E2E phase3134 |
| e2e-all lists 3129–3136; gaps=3 | done | E2E phase3135 |
| Soft-complete STATUS through 3136 | done | E2E phase3136 |
| Honesty milestone 7900 + note | done | E2E phase3137 |
| Milestone 7900 on all honesty endpoints | done | E2E phase3138 |
| UI honesty milestone at 7900 | done | E2E phase3139 |
| STATUS milestone 7900 | done | E2E phase3140 |
| Soft marker 3144 | done | E2E phase3141 |
| Typecheck after milestone 7900 | done | E2E phase3142 |
| e2e-all lists 3137–3144; gaps=3 | done | E2E phase3143 |
| Soft-complete STATUS through 3144 | done | E2E phase3144 |
| layout_fidelity_sample_roster in sessionStorage/Clear | done | E2E phase3145 |
| UI layout_fidelity_sample_roster sessionStorage | done | E2E phase3146 |
| Clear catalogs layout_fidelity_sample_roster | done | E2E phase3147 |
| STATUS layout_fidelity_sample_roster sessionStorage | done | E2E phase3148 |
| Soft marker 3152 | done | E2E phase3149 |
| Typecheck after layout_fidelity_sample sessionStorage | done | E2E phase3150 |
| e2e-all lists 3145–3152; gaps=3 | done | E2E phase3151 |
| Soft-complete STATUS through 3152 | done | E2E phase3152 |
| Honesty milestone 7950 + note | done | E2E phase3153 |
| Milestone 7950 on all honesty endpoints | done | E2E phase3154 |
| UI honesty milestone at 7950 | done | E2E phase3155 |
| STATUS milestone 7950 | done | E2E phase3156 |
| Soft marker 3160 | done | E2E phase3157 |
| Typecheck after milestone 7950 | done | E2E phase3158 |
| e2e-all lists 3153–3160; gaps=3 | done | E2E phase3159 |
| Soft-complete STATUS through 3160 | done | E2E phase3160 |
| Soft 3160+ honesty surface (layout_fidelity_sample cycle) | done | E2E phase3161 |
| UI Soft 3160+ layout fidelity sample roster | done | E2E phase3162 |
| Client Soft 3160+ layout_fidelity_sample_roster type | done | E2E phase3163 |
| STATUS Soft 3160+ Checkpoint | done | E2E phase3164 |
| Soft marker 3168 | done | E2E phase3165 |
| Typecheck after Soft 3160+ | done | E2E phase3166 |
| e2e-all lists 3161–3168; gaps=3 | done | E2E phase3167 |
| Soft-complete STATUS through 3168 | done | E2E phase3168 |
| Honesty milestone 8000 + note | done | E2E phase3169 |
| Milestone 8000 on all honesty endpoints | done | E2E phase3170 |
| UI honesty milestone at 8000 | done | E2E phase3171 |
| STATUS milestone 8000 | done | E2E phase3172 |
| Soft marker 3176 | done | E2E phase3173 |
| Typecheck after milestone 8000 | done | E2E phase3174 |
| e2e-all lists 3169–3176; gaps=3 | done | E2E phase3175 |
| Soft-complete STATUS through 3176 | done | E2E phase3176 |
| soft_fertig_layout_fidelity_sample_field_roster API | done | E2E phase3177 |
| UI layout fidelity sample field roster detail/download | done | E2E phase3178 |
| Client soft_fertig_layout_fidelity_sample_field_roster type | done | E2E phase3179 |
| STATUS layout fidelity sample field roster | done | E2E phase3180 |
| Soft marker 3184 | done | E2E phase3181 |
| Typecheck after layout fidelity sample field roster | done | E2E phase3182 |
| e2e-all lists 3177–3184; gaps=3 | done | E2E phase3183 |
| Soft-complete STATUS through 3184 | done | E2E phase3184 |
| Honesty milestone 8050 + note | done | E2E phase3185 |
| Milestone 8050 on all honesty endpoints | done | E2E phase3186 |
| UI honesty milestone at 8050 | done | E2E phase3187 |
| STATUS milestone 8050 | done | E2E phase3188 |
| Soft marker 3192 | done | E2E phase3189 |
| Typecheck after milestone 8050 | done | E2E phase3190 |
| e2e-all lists 3185–3192; gaps=3 | done | E2E phase3191 |
| Soft-complete STATUS through 3192 | done | E2E phase3192 |
| layout_fidelity_sample_field_roster in Export/Bundle | done | E2E phase3193 |
| UI layout_fidelity_sample_field_roster bundle section | done | E2E phase3194 |
| Export/bundle titles/notes layout_fidelity_sample_field_roster | done | E2E phase3195 |
| STATUS layout_fidelity_sample_field_roster export | done | E2E phase3196 |
| Soft marker 3200 | done | E2E phase3197 |
| Typecheck after layout fidelity sample field export | done | E2E phase3198 |
| e2e-all lists 3193–3200; gaps=3 | done | E2E phase3199 |
| Soft-complete STATUS through 3200 | done | E2E phase3200 |
| Honesty milestone 8100 + note | done | E2E phase3201 |
| Milestone 8100 on all honesty endpoints | done | E2E phase3202 |
| UI honesty milestone at 8100 | done | E2E phase3203 |
| STATUS milestone 8100 | done | E2E phase3204 |
| Soft marker 3208 | done | E2E phase3205 |
| Typecheck after milestone 8100 | done | E2E phase3206 |
| e2e-all lists 3201–3208; gaps=3 | done | E2E phase3207 |
| Soft-complete STATUS through 3208 | done | E2E phase3208 |
| Honesty surface schema 3.0 | done | E2E phase3209 |
| UI surface schema 3.0 | done | E2E phase3210 |
| Client surface + layout_fidelity_sample_field_roster types | done | E2E phase3211 |
| STATUS schema 3.0 | done | E2E phase3212 |
| Soft marker 3216 | done | E2E phase3213 |
| Typecheck after schema 3.0 | done | E2E phase3214 |
| e2e-all lists 3209–3216; gaps=3 | done | E2E phase3215 |
| Soft-complete STATUS through 3216 | done | E2E phase3216 |
| Honesty milestone 8150 + note | done | E2E phase3217 |
| Milestone 8150 on all honesty endpoints | done | E2E phase3218 |
| UI honesty milestone at 8150 | done | E2E phase3219 |
| STATUS milestone 8150 | done | E2E phase3220 |
| Soft marker 3224 | done | E2E phase3221 |
| Typecheck after milestone 8150 | done | E2E phase3222 |
| e2e-all lists 3217–3224; gaps=3 | done | E2E phase3223 |
| Soft-complete STATUS through 3224 | done | E2E phase3224 |
| layout_fidelity_sample_field_roster sessionStorage | done | E2E phase3225 |
| UI sample_field sessionStorage persist/restore/clear | done | E2E phase3226 |
| Clear title mentions sample field roster | done | E2E phase3227 |
| STATUS sample_field sessionStorage | done | E2E phase3228 |
| Soft marker 3232 | done | E2E phase3229 |
| Typecheck after sample_field sessionStorage | done | E2E phase3230 |
| e2e-all lists 3225–3232; gaps=3 | done | E2E phase3231 |
| Soft-complete STATUS through 3232 | done | E2E phase3232 |
| Honesty milestone 8200 + note | done | E2E phase3233 |
| Milestone 8200 on all honesty endpoints | done | E2E phase3234 |
| UI honesty milestone at 8200 | done | E2E phase3235 |
| STATUS milestone 8200 | done | E2E phase3236 |
| Soft marker 3240 | done | E2E phase3237 |
| Typecheck after milestone 8200 | done | E2E phase3238 |
| e2e-all lists 3233–3240; gaps=3 | done | E2E phase3239 |
| Soft-complete STATUS through 3240 | done | E2E phase3240 |
| Soft 3240+ honesty surface still complete | done | E2E phase3241 |
| UI Soft 3240+ sample field roster | done | E2E phase3242 |
| Client Soft 3240+ sample_field type | done | E2E phase3243 |
| STATUS Soft 3240+ | done | E2E phase3244 |
| Soft marker 3248 | done | E2E phase3245 |
| Typecheck after Soft 3240+ | done | E2E phase3246 |
| e2e-all lists 3241–3248; gaps=3 | done | E2E phase3247 |
| Soft-complete STATUS through 3248 | done | E2E phase3248 |
| Honesty milestone 8250 + note | done | E2E phase3249 |
| Milestone 8250 on all honesty endpoints | done | E2E phase3250 |
| UI honesty milestone at 8250 | done | E2E phase3251 |
| STATUS milestone 8250 | done | E2E phase3252 |
| Soft marker 3256 | done | E2E phase3253 |
| Typecheck after milestone 8250 | done | E2E phase3254 |
| e2e-all lists 3249–3256; gaps=3 | done | E2E phase3255 |
| Soft-complete STATUS through 3256 | done | E2E phase3256 |
| soft_fertig_catalog_summary_roster API | done | E2E phase3257 |
| UI catalog summary roster detail + download/copy | done | E2E phase3258 |
| Client soft_fertig_catalog_summary_roster type | done | E2E phase3259 |
| STATUS catalog_summary_roster | done | E2E phase3260 |
| Soft marker 3264 | done | E2E phase3261 |
| Typecheck after catalog_summary_roster | done | E2E phase3262 |
| e2e-all lists 3257–3264; gaps=3 | done | E2E phase3263 |
| Soft-complete STATUS through 3264 | done | E2E phase3264 |
| Honesty milestone 8300 + note | done | E2E phase3265 |
| Milestone 8300 on all honesty endpoints | done | E2E phase3266 |
| UI honesty milestone at 8300 | done | E2E phase3267 |
| STATUS milestone 8300 | done | E2E phase3268 |
| Soft marker 3272 | done | E2E phase3269 |
| Typecheck after milestone 8300 | done | E2E phase3270 |
| e2e-all lists 3265–3272; gaps=3 | done | E2E phase3271 |
| Soft-complete STATUS through 3272 | done | E2E phase3272 |
| catalog_summary_roster in Export/Bundle | done | E2E phase3273 |
| UI catalog_summary_roster bundle section | done | E2E phase3274 |
| Export/bundle titles/notes catalog_summary_roster | done | E2E phase3275 |
| STATUS catalog_summary_roster export | done | E2E phase3276 |
| Soft marker 3280 | done | E2E phase3277 |
| Typecheck after catalog_summary_roster export | done | E2E phase3278 |
| e2e-all lists 3273–3280; gaps=3 | done | E2E phase3279 |
| Soft-complete STATUS through 3280 | done | E2E phase3280 |
| Honesty milestone 8350 + note | done | E2E phase3281 |
| Milestone 8350 on all honesty endpoints | done | E2E phase3282 |
| UI honesty milestone at 8350 | done | E2E phase3283 |
| STATUS milestone 8350 | done | E2E phase3284 |
| Soft marker 3288 | done | E2E phase3285 |
| Typecheck after milestone 8350 | done | E2E phase3286 |
| e2e-all lists 3281–3288; gaps=3 | done | E2E phase3287 |
| Soft-complete STATUS through 3288 | done | E2E phase3288 |
| Honesty surface schema 3.1 | done | E2E phase3289 |
| UI surface schema 3.1 | done | E2E phase3290 |
| Client surface + catalog_summary_roster types | done | E2E phase3291 |
| STATUS schema 3.1 | done | E2E phase3292 |
| Soft marker 3296 | done | E2E phase3293 |
| Typecheck after schema 3.1 | done | E2E phase3294 |
| e2e-all lists 3289–3296; gaps=3 | done | E2E phase3295 |
| Soft-complete STATUS through 3296 | done | E2E phase3296 |
| Honesty milestone 8400 + note | done | E2E phase3297 |
| Milestone 8400 on all honesty endpoints | done | E2E phase3298 |
| UI honesty milestone at 8400 | done | E2E phase3299 |
| STATUS milestone 8400 | done | E2E phase3300 |
| Soft marker 3304 | done | E2E phase3301 |
| Typecheck after milestone 8400 | done | E2E phase3302 |
| e2e-all lists 3297–3304; gaps=3 | done | E2E phase3303 |
| Soft-complete STATUS through 3304 | done | E2E phase3304 |
| catalog_summary_roster sessionStorage | done | E2E phase3305 |
| UI catalog_summary sessionStorage persist/restore/clear | done | E2E phase3306 |
| Clear title mentions catalog summary roster | done | E2E phase3307 |
| STATUS catalog_summary sessionStorage | done | E2E phase3308 |
| Soft marker 3312 | done | E2E phase3309 |
| Typecheck after catalog_summary sessionStorage | done | E2E phase3310 |
| e2e-all lists 3305–3312; gaps=3 | done | E2E phase3311 |
| Soft-complete STATUS through 3312 | done | E2E phase3312 |
| Honesty milestone 8450 + note | done | E2E phase3313 |
| Milestone 8450 on all honesty endpoints | done | E2E phase3314 |
| UI honesty milestone at 8450 | done | E2E phase3315 |
| STATUS milestone 8450 | done | E2E phase3316 |
| Soft marker 3320 | done | E2E phase3317 |
| Typecheck after milestone 8450 | done | E2E phase3318 |
| e2e-all lists 3313–3320; gaps=3 | done | E2E phase3319 |
| Soft-complete STATUS through 3320 | done | E2E phase3320 |
| Soft 3320+ honesty surface still complete | done | E2E phase3321 |
| UI Soft 3320+ catalog summary roster | done | E2E phase3322 |
| Client Soft 3320+ catalog_summary type | done | E2E phase3323 |
| STATUS Soft 3320+ | done | E2E phase3324 |
| Soft marker 3328 | done | E2E phase3325 |
| Typecheck after Soft 3320+ | done | E2E phase3326 |
| e2e-all lists 3321–3328; gaps=3 | done | E2E phase3327 |
| Soft-complete STATUS through 3328 | done | E2E phase3328 |
| Honesty milestone 8500 + note | done | E2E phase3329 |
| Milestone 8500 on all honesty endpoints | done | E2E phase3330 |
| UI honesty milestone at 8500 | done | E2E phase3331 |
| STATUS milestone 8500 | done | E2E phase3332 |
| Soft marker 3336 | done | E2E phase3333 |
| Typecheck after milestone 8500 | done | E2E phase3334 |
| e2e-all lists 3329–3336; gaps=3 | done | E2E phase3335 |
| Soft-complete STATUS through 3336 | done | E2E phase3336 |
| soft_fertig_honesty_readiness_roster API | done | E2E phase3337 |
| UI honesty readiness roster detail + download/copy | done | E2E phase3338 |
| Client soft_fertig_honesty_readiness_roster type | done | E2E phase3339 |
| STATUS honesty_readiness_roster | done | E2E phase3340 |
| Soft marker 3344 | done | E2E phase3341 |
| Typecheck after honesty_readiness_roster | done | E2E phase3342 |
| e2e-all lists 3337–3344; gaps=3 | done | E2E phase3343 |
| Soft-complete STATUS through 3344 | done | E2E phase3344 |
| Honesty milestone 8550 + note | done | E2E phase3345 |
| Milestone 8550 on all honesty endpoints | done | E2E phase3346 |
| UI honesty milestone at 8550 | done | E2E phase3347 |
| STATUS milestone 8550 | done | E2E phase3348 |
| Soft marker 3352 | done | E2E phase3349 |
| Typecheck after milestone 8550 | done | E2E phase3350 |
| e2e-all lists 3345–3352; gaps=3 | done | E2E phase3351 |
| Soft-complete STATUS through 3352 | done | E2E phase3352 |
| honesty_readiness_roster in Export/Bundle | done | E2E phase3353 |
| UI honesty_readiness_roster bundle section | done | E2E phase3354 |
| Export/bundle titles/notes honesty_readiness_roster | done | E2E phase3355 |
| STATUS honesty_readiness_roster export | done | E2E phase3356 |
| Soft marker 3360 | done | E2E phase3357 |
| Typecheck after honesty_readiness_roster export | done | E2E phase3358 |
| e2e-all lists 3353–3360; gaps=3 | done | E2E phase3359 |
| Soft-complete STATUS through 3360 | done | E2E phase3360 |
| Honesty milestone 8600 + note | done | E2E phase3361 |
| Milestone 8600 on all honesty endpoints | done | E2E phase3362 |
| UI honesty milestone at 8600 | done | E2E phase3363 |
| STATUS milestone 8600 | done | E2E phase3364 |
| Soft marker 3368 | done | E2E phase3365 |
| Typecheck after milestone 8600 | done | E2E phase3366 |
| e2e-all lists 3361–3368; gaps=3 | done | E2E phase3367 |
| Soft-complete STATUS through 3368 | done | E2E phase3368 |
| Honesty surface schema 3.2 | done | E2E phase3369 |
| UI surface schema 3.2 | done | E2E phase3370 |
| Client surface + honesty_readiness_roster types | done | E2E phase3371 |
| STATUS schema 3.2 | done | E2E phase3372 |
| Soft marker 3376 | done | E2E phase3373 |
| Typecheck after schema 3.2 | done | E2E phase3374 |
| e2e-all lists 3369–3376; gaps=3 | done | E2E phase3375 |
| Soft-complete STATUS through 3376 | done | E2E phase3376 |
| Honesty milestone 8650 + note | done | E2E phase3377 |
| Milestone 8650 on all honesty endpoints | done | E2E phase3378 |
| UI honesty milestone at 8650 | done | E2E phase3379 |
| STATUS milestone 8650 | done | E2E phase3380 |
| Soft marker 3384 | done | E2E phase3381 |
| Typecheck after milestone 8650 | done | E2E phase3382 |
| e2e-all lists 3377–3384; gaps=3 | done | E2E phase3383 |
| Soft-complete STATUS through 3384 | done | E2E phase3384 |
| honesty_readiness_roster sessionStorage | done | E2E phase3385 |
| UI honesty_readiness sessionStorage persist/restore/clear | done | E2E phase3386 |
| Clear title mentions honesty readiness roster | done | E2E phase3387 |
| STATUS honesty_readiness sessionStorage | done | E2E phase3388 |
| Soft marker 3392 | done | E2E phase3389 |
| Typecheck after honesty_readiness sessionStorage | done | E2E phase3390 |
| e2e-all lists 3385–3392; gaps=3 | done | E2E phase3391 |
| Soft-complete STATUS through 3392 | done | E2E phase3392 |
| Honesty milestone 8700 + note | done | E2E phase3393 |
| Milestone 8700 on all honesty endpoints | done | E2E phase3394 |
| UI honesty milestone at 8700 | done | E2E phase3395 |
| STATUS milestone 8700 | done | E2E phase3396 |
| Soft marker 3400 | done | E2E phase3397 |
| Typecheck after milestone 8700 | done | E2E phase3398 |
| e2e-all lists 3393–3400; gaps=3 | done | E2E phase3399 |
| Soft-complete STATUS through 3400 | done | E2E phase3400 |
| Soft 3400+ honesty surface still complete | done | E2E phase3401 |
| UI Soft 3400+ honesty readiness roster | done | E2E phase3402 |
| Client Soft 3400+ honesty_readiness type | done | E2E phase3403 |
| STATUS Soft 3400+ | done | E2E phase3404 |
| Soft marker 3408 | done | E2E phase3405 |
| Typecheck after Soft 3400+ | done | E2E phase3406 |
| e2e-all lists 3401–3408; gaps=3 | done | E2E phase3407 |
| Soft-complete STATUS through 3408 | done | E2E phase3408 |
| Honesty milestone 8750 + note | done | E2E phase3409 |
| Milestone 8750 on all honesty endpoints | done | E2E phase3410 |
| UI honesty milestone at 8750 | done | E2E phase3411 |
| STATUS milestone 8750 | done | E2E phase3412 |
| Soft marker 3416 | done | E2E phase3413 |
| Typecheck after milestone 8750 | done | E2E phase3414 |
| e2e-all lists 3409–3416; gaps=3 | done | E2E phase3415 |
| Soft-complete STATUS through 3416 | done | E2E phase3416 |
| soft_fertig_session_storage_clear_roster API | done | E2E phase3417 |
| UI session storage clear roster detail + download/copy | done | E2E phase3418 |
| Client soft_fertig_session_storage_clear_roster type | done | E2E phase3419 |
| STATUS session_storage_clear_roster | done | E2E phase3420 |
| Soft marker 3424 | done | E2E phase3421 |
| Typecheck after session_storage_clear_roster | done | E2E phase3422 |
| e2e-all lists 3417–3424; gaps=3 | done | E2E phase3423 |
| Soft-complete STATUS through 3424 | done | E2E phase3424 |
| Honesty milestone 8800 + note | done | E2E phase3425 |
| Milestone 8800 on all honesty endpoints | done | E2E phase3426 |
| UI honesty milestone at 8800 | done | E2E phase3427 |
| STATUS milestone 8800 | done | E2E phase3428 |
| Soft marker 3432 | done | E2E phase3429 |
| Typecheck after milestone 8800 | done | E2E phase3430 |
| e2e-all lists 3425–3432; gaps=3 | done | E2E phase3431 |
| Soft-complete STATUS through 3432 | done | E2E phase3432 |
| session_storage_clear_roster in Export/Bundle | done | E2E phase3433 |
| UI session_storage_clear_roster bundle section | done | E2E phase3434 |
| Export/bundle titles/notes session_storage_clear_roster | done | E2E phase3435 |
| STATUS session_storage_clear_roster export | done | E2E phase3436 |
| Soft marker 3440 | done | E2E phase3437 |
| Typecheck after session_storage_clear_roster export | done | E2E phase3438 |
| e2e-all lists 3433–3440; gaps=3 | done | E2E phase3439 |
| Soft-complete STATUS through 3440 | done | E2E phase3440 |
| Honesty milestone 8850 + note | done | E2E phase3441 |
| Milestone 8850 on all honesty endpoints | done | E2E phase3442 |
| UI honesty milestone at 8850 | done | E2E phase3443 |
| STATUS milestone 8850 | done | E2E phase3444 |
| Soft marker 3448 | done | E2E phase3445 |
| Typecheck after milestone 8850 | done | E2E phase3446 |
| e2e-all lists 3441–3448; gaps=3 | done | E2E phase3447 |
| Soft-complete STATUS through 3448 | done | E2E phase3448 |
| Honesty surface schema 3.3 (session_storage_clear_roster) | done | E2E phase3449 |
| UI surface version note at 3.3 | done | E2E phase3450 |
| Client surface + session_storage_clear_roster types | done | E2E phase3451 |
| STATUS schema 3.3 | done | E2E phase3452 |
| Soft marker 3456 | done | E2E phase3453 |
| Typecheck after schema 3.3 | done | E2E phase3454 |
| e2e-all lists 3449–3456; gaps=3 | done | E2E phase3455 |
| Soft-complete STATUS through 3456 | done | E2E phase3456 |
| Honesty milestone 8900 + note | done | E2E phase3457 |
| Milestone 8900 on all honesty endpoints | done | E2E phase3458 |
| UI honesty milestone at 8900 | done | E2E phase3459 |
| STATUS milestone 8900 | done | E2E phase3460 |
| Soft marker 3464 | done | E2E phase3461 |
| Typecheck after milestone 8900 | done | E2E phase3462 |
| e2e-all lists 3457–3464; gaps=3 | done | E2E phase3463 |
| Soft-complete STATUS through 3464 | done | E2E phase3464 |
| session_storage_clear_roster sessionStorage | done | E2E phase3465 |
| UI session_storage_clear sessionStorage persist/restore/clear | done | E2E phase3466 |
| Clear catalogs session_storage_clear_roster | done | E2E phase3467 |
| STATUS session_storage_clear sessionStorage | done | E2E phase3468 |
| Soft marker 3472 | done | E2E phase3469 |
| Typecheck after session_storage_clear sessionStorage | done | E2E phase3470 |
| e2e-all lists 3465–3472; gaps=3 | done | E2E phase3471 |
| Soft-complete STATUS through 3472 | done | E2E phase3472 |
| Honesty milestone 8950 + note | done | E2E phase3473 |
| Milestone 8950 on all honesty endpoints | done | E2E phase3474 |
| UI honesty milestone at 8950 | done | E2E phase3475 |
| STATUS milestone 8950 | done | E2E phase3476 |
| Soft marker 3480 | done | E2E phase3477 |
| Typecheck after milestone 8950 | done | E2E phase3478 |
| e2e-all lists 3473–3480; gaps=3 | done | E2E phase3479 |
| Soft-complete STATUS through 3480 | done | E2E phase3480 |
| Soft 3480+ honesty surface still complete | done | E2E phase3481 |
| UI Soft 3480+ session storage clear roster | done | E2E phase3482 |
| Client Soft 3480+ session_storage_clear type | done | E2E phase3483 |
| STATUS Soft 3480+ | done | E2E phase3484 |
| Soft marker 3488 | done | E2E phase3485 |
| Typecheck after Soft 3480+ | done | E2E phase3486 |
| e2e-all lists 3481–3488; gaps=3 | done | E2E phase3487 |
| Soft-complete STATUS through 3488 | done | E2E phase3488 |
| Honesty milestone 9000 + note | done | E2E phase3489 |
| Milestone 9000 on all honesty endpoints | done | E2E phase3490 |
| UI honesty milestone at 9000 | done | E2E phase3491 |
| STATUS milestone 9000 | done | E2E phase3492 |
| Soft marker 3496 | done | E2E phase3493 |
| Typecheck after milestone 9000 | done | E2E phase3494 |
| e2e-all lists 3489–3496; gaps=3 | done | E2E phase3495 |
| Soft-complete STATUS through 3496 | done | E2E phase3496 |
| soft_fertig_honesty_operator_brief_roster API | done | E2E phase3497 |
| UI honesty operator brief roster detail + download/copy | done | E2E phase3498 |
| Client soft_fertig_honesty_operator_brief_roster type | done | E2E phase3499 |
| STATUS honesty_operator_brief_roster | done | E2E phase3500 |
| Soft marker 3504 | done | E2E phase3501 |
| Typecheck after honesty_operator_brief_roster | done | E2E phase3502 |
| e2e-all lists 3497–3504; gaps=3 | done | E2E phase3503 |
| Soft-complete STATUS through 3504 | done | E2E phase3504 |
| Honesty milestone 9050 + note | done | E2E phase3505 |
| Milestone 9050 on all honesty endpoints | done | E2E phase3506 |
| UI honesty milestone at 9050 | done | E2E phase3507 |
| STATUS milestone 9050 | done | E2E phase3508 |
| Soft marker 3512 | done | E2E phase3509 |
| Typecheck after milestone 9050 | done | E2E phase3510 |
| e2e-all lists 3505–3512; gaps=3 | done | E2E phase3511 |
| Soft-complete STATUS through 3512 | done | E2E phase3512 |
| honesty_operator_brief_roster in Export/Bundle | done | E2E phase3513 |
| UI honesty_operator_brief_roster bundle section | done | E2E phase3514 |
| Export/bundle titles/notes honesty_operator_brief_roster | done | E2E phase3515 |
| STATUS honesty_operator_brief_roster export | done | E2E phase3516 |
| Soft marker 3520 | done | E2E phase3517 |
| Typecheck after honesty_operator_brief_roster export | done | E2E phase3518 |
| e2e-all lists 3513–3520; gaps=3 | done | E2E phase3519 |
| Soft-complete STATUS through 3520 | done | E2E phase3520 |
| Honesty milestone 9100 + note | done | E2E phase3521 |
| Milestone 9100 on all honesty endpoints | done | E2E phase3522 |
| UI honesty milestone at 9100 | done | E2E phase3523 |
| STATUS milestone 9100 | done | E2E phase3524 |
| Soft marker 3528 | done | E2E phase3525 |
| Typecheck after milestone 9100 | done | E2E phase3526 |
| e2e-all lists 3521–3528; gaps=3 | done | E2E phase3527 |
| Soft-complete STATUS through 3528 | done | E2E phase3528 |
| Honesty surface schema 3.4 (honesty_operator_brief_roster) | done | E2E phase3529 |
| UI surface version note at 3.4 | done | E2E phase3530 |
| Client surface + honesty_operator_brief_roster types | done | E2E phase3531 |
| STATUS schema 3.4 | done | E2E phase3532 |
| Soft marker 3536 | done | E2E phase3533 |
| Typecheck after schema 3.4 | done | E2E phase3534 |
| e2e-all lists 3529–3536; gaps=3 | done | E2E phase3535 |
| Soft-complete STATUS through 3536 | done | E2E phase3536 |
| Honesty milestone 9150 + note | done | E2E phase3537 |
| Milestone 9150 on all honesty endpoints | done | E2E phase3538 |
| UI honesty milestone at 9150 | done | E2E phase3539 |
| STATUS milestone 9150 | done | E2E phase3540 |
| Soft marker 3544 | done | E2E phase3541 |
| Typecheck after milestone 9150 | done | E2E phase3542 |
| e2e-all lists 3537–3544; gaps=3 | done | E2E phase3543 |
| Soft-complete STATUS through 3544 | done | E2E phase3544 |
| honesty_operator_brief_roster sessionStorage | done | E2E phase3545 |
| UI honesty_operator_brief sessionStorage persist/restore/clear | done | E2E phase3546 |
| Clear catalogs honesty_operator_brief_roster | done | E2E phase3547 |
| STATUS honesty_operator_brief sessionStorage | done | E2E phase3548 |
| Soft marker 3552 | done | E2E phase3549 |
| Typecheck after honesty_operator_brief sessionStorage | done | E2E phase3550 |
| e2e-all lists 3545–3552; gaps=3 | done | E2E phase3551 |
| Soft-complete STATUS through 3552 | done | E2E phase3552 |
| Honesty milestone 9200 + note | done | E2E phase3553 |
| Milestone 9200 on all honesty endpoints | done | E2E phase3554 |
| UI honesty milestone at 9200 | done | E2E phase3555 |
| STATUS milestone 9200 | done | E2E phase3556 |
| Soft marker 3560 | done | E2E phase3557 |
| Typecheck after milestone 9200 | done | E2E phase3558 |
| e2e-all lists 3553–3560; gaps=3 | done | E2E phase3559 |
| Soft-complete STATUS through 3560 | done | E2E phase3560 |
| Soft 3560+ honesty surface still complete | done | E2E phase3561 |
| UI Soft 3560+ honesty operator brief roster | done | E2E phase3562 |
| Client Soft 3560+ honesty_operator_brief type | done | E2E phase3563 |
| STATUS Soft 3560+ | done | E2E phase3564 |
| Soft marker 3568 | done | E2E phase3565 |
| Typecheck after Soft 3560+ | done | E2E phase3566 |
| e2e-all lists 3561–3568; gaps=3 | done | E2E phase3567 |
| Soft-complete STATUS through 3568 | done | E2E phase3568 |
| Honesty milestone 9250 + note | done | E2E phase3569 |
| Milestone 9250 on all honesty endpoints | done | E2E phase3570 |
| UI honesty milestone at 9250 | done | E2E phase3571 |
| STATUS milestone 9250 | done | E2E phase3572 |
| Soft marker 3576 | done | E2E phase3573 |
| Typecheck after milestone 9250 | done | E2E phase3574 |
| e2e-all lists 3569–3576; gaps=3 | done | E2E phase3575 |
| Soft-complete STATUS through 3576 | done | E2E phase3576 |
| soft_fertig_surface_changelog_meta_roster API | done | E2E phase3577 |
| UI surface changelog meta roster detail + download/copy | done | E2E phase3578 |
| Client soft_fertig_surface_changelog_meta_roster type | done | E2E phase3579 |
| STATUS surface_changelog_meta_roster | done | E2E phase3580 |
| Soft marker 3584 | done | E2E phase3581 |
| Typecheck after surface_changelog_meta_roster | done | E2E phase3582 |
| e2e-all lists 3577–3584; gaps=3 | done | E2E phase3583 |
| Soft-complete STATUS through 3584 | done | E2E phase3584 |
| Honesty milestone 9300 + note | done | E2E phase3585 |
| Milestone 9300 on all honesty endpoints | done | E2E phase3586 |
| UI honesty milestone at 9300 | done | E2E phase3587 |
| STATUS milestone 9300 | done | E2E phase3588 |
| Soft marker 3592 | done | E2E phase3589 |
| Typecheck after milestone 9300 | done | E2E phase3590 |
| e2e-all lists 3585–3592; gaps=3 | done | E2E phase3591 |
| Soft-complete STATUS through 3592 | done | E2E phase3592 |
| surface_changelog_meta_roster in Export/Bundle | done | E2E phase3593 |
| UI surface_changelog_meta_roster bundle section | done | E2E phase3594 |
| Export/bundle titles/notes surface_changelog_meta_roster | done | E2E phase3595 |
| STATUS surface_changelog_meta_roster export | done | E2E phase3596 |
| Soft marker 3600 | done | E2E phase3597 |
| Typecheck after surface_changelog_meta_roster export | done | E2E phase3598 |
| e2e-all lists 3593–3600; gaps=3 | done | E2E phase3599 |
| Soft-complete STATUS through 3600 | done | E2E phase3600 |
| Honesty milestone 9350 + note | done | E2E phase3601 |
| Milestone 9350 on all honesty endpoints | done | E2E phase3602 |
| UI honesty milestone at 9350 | done | E2E phase3603 |
| STATUS milestone 9350 | done | E2E phase3604 |
| Soft marker 3608 | done | E2E phase3605 |
| Typecheck after milestone 9350 | done | E2E phase3606 |
| e2e-all lists 3601–3608; gaps=3 | done | E2E phase3607 |
| Soft-complete STATUS through 3608 | done | E2E phase3608 |
| Honesty surface schema 3.5 (surface_changelog_meta_roster) | done | E2E phase3609 |
| UI surface version note at 3.5 | done | E2E phase3610 |
| Client surface + surface_changelog_meta_roster types | done | E2E phase3611 |
| STATUS schema 3.5 | done | E2E phase3612 |
| Soft marker 3616 | done | E2E phase3613 |
| Typecheck after schema 3.5 | done | E2E phase3614 |
| e2e-all lists 3609–3616; gaps=3 | done | E2E phase3615 |
| Soft-complete STATUS through 3616 | done | E2E phase3616 |
| Honesty milestone 9400 + note | done | E2E phase3617 |
| Milestone 9400 on all honesty endpoints | done | E2E phase3618 |
| UI honesty milestone at 9400 | done | E2E phase3619 |
| STATUS milestone 9400 | done | E2E phase3620 |
| Soft marker 3624 | done | E2E phase3621 |
| Typecheck after milestone 9400 | done | E2E phase3622 |
| e2e-all lists 3617–3624; gaps=3 | done | E2E phase3623 |
| Soft-complete STATUS through 3624 | done | E2E phase3624 |
| surface_changelog_meta_roster sessionStorage | done | E2E phase3625 |
| UI surface_changelog_meta sessionStorage persist/restore/clear | done | E2E phase3626 |
| Clear catalogs surface_changelog_meta_roster | done | E2E phase3627 |
| STATUS surface_changelog_meta sessionStorage | done | E2E phase3628 |
| Soft marker 3632 | done | E2E phase3629 |
| Typecheck after surface_changelog_meta sessionStorage | done | E2E phase3630 |
| e2e-all lists 3625–3632; gaps=3 | done | E2E phase3631 |
| Soft-complete STATUS through 3632 | done | E2E phase3632 |
| Honesty milestone 9450 + note | done | E2E phase3633 |
| Milestone 9450 on all honesty endpoints | done | E2E phase3634 |
| UI honesty milestone at 9450 | done | E2E phase3635 |
| STATUS milestone 9450 | done | E2E phase3636 |
| Soft marker 3640 | done | E2E phase3637 |
| Typecheck after milestone 9450 | done | E2E phase3638 |
| e2e-all lists 3633–3640; gaps=3 | done | E2E phase3639 |
| Soft-complete STATUS through 3640 | done | E2E phase3640 |
| Soft 3640+ honesty surface still complete | done | E2E phase3641 |
| UI Soft 3640+ surface changelog meta roster | done | E2E phase3642 |
| Client Soft 3640+ surface_changelog_meta type | done | E2E phase3643 |
| STATUS Soft 3640+ | done | E2E phase3644 |
| Soft marker 3648 | done | E2E phase3645 |
| Typecheck after Soft 3640+ | done | E2E phase3646 |
| e2e-all lists 3641–3648; gaps=3 | done | E2E phase3647 |
| Soft-complete STATUS through 3648 | done | E2E phase3648 |
| Honesty milestone 9500 + note | done | E2E phase3649 |
| Milestone 9500 on all honesty endpoints | done | E2E phase3650 |
| UI honesty milestone at 9500 | done | E2E phase3651 |
| STATUS milestone 9500 | done | E2E phase3652 |
| Soft marker 3656 | done | E2E phase3653 |
| Typecheck after milestone 9500 | done | E2E phase3654 |
| e2e-all lists 3649–3656; gaps=3 | done | E2E phase3655 |
| Soft-complete STATUS through 3656 | done | E2E phase3656 |
| soft_fertig_hard_gaps_summary_roster API | done | E2E phase3657 |
| UI hard-gaps summary roster detail + download/copy | done | E2E phase3658 |
| Client soft_fertig_hard_gaps_summary_roster type | done | E2E phase3659 |
| STATUS hard_gaps_summary_roster | done | E2E phase3660 |
| Soft marker 3664 | done | E2E phase3661 |
| Typecheck after hard_gaps_summary_roster | done | E2E phase3662 |
| e2e-all lists 3657–3664; gaps=3 | done | E2E phase3663 |
| Soft-complete STATUS through 3664 | done | E2E phase3664 |
| Honesty milestone 9550 + note | done | E2E phase3665 |
| Milestone 9550 on all honesty endpoints | done | E2E phase3666 |
| UI honesty milestone at 9550 | done | E2E phase3667 |
| STATUS milestone 9550 | done | E2E phase3668 |
| Soft marker 3672 | done | E2E phase3669 |
| Typecheck after milestone 9550 | done | E2E phase3670 |
| e2e-all lists 3665–3672; gaps=3 | done | E2E phase3671 |
| Soft-complete STATUS through 3672 | done | E2E phase3672 |
| hard_gaps_summary_roster in Export/Bundle | done | E2E phase3673 |
| UI hard_gaps_summary_roster bundle section | done | E2E phase3674 |
| Export/bundle titles/notes hard_gaps_summary_roster | done | E2E phase3675 |
| STATUS hard_gaps_summary_roster export | done | E2E phase3676 |
| Soft marker 3680 | done | E2E phase3677 |
| Typecheck after hard_gaps_summary_roster export | done | E2E phase3678 |
| e2e-all lists 3673–3680; gaps=3 | done | E2E phase3679 |
| Soft-complete STATUS through 3680 | done | E2E phase3680 |
| Honesty milestone 9600 + note | done | E2E phase3681 |
| Milestone 9600 on all honesty endpoints | done | E2E phase3682 |
| UI honesty milestone at 9600 | done | E2E phase3683 |
| STATUS milestone 9600 | done | E2E phase3684 |
| Soft marker 3688 | done | E2E phase3685 |
| Typecheck after milestone 9600 | done | E2E phase3686 |
| e2e-all lists 3681–3688; gaps=3 | done | E2E phase3687 |
| Soft-complete STATUS through 3688 | done | E2E phase3688 |
| soft_fertig_honesty_surface_version 3.6 | done | E2E phase3689 |
| UI surface schema 3.6 | done | E2E phase3690 |
| Client surface + hard_gaps_summary_roster types | done | E2E phase3691 |
| STATUS schema 3.6 | done | E2E phase3692 |
| Soft marker 3696 | done | E2E phase3693 |
| Typecheck after schema 3.6 | done | E2E phase3694 |
| e2e-all lists 3689–3696; gaps=3 | done | E2E phase3695 |
| Soft-complete STATUS through 3696 | done | E2E phase3696 |
| Honesty milestone 9650 + note | done | E2E phase3697 |
| Milestone 9650 on all honesty endpoints | done | E2E phase3698 |
| UI honesty milestone at 9650 | done | E2E phase3699 |
| STATUS milestone 9650 | done | E2E phase3700 |
| Soft marker 3704 | done | E2E phase3701 |
| Typecheck after milestone 9650 | done | E2E phase3702 |
| e2e-all lists 3697–3704; gaps=3 | done | E2E phase3703 |
| Soft-complete STATUS through 3704 | done | E2E phase3704 |
| hard_gaps_summary_roster in sessionStorage/Clear | done | E2E phase3705 |
| UI hard_gaps_summary_roster sessionStorage | done | E2E phase3706 |
| Clear hard_gaps_summary_roster | done | E2E phase3707 |
| STATUS hard_gaps_summary_roster sessionStorage | done | E2E phase3708 |
| Soft marker 3712 | done | E2E phase3709 |
| Typecheck after hard_gaps_summary_roster session | done | E2E phase3710 |
| e2e-all lists 3705–3712; gaps=3 | done | E2E phase3711 |
| Soft-complete STATUS through 3712 | done | E2E phase3712 |
| Honesty milestone 9700 + note | done | E2E phase3713 |
| Milestone 9700 on all honesty endpoints | done | E2E phase3714 |
| UI honesty milestone at 9700 | done | E2E phase3715 |
| STATUS milestone 9700 | done | E2E phase3716 |
| Soft marker 3720 | done | E2E phase3717 |
| Typecheck after milestone 9700 | done | E2E phase3718 |
| e2e-all lists 3713–3720; gaps=3 | done | E2E phase3719 |
| Soft-complete STATUS through 3720 | done | E2E phase3720 |
| Soft 3720+ honesty surface still complete | done | E2E phase3721 |
| UI Soft 3720+ hard-gaps summary roster | done | E2E phase3722 |
| Client Soft 3720+ hard_gaps_summary type | done | E2E phase3723 |
| STATUS Soft 3720+ | done | E2E phase3724 |
| Soft marker 3728 | done | E2E phase3725 |
| Typecheck after Soft 3720+ | done | E2E phase3726 |
| e2e-all lists 3721–3728; gaps=3 | done | E2E phase3727 |
| Soft-complete STATUS through 3728 | done | E2E phase3728 |
| Honesty milestone 9750 + note | done | E2E phase3729 |
| Milestone 9750 on all honesty endpoints | done | E2E phase3730 |
| UI honesty milestone at 9750 | done | E2E phase3731 |
| STATUS milestone 9750 | done | E2E phase3732 |
| Soft marker 3736 | done | E2E phase3733 |
| Typecheck after milestone 9750 | done | E2E phase3734 |
| e2e-all lists 3729–3736; gaps=3 | done | E2E phase3735 |
| Soft-complete STATUS through 3736 | done | E2E phase3736 |
| soft_fertig_hard_gaps_closure_roster API | done | E2E phase3737 |
| UI hard_gaps_closure_roster | done | E2E phase3738 |
| Client soft_fertig_hard_gaps_closure_roster type | done | E2E phase3739 |
| STATUS hard_gaps_closure_roster | done | E2E phase3740 |
| Soft marker 3744 | done | E2E phase3741 |
| Typecheck after hard_gaps_closure_roster | done | E2E phase3742 |
| e2e-all lists 3737–3744; gaps=3 | done | E2E phase3743 |
| Soft-complete STATUS through 3744 | done | E2E phase3744 |
| Honesty milestone 9800 + note | done | E2E phase3745 |
| Milestone 9800 on all honesty endpoints | done | E2E phase3746 |
| UI honesty milestone at 9800 | done | E2E phase3747 |
| STATUS milestone 9800 | done | E2E phase3748 |
| Soft marker 3752 | done | E2E phase3749 |
| Typecheck after milestone 9800 | done | E2E phase3750 |
| e2e-all lists 3745–3752; gaps=3 | done | E2E phase3751 |
| Soft-complete STATUS through 3752 | done | E2E phase3752 |
| hard_gaps_closure_roster in Export/Bundle | done | E2E phase3753 |
| UI hard_gaps_closure_roster bundle section | done | E2E phase3754 |
| Export/bundle titles/notes hard_gaps_closure_roster | done | E2E phase3755 |
| STATUS hard_gaps_closure_roster export | done | E2E phase3756 |
| Soft marker 3760 | done | E2E phase3757 |
| Typecheck after hard_gaps_closure_roster export | done | E2E phase3758 |
| e2e-all lists 3753–3760; gaps=3 | done | E2E phase3759 |
| Soft-complete STATUS through 3760 | done | E2E phase3760 |
| Honesty milestone 9850 + note | done | E2E phase3761 |
| Milestone 9850 on all honesty endpoints | done | E2E phase3762 |
| UI honesty milestone at 9850 | done | E2E phase3763 |
| STATUS milestone 9850 | done | E2E phase3764 |
| Soft marker 3768 | done | E2E phase3765 |
| Typecheck after milestone 9850 | done | E2E phase3766 |
| e2e-all lists 3761–3768; gaps=3 | done | E2E phase3767 |
| Soft-complete STATUS through 3768 | done | E2E phase3768 |
| Full local E2E runner | done | `webui/scripts/e2e-all.sh` |

## Soft-complete (feature/webui polish track)

Soft 3720+ Checkpoint: hard_gaps_summary_roster cycle complete (schema 3.6 + sessionStorage).

Soft 3640+ Checkpoint: surface_changelog_meta_roster cycle complete (schema 3.5 + sessionStorage).

Soft 3560+ Checkpoint: honesty_operator_brief_roster cycle complete (schema 3.4 + sessionStorage).

WebUI on `feature/webui` remains soft-complete for the polish track.

### Hard-gap honesty/preview track — soft-fertig (phase256); preview slices through 3768

`WEBUI_SOFT_COMPLETE_PHASE=3768`; `WEBUI_HONESTY_MILESTONE=9850`; `soft_fertig_honesty_surface_version=3.6` (Honesty-Surface-Schema 3.6) (+ `honesty_milestone_note` checkpoint text on `/health`, `/res-status`, `/hard-gaps`, summary, closure; UI shows truncated note); `/health` and `/res-status` expose `honesty_milestone` + `soft_fertig_honesty_track` + `hard_gap_count`; `/hard-gaps` (+ `/hard-gaps/summary` compact snapshot with `layout_fidelity_sample_score_percent` / `score_parts_count` / `layout_fidelity_pixel_parity: false` + `layout_fidelity_sample_spacers` / `spacers_with_orientation` / `spacers_with_size_type` / `with_size_policy_expanding` / `with_size_policy_fixed` / `with_size_policy_minimum` + `with_minimum_size` / `with_maximum_size` + `expect_plan_step_count` for iptables/linux24 + `/hard-gaps/closure` with `hard_gap_notes` + `parent_path` + `hard_gap_count` + `honesty_milestone` + `soft_fertig_honesty_track` + `summary_path`) sets `soft_fertig_honesty_track: true` + `honesty_milestone: 9850` + `honesty_paths` / `honesty_paths_count` / `summary_path` (catalog of honesty/preview endpoints; expandable in UI) + `layout_fidelity_sample_*` including spacer + expanding sizePolicy counts on both `/hard-gaps` and summary (UI seeds sample fidelity + spacer/expanding bits on load; **not pixel**; score weights now include `spacers_with_orientation` / `spacers_with_size_type` / `with_size_policy_expanding` — more weights can lower % without feature loss; UI `qtSpacerStyle` + `data-size-type` apply Expanding/Fixed hints; field CSS maps size-h/v Expanding/Minimum/Preferred/Fixed) + `expect_plan_step_ids` / `expect_plan_step_notes` / `expect_plan_step_notes_count` (expandable per-step refusal descriptions; also on GET …/steps `step_notes`) + `ssh_alternative_notes` / `ssh_refusal_path_notes` (expandable SSH BatchMode honesty; also on GET `/ssh-auth`) + `hard_gap_notes` + `hard_gap_closure` + `closure_path` (shown in UI with `hard_gap_count`; **Show hard-gap closure** / **Download closure**, **Show hard-gaps summary** / **Download summary** / **Clear hard-gaps snapshot**, sessionStorage) + `layout_fidelity_path` + `layout_fidelity_signal_catalog` (expandable key list in UI) + `stack_switch_path` + `option_enable_path` + `expect_run_path` + `expect_steps_path` + `expect_steps_refusals_path` + `ssh_auth_path` + `password_ssh_path` + `ssh_batch_mode_only` / `ssh_alternatives` / `ssh_refusal_paths`; soft_fertig_honesty_bundle_sections + UI combined honesty bundle download; soft_fertig_honesty_export_keys catalogs downloadable honesty JSONs; soft_fertig_session_storage_notes (+ count) document each sessionStorage prefix (UI detail + download/copy); UI can download/copy `/hard-gaps` JSON (sessionStorage `fwbweb.hardGaps.*`) and preview/download expect step refusals (incl. `unknown_step_probe`, sessionStorage); soft-fertig track flag shown in UI; `GET /layout-fidelity` / option-schema + rule/iface schemas report heuristic `score_percent` (**not** pixel parity; `score_parts_count` documents weight count — more weights can lower % without feature loss; weights include `with_whats_this` / `with_tooltip` / `with_enabled` / `with_alignment` / `tab_position` / `pages_with_tooltip` plus `stacked_sections` / `with_visible` / `pages_with_buddy_labels` / `sections_with_flat|checkable` / `layout_tree_max_depth`; schemas expose compact summary with `signal_key_count` + `score_parts_count`); `visible=false` keeps `field-ui-hidden` grid holes; `GET /stack-switch` + `GET /option-enable` expose desktop maps; `option_enable` follows bonding→xmit and LOG/ULOG (ipt/ipcop/secuwall); iface Device type writes `options.type` and drives stack (no duplicate type field); Firewall/Interface/Rule UI show rich fidelity + refuse paths + soft-complete phase + enable-rules summary + canonical expect step ids/catalog + probe-step select (incl. unknown) + SSH refusal map; `GET /expect-install-plan/steps` lists refused ids; `GET …/steps/refusals` previews per-step 501 payloads + unknown probe; capabilities carry `canonical_step_ids`; unknown `step=` → `expect_installer_unknown_step`; SSH `batch_mode_only` + `alternatives` + `refusal_paths` (deploy 400 / password 501); read_only fields use `field-ui-readonly`.

- Deploy: manifest `# files:`, OS configlets, external PolicyInstallScript, copyFWB, use_scp, gzip transfer on compress (plan shows −%), capabilities API (+ expect_install_plan / walkthrough pointers), live gate + force_limited, expect stub + raw/expanded configlet preview + ordered expect plan (reg_user + safety_net_acl + download + sessionStorage) + dry walkthrough (preview_only + simulated_at timeline, sessionStorage + download); `POST …/run` (+ optional `step=`) → 501 / step_refused (still **no** expect/SSHSession runtime)
- Options: .ui labels, free QLabel annotations (+ alignment), buddy_labels (external_label controls), enabled/visible/readOnly respect (+ option_enable follow for bonding→xmit_hash and LOG/ULOG on ipt/ipcop/secuwall), QRadio bool, QGroupBox sections (flat/checkable) + QStackedWidget pages (FirewallExtras + InterfaceOptions section chrome + empty pages + stack switcher + stack_switch hints: device-type → `options.type` + stack / use_ULOG follow + `/stack-switch` API with option_enable maps), tooltips + whatsThis + tab page toolTips, page-local QGridLayout + spacers (sizeHint) + column/row stretch + spacing/margins (CSS + page hint) + sizePolicy + min/max size + layout hints + layout_tree + dialog windowTitle/geometry/tab_position/sizeGrip (header WxH + tabs + CSS max-height) + shared `qtGridStyle` + layout-fidelity score on Firewall/Rule/Interface (still **not** full pixel Qt layout)
- SSH: BatchMode only; `GET /ssh-auth`, capabilities.ssh_auth, deploy plan line, `allow_password_auth` → 400, `POST /ssh-auth/password` → 501
- Honesty: UI lists `hard_gap_open` + notes + closure criteria via `fetchHardGaps`; `GET /hard-gaps` documents remaining gaps; layout-fidelity score is coverage of extracted signals only

Still open (hard backlog — **not** soft-fertig):

- Full Qt AdvancedDialog **pixel** layout parity (exact geometry; dialog size + grid spacing since phase226/241; row/col + spacers/sizeHint + stretch + annotations/buddy_labels/alignment + sizePolicy/min/max/enabled/visible/readOnly + option_enable follow + QGroupBox flat + QStackedWidget pages (Firewall+Interface chrome, empty pages, stack switcher, stack_switch hints, fidelity stacked_sections, `/stack-switch`, `/option-enable`) + whatsThis + tab page toolTips + layout_tree + tab_position/sizeGrip since phase165/177/181/189/205/209/213/257–291/345–464; fidelity score since 297; closure criteria since 329)
- Full desktop **FirewallInstaller** expect/SSHSession for Cisco/Juniper/Procurve (plan/preview/walkthrough+timeline/download; run/step endpoint refuses with 501)
- Password/keyboard-interactive SSH (API refuses `allow_password_auth` and `POST /ssh-auth/password`; BatchMode only)

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
| Local E2E phase158 (compile-first toggle) | done | `e2e-phase158.sh` **OK** |
| Local E2E phase159 (res-status) | done | `e2e-phase159.sh` **OK** |
| Local E2E phase160 (force limited installer) | done | `e2e-phase160.sh` **OK** |
| Local E2E phase161 (download plan) | done | `e2e-phase161.sh` **OK** |
| Local E2E phase162 (App force_limited) | done | `e2e-phase162.sh` **OK** |
| Local E2E phase163 (res-status hint) | done | `e2e-phase163.sh` **OK** |
| Local E2E phase164 (reset prefs/backlog) | done | `e2e-phase164.sh` **OK** |
| Local E2E phase165 (QGridLayout meta) | done | `e2e-phase165.sh` **OK** |
| Local E2E phase166 (rule/iface qt-grid) | done | `e2e-phase166.sh` **OK** |
| Local E2E phase167 (expect stub) | done | `e2e-phase167.sh` **OK** |
| Local E2E phase168 (expect steps UI) | done | `e2e-phase168.sh` **OK** |
| Local E2E phase169 (qt grid toggle) | done | `e2e-phase169.sh` **OK** |
| Local E2E phase170 (qt grid pref) | done | `e2e-phase170.sh` **OK** |
| Local E2E phase171 (expect steps details) | done | `e2e-phase171.sh` **OK** |
| Local E2E phase172 (page-local grids) | done | `e2e-phase172.sh` **OK** |
| Local E2E phase173 (dynamic grid template) | done | `e2e-phase173.sh` **OK** |
| Local E2E phase174 (rule/iface grid tmpl) | done | `e2e-phase174.sh` **OK** |
| Local E2E phase175 (qtGrid helper) | done | `e2e-phase175.sh` **OK** |
| Local E2E phase176 (phase165 after extract) | done | `e2e-phase176.sh` **OK** |
| Local E2E phase177 (.ui spacers extract) | done | `e2e-phase177.sh` **OK** |
| Local E2E phase178 (spacer UI) | done | `e2e-phase178.sh` **OK** |
| Local E2E phase179 (gzip transfer) | done | `e2e-phase179.sh` **OK** |
| Local E2E phase180 (SSH BatchMode honesty) | done | `e2e-phase180.sh` **OK** |
| Local E2E phase181 (columnstretch extract) | done | `e2e-phase181.sh` **OK** |
| Local E2E phase182 (columnstretch CSS) | done | `e2e-phase182.sh` **OK** |
| Local E2E phase183 (expect pre/post steps) | done | `e2e-phase183.sh` **OK** |
| Local E2E phase184 (expect configlets UI) | done | `e2e-phase184.sh` **OK** |
| Local E2E phase185 (layout hint UI) | done | `e2e-phase185.sh` **OK** |
| Local E2E phase186 (configlet file API) | done | `e2e-phase186.sh` **OK** |
| Local E2E phase187 (configlet preview UI) | done | `e2e-phase187.sh` **OK** |
| Local E2E phase188 (SSH auth in plan) | done | `e2e-phase188.sh` **OK** |
| Local E2E phase189 (.ui annotations) | done | `e2e-phase189.sh` **OK** |
| Local E2E phase190 (annotation UI) | done | `e2e-phase190.sh` **OK** |
| Local E2E phase191 (rule/iface spacers) | done | `e2e-phase191.sh` **OK** |
| Local E2E phase192 (STATUS soft-complete) | done | `e2e-phase192.sh` **OK** |
| Local E2E phase193 (annotation extents) | done | `e2e-phase193.sh` **OK** |
| Local E2E phase194 (GET /ssh-auth) | done | `e2e-phase194.sh` **OK** |
| Local E2E phase195 (expand configlet) | done | `e2e-phase195.sh` **OK** |
| Local E2E phase196 (expand + sshAuth UI) | done | `e2e-phase196.sh` **OK** |
| Local E2E phase197 (caps ssh_auth) | done | `e2e-phase197.sh` **OK** |
| Local E2E phase198 (password refuse) | done | `e2e-phase198.sh` **OK** |
| Local E2E phase199 (post_config expand) | done | `e2e-phase199.sh` **OK** |
| Local E2E phase200 (STATUS soft-complete) | done | `e2e-phase200.sh` **OK** |
| Local E2E phase201 (expect-install-plan) | done | `e2e-phase201.sh` **OK** |
| Local E2E phase202 (expect plan UI) | done | `e2e-phase202.sh` **OK** |
| Local E2E phase203 (row_stretch extract) | done | `e2e-phase203.sh` **OK** |
| Local E2E phase204 (STATUS soft-complete) | done | `e2e-phase204.sh` **OK** |
| Local E2E phase205 (size_policy extract) | done | `e2e-phase205.sh` **OK** |
| Local E2E phase206 (size_policy CSS) | done | `e2e-phase206.sh` **OK** |
| Local E2E phase207 (expect plan download) | done | `e2e-phase207.sh` **OK** |
| Local E2E phase208 (STATUS soft-complete) | done | `e2e-phase208.sh` **OK** |
| Local E2E phase209 (minimum_size extract) | done | `e2e-phase209.sh` **OK** |
| Local E2E phase210 (minimum_size CSS) | done | `e2e-phase210.sh` **OK** |
| Local E2E phase211 (expect run 501) | done | `e2e-phase211.sh` **OK** |
| Local E2E phase212 (STATUS soft-complete) | done | `e2e-phase212.sh` **OK** |
| Local E2E phase213 (maximum_size extract) | done | `e2e-phase213.sh` **OK** |
| Local E2E phase214 (maximum_size CSS) | done | `e2e-phase214.sh` **OK** |
| Local E2E phase215 (caps expect_install_plan) | done | `e2e-phase215.sh` **OK** |
| Local E2E phase216 (STATUS soft-complete) | done | `e2e-phase216.sh` **OK** |
| Local E2E phase217 (soft_complete marker API) | done | `e2e-phase217.sh` **OK** |
| Local E2E phase218 (soft_complete UI hint) | done | `e2e-phase218.sh` **OK** |
| Local E2E phase219 (marker consistency) | done | `e2e-phase219.sh` **OK** |
| Local E2E phase220 (STATUS soft-complete) | done | `e2e-phase220.sh` **OK** |
| Local E2E phase221 (hard gaps UI) | done | `e2e-phase221.sh` **OK** |
| Local E2E phase222 (compress ratio) | done | `e2e-phase222.sh` **OK** |
| Local E2E phase223 (hard gap wiring) | done | `e2e-phase223.sh` **OK** |
| Local E2E phase224 (STATUS soft-complete) | done | `e2e-phase224.sh` **OK** |
| Local E2E phase225 (GET /hard-gaps) | done | `e2e-phase225.sh` **OK** |
| Local E2E phase226 (dialog chrome) | done | `e2e-phase226.sh` **OK** |
| Local E2E phase227 (dialog title UI) | done | `e2e-phase227.sh` **OK** |
| Local E2E phase228 (STATUS soft-complete) | done | `e2e-phase228.sh` **OK** |
| Local E2E phase229 (dialog geometry CSS) | done | `e2e-phase229.sh` **OK** |
| Local E2E phase230 (fetchHardGaps) | done | `e2e-phase230.sh` **OK** |
| Local E2E phase231 (hard-gaps wiring) | done | `e2e-phase231.sh` **OK** |
| Local E2E phase232 (STATUS soft-complete) | done | `e2e-phase232.sh` **OK** |
| Local E2E phase233 (fetchHardGaps UI) | done | `e2e-phase233.sh` **OK** |
| Local E2E phase234 (geometry header) | done | `e2e-phase234.sh` **OK** |
| Local E2E phase235 (wiring) | done | `e2e-phase235.sh` **OK** |
| Local E2E phase236 (STATUS soft-complete) | done | `e2e-phase236.sh` **OK** |
| Local E2E phase237 (hardGapsNote) | done | `e2e-phase237.sh` **OK** |
| Local E2E phase238 (smoke 179/201/225) | done | `e2e-phase238.sh` **OK** |
| Local E2E phase239 (wiring) | done | `e2e-phase239.sh` **OK** |
| Local E2E phase240 (STATUS soft-complete) | done | `e2e-phase240.sh` **OK** |
| Local E2E phase241 (grid spacing extract) | done | `e2e-phase241.sh` **OK** |
| Local E2E phase242 (spacing CSS) | done | `e2e-phase242.sh` **OK** |
| Local E2E phase243 (spacing wiring) | done | `e2e-phase243.sh` **OK** |
| Local E2E phase244 (STATUS soft-complete) | done | `e2e-phase244.sh` **OK** |
| Local E2E phase245 (rule/iface spacing) | done | `e2e-phase245.sh` **OK** |
| Local E2E phase246 (rule spacing catalog) | done | `e2e-phase246.sh` **OK** |
| Local E2E phase247 (wiring) | done | `e2e-phase247.sh` **OK** |
| Local E2E phase248 (STATUS soft-complete) | done | `e2e-phase248.sh` **OK** |
| Local E2E phase249 (gap page hint) | done | `e2e-phase249.sh` **OK** |
| Local E2E phase250 (smoke spacing) | done | `e2e-phase250.sh` **OK** |
| Local E2E phase251 (wiring) | done | `e2e-phase251.sh` **OK** |
| Local E2E phase252 (STATUS soft-complete) | done | `e2e-phase252.sh` **OK** |
| Local E2E phase253 (expect plan persist) | done | `e2e-phase253.sh` **OK** |
| Local E2E phase254 (soft_fertig flag) | done | `e2e-phase254.sh` **OK** |
| Local E2E phase255 (wiring) | done | `e2e-phase255.sh` **OK** |
| Local E2E phase256 (STATUS soft-fertig) | done | `e2e-phase256.sh` **OK** |
| Local E2E phase257 (spacer sizeHint) | done | `e2e-phase257.sh` **OK** |
| Local E2E phase258 (sizeHint CSS) | done | `e2e-phase258.sh` **OK** |
| Local E2E phase259 (row_stretch) | done | `e2e-phase259.sh` **OK** |
| Local E2E phase260 (alignment) | done | `e2e-phase260.sh` **OK** |
| Local E2E phase261 (expect plan extras) | done | `e2e-phase261.sh` **OK** |
| Local E2E phase262 (wiring) | done | `e2e-phase262.sh` **OK** |
| Local E2E phase263 (soft marker 264) | done | `e2e-phase263.sh` **OK** |
| Local E2E phase264 (STATUS soft-complete) | done | `e2e-phase264.sh` **OK** |
| Local E2E phase265 (QGroupBox flat/checkable) | done | `e2e-phase265.sh` **OK** |
| Local E2E phase266 (groupbox UI) | done | `e2e-phase266.sh` **OK** |
| Local E2E phase267 (layout_tree) | done | `e2e-phase267.sh` **OK** |
| Local E2E phase268 (expect walkthrough) | done | `e2e-phase268.sh` **OK** |
| Local E2E phase269 (walkthrough/password UI) | done | `e2e-phase269.sh` **OK** |
| Local E2E phase270 (wiring) | done | `e2e-phase270.sh` **OK** |
| Local E2E phase271 (soft marker 272) | done | `e2e-phase271.sh` **OK** |
| Local E2E phase272 (STATUS soft-complete) | done | `e2e-phase272.sh` **OK** |
| Local E2E phase273 (buddy_labels) | done | `e2e-phase273.sh` **OK** |
| Local E2E phase274 (buddy UI) | done | `e2e-phase274.sh` **OK** |
| Local E2E phase275 (tab_position) | done | `e2e-phase275.sh` **OK** |
| Local E2E phase276 (buddy CSS) | done | `e2e-phase276.sh` **OK** |
| Local E2E phase277 (wiring) | done | `e2e-phase277.sh` **OK** |
| Local E2E phase278 (soft marker 280) | done | `e2e-phase278.sh` **OK** |
| Local E2E phase279 (STATUS mentions) | done | `e2e-phase279.sh` **OK** |
| Local E2E phase280 (STATUS soft-complete) | done | `e2e-phase280.sh` **OK** |
| Local E2E phase281 (enabled/sizeGrip extract) | done | `e2e-phase281.sh` **OK** |
| Local E2E phase282 (enabled/sizeGrip UI) | done | `e2e-phase282.sh` **OK** |
| Local E2E phase283 (tree hint + walkthrough persist) | done | `e2e-phase283.sh` **OK** |
| Local E2E phase284 (hard_gap_notes) | done | `e2e-phase284.sh` **OK** |
| Local E2E phase285 (wiring) | done | `e2e-phase285.sh` **OK** |
| Local E2E phase286 (soft marker 288) | done | `e2e-phase286.sh` **OK** |
| Local E2E phase287 (STATUS mentions) | done | `e2e-phase287.sh` **OK** |
| Local E2E phase288 (STATUS soft-complete) | done | `e2e-phase288.sh` **OK** |
| Local E2E phase289 (hard_gap_notes UI) | done | `e2e-phase289.sh` **OK** |
| Local E2E phase290 (expect step refuse) | done | `e2e-phase290.sh` **OK** |
| Local E2E phase291 (visible wiring) | done | `e2e-phase291.sh` **OK** |
| Local E2E phase292 (wiring) | done | `e2e-phase292.sh` **OK** |
| Local E2E phase293 (soft marker 296) | done | `e2e-phase293.sh` **OK** |
| Local E2E phase294 (STATUS mentions) | done | `e2e-phase294.sh` **OK** |
| Local E2E phase295 (typecheck) | done | `e2e-phase295.sh` **OK** |
| Local E2E phase296 (STATUS soft-complete) | done | `e2e-phase296.sh` **OK** |
| Local E2E phase297 (layout-fidelity API) | done | `e2e-phase297.sh` **OK** |
| Local E2E phase298 (fidelity UI) | done | `e2e-phase298.sh` **OK** |
| Local E2E phase299 (fidelity honesty) | done | `e2e-phase299.sh` **OK** |
| Local E2E phase300 (wiring) | done | `e2e-phase300.sh` **OK** |
| Local E2E phase301 (soft marker 304) | done | `e2e-phase301.sh` **OK** |
| Local E2E phase302 (STATUS mentions) | done | `e2e-phase302.sh` **OK** |
| Local E2E phase303 (multi-platform fidelity) | done | `e2e-phase303.sh` **OK** |
| Local E2E phase304 (STATUS soft-complete) | done | `e2e-phase304.sh` **OK** |
| Local E2E phase305 (walkthrough timeline) | done | `e2e-phase305.sh` **OK** |
| Local E2E phase306 (timeline UI) | done | `e2e-phase306.sh` **OK** |
| Local E2E phase307 (fidelity links) | done | `e2e-phase307.sh` **OK** |
| Local E2E phase308 (wiring) | done | `e2e-phase308.sh` **OK** |
| Local E2E phase309 (soft marker 312) | done | `e2e-phase309.sh` **OK** |
| Local E2E phase310 (STATUS mentions) | done | `e2e-phase310.sh` **OK** |
| Local E2E phase311 (typecheck) | done | `e2e-phase311.sh` **OK** |
| Local E2E phase312 (STATUS soft-complete) | done | `e2e-phase312.sh` **OK** |
| Local E2E phase313 (walkthrough download) | done | `e2e-phase313.sh` **OK** |
| Local E2E phase314 (rule/iface fidelity) | done | `e2e-phase314.sh` **OK** |
| Local E2E phase315 (wiring) | done | `e2e-phase315.sh` **OK** |
| Local E2E phase316 (soft marker 320) | done | `e2e-phase316.sh` **OK** |
| Local E2E phase317 (STATUS mentions) | done | `e2e-phase317.sh` **OK** |
| Local E2E phase318 (shared fidelity) | done | `e2e-phase318.sh` **OK** |
| Local E2E phase319 (hard gaps still 3) | done | `e2e-phase319.sh` **OK** |
| Local E2E phase320 (STATUS soft-complete) | done | `e2e-phase320.sh` **OK** |
| Local E2E phase321 (rule/iface fidelity UI) | done | `e2e-phase321.sh` **OK** |
| Local E2E phase322 (soft marker 328) | done | `e2e-phase322.sh` **OK** |
| Local E2E phase323 (STATUS mentions) | done | `e2e-phase323.sh` **OK** |
| Local E2E phase324 (all panels fidelity) | done | `e2e-phase324.sh` **OK** |
| Local E2E phase325 (hard gaps still 3) | done | `e2e-phase325.sh` **OK** |
| Local E2E phase326 (typecheck) | done | `e2e-phase326.sh` **OK** |
| Local E2E phase327 (e2e-all list) | done | `e2e-phase327.sh` **OK** |
| Local E2E phase328 (STATUS soft-complete) | done | `e2e-phase328.sh` **OK** |
| Local E2E phase329 (hard_gap_closure) | done | `e2e-phase329.sh` **OK** |
| Local E2E phase330 (closure UI) | done | `e2e-phase330.sh` **OK** |
| Local E2E phase331 (wiring) | done | `e2e-phase331.sh` **OK** |
| Local E2E phase332 (soft marker 336) | done | `e2e-phase332.sh` **OK** |
| Local E2E phase333 (STATUS mentions) | done | `e2e-phase333.sh` **OK** |
| Local E2E phase334 (gaps+closure) | done | `e2e-phase334.sh` **OK** |
| Local E2E phase335 (typecheck) | done | `e2e-phase335.sh` **OK** |
| Local E2E phase336 (STATUS soft-complete) | done | `e2e-phase336.sh` **OK** |
| Local E2E phase337 (/hard-gaps/closure) | done | `e2e-phase337.sh` **OK** |
| Local E2E phase338 (marker 344) | done | `e2e-phase338.sh` **OK** |
| Local E2E phase339 (wiring) | done | `e2e-phase339.sh` **OK** |
| Local E2E phase340 (STATUS mentions) | done | `e2e-phase340.sh` **OK** |
| Local E2E phase341 (hard gaps @ 344) | done | `e2e-phase341.sh` **OK** |
| Local E2E phase342 (e2e-all list) | done | `e2e-phase342.sh` **OK** |
| Local E2E phase343 (closure honesty) | done | `e2e-phase343.sh` **OK** |
| Local E2E phase344 (STATUS soft-complete) | done | `e2e-phase344.sh` **OK** |
| Local E2E phase345 (QStackedWidget extract) | done | `e2e-phase345.sh` **OK** |
| Local E2E phase346 (stacked UI) | done | `e2e-phase346.sh` **OK** |
| Local E2E phase347 (wiring) | done | `e2e-phase347.sh` **OK** |
| Local E2E phase348 (soft marker 352) | done | `e2e-phase348.sh` **OK** |
| Local E2E phase349 (STATUS mentions) | done | `e2e-phase349.sh` **OK** |
| Local E2E phase350 (ipt logging stacks) | done | `e2e-phase350.sh` **OK** |
| Local E2E phase351 (typecheck) | done | `e2e-phase351.sh` **OK** |
| Local E2E phase352 (STATUS soft-complete) | done | `e2e-phase352.sh` **OK** |
| Local E2E phase353 (InterfaceOptions stacked) | done | `e2e-phase353.sh` **OK** |
| Local E2E phase354 (SchemaGroup.sections) | done | `e2e-phase354.sh` **OK** |
| Local E2E phase355 (linux24 iface stacked) | done | `e2e-phase355.sh` **OK** |
| Local E2E phase356 (hard-gap note) | done | `e2e-phase356.sh` **OK** |
| Local E2E phase357 (soft marker 360) | done | `e2e-phase357.sh` **OK** |
| Local E2E phase358 (STATUS mentions) | done | `e2e-phase358.sh` **OK** |
| Local E2E phase359 (typecheck) | done | `e2e-phase359.sh` **OK** |
| Local E2E phase360 (STATUS soft-complete) | done | `e2e-phase360.sh` **OK** |
| Local E2E phase361 (empty stack pages) | done | `e2e-phase361.sh` **OK** |
| Local E2E phase362 (iface stack switcher) | done | `e2e-phase362.sh` **OK** |
| Local E2E phase363 (firewall stack switcher) | done | `e2e-phase363.sh` **OK** |
| Local E2E phase364 (stack CSS) | done | `e2e-phase364.sh` **OK** |
| Local E2E phase365 (client empty flag) | done | `e2e-phase365.sh` **OK** |
| Local E2E phase366 (soft marker 368) | done | `e2e-phase366.sh` **OK** |
| Local E2E phase367 (typecheck) | done | `e2e-phase367.sh` **OK** |
| Local E2E phase368 (STATUS soft-complete) | done | `e2e-phase368.sh` **OK** |
| Local E2E phase369 (stack_switch hints) | done | `e2e-phase369.sh` **OK** |
| Local E2E phase370 (device-type preview) | done | `e2e-phase370.sh` **OK** |
| Local E2E phase371 (use_ULOG follow) | done | `e2e-phase371.sh` **OK** |
| Local E2E phase372 (bsd/pixos maps) | done | `e2e-phase372.sh` **OK** |
| Local E2E phase373 (soft marker 376) | done | `e2e-phase373.sh` **OK** |
| Local E2E phase374 (STATUS mentions) | done | `e2e-phase374.sh` **OK** |
| Local E2E phase375 (typecheck) | done | `e2e-phase375.sh` **OK** |
| Local E2E phase376 (STATUS soft-complete) | done | `e2e-phase376.sh` **OK** |
| Local E2E phase377 (fidelity stacked counts) | done | `e2e-phase377.sh` **OK** |
| Local E2E phase378 (GET /stack-switch) | done | `e2e-phase378.sh` **OK** |
| Local E2E phase379 (hard-gaps path) | done | `e2e-phase379.sh` **OK** |
| Local E2E phase380 (client fetchStackSwitch) | done | `e2e-phase380.sh` **OK** |
| Local E2E phase381 (soft marker 384) | done | `e2e-phase381.sh` **OK** |
| Local E2E phase382 (STATUS mentions) | done | `e2e-phase382.sh` **OK** |
| Local E2E phase383 (typecheck) | done | `e2e-phase383.sh` **OK** |
| Local E2E phase384 (STATUS soft-complete) | done | `e2e-phase384.sh` **OK** |
| Local E2E phase385 (whatsThis extract) | done | `e2e-phase385.sh` **OK** |
| Local E2E phase386 (_infer_type passthrough) | done | `e2e-phase386.sh` **OK** |
| Local E2E phase387 (OptionField whats_this) | done | `e2e-phase387.sh` **OK** |
| Local E2E phase388 (hard-gap paths UI) | done | `e2e-phase388.sh` **OK** |
| Local E2E phase389 (soft marker 392) | done | `e2e-phase389.sh` **OK** |
| Local E2E phase390 (STATUS mentions) | done | `e2e-phase390.sh` **OK** |
| Local E2E phase391 (typecheck) | done | `e2e-phase391.sh` **OK** |
| Local E2E phase392 (STATUS soft-complete) | done | `e2e-phase392.sh` **OK** |
| Local E2E phase393 (readOnly extract) | done | `e2e-phase393.sh` **OK** |
| Local E2E phase394 (OptionField read_only) | done | `e2e-phase394.sh` **OK** |
| Local E2E phase395 (expect/password paths) | done | `e2e-phase395.sh` **OK** |
| Local E2E phase396 (501 paths UI) | done | `e2e-phase396.sh` **OK** |
| Local E2E phase397 (soft marker 400) | done | `e2e-phase397.sh` **OK** |
| Local E2E phase398 (STATUS mentions) | done | `e2e-phase398.sh` **OK** |
| Local E2E phase399 (typecheck) | done | `e2e-phase399.sh` **OK** |
| Local E2E phase400 (STATUS soft-complete) | done | `e2e-phase400.sh` **OK** |
| Local E2E phase401 (tab page toolTip) | done | `e2e-phase401.sh` **OK** |
| Local E2E phase402 (schema group.tooltip) | done | `e2e-phase402.sh` **OK** |
| Local E2E phase403 (tab button titles) | done | `e2e-phase403.sh` **OK** |
| Local E2E phase404 (client/fidelity tooltips) | done | `e2e-phase404.sh` **OK** |
| Local E2E phase405 (soft marker 408) | done | `e2e-phase405.sh` **OK** |
| Local E2E phase406 (STATUS mentions) | done | `e2e-phase406.sh` **OK** |
| Local E2E phase407 (typecheck) | done | `e2e-phase407.sh` **OK** |
| Local E2E phase408 (STATUS soft-complete) | done | `e2e-phase408.sh` **OK** |
| Local E2E phase409 (option_enable hints) | done | `e2e-phase409.sh` **OK** |
| Local E2E phase410 (option_enable UI) | done | `e2e-phase410.sh` **OK** |
| Local E2E phase411 (soft marker 416) | done | `e2e-phase411.sh` **OK** |
| Local E2E phase412 (STATUS mentions) | done | `e2e-phase412.sh` **OK** |
| Local E2E phase413 (typecheck) | done | `e2e-phase413.sh` **OK** |
| Local E2E phase414 (e2e-all list) | done | `e2e-phase414.sh` **OK** |
| Local E2E phase415 (option_enable table) | done | `e2e-phase415.sh` **OK** |
| Local E2E phase416 (STATUS soft-complete) | done | `e2e-phase416.sh` **OK** |
| Local E2E phase417 (ipt option_enable) | done | `e2e-phase417.sh` **OK** |
| Local E2E phase418 (FirewallExtras enable UI) | done | `e2e-phase418.sh` **OK** |
| Local E2E phase419 (soft marker 424) | done | `e2e-phase419.sh` **OK** |
| Local E2E phase420 (STATUS mentions) | done | `e2e-phase420.sh` **OK** |
| Local E2E phase421 (typecheck) | done | `e2e-phase421.sh` **OK** |
| Local E2E phase422 (e2e-all list) | done | `e2e-phase422.sh` **OK** |
| Local E2E phase423 (OPTION_OPTION_ENABLE) | done | `e2e-phase423.sh` **OK** |
| Local E2E phase424 (STATUS soft-complete) | done | `e2e-phase424.sh` **OK** |
| Local E2E phase425 (shared LOG/ULOG enable) | done | `e2e-phase425.sh` **OK** |
| Local E2E phase426 (/stack-switch enable) | done | `e2e-phase426.sh` **OK** |
| Local E2E phase427 (client enable types) | done | `e2e-phase427.sh` **OK** |
| Local E2E phase428 (soft marker 432) | done | `e2e-phase428.sh` **OK** |
| Local E2E phase429 (STATUS mentions) | done | `e2e-phase429.sh` **OK** |
| Local E2E phase430 (typecheck) | done | `e2e-phase430.sh` **OK** |
| Local E2E phase431 (e2e-all list) | done | `e2e-phase431.sh` **OK** |
| Local E2E phase432 (STATUS soft-complete) | done | `e2e-phase432.sh` **OK** |
| Local E2E phase433 (enable rules summary) | done | `e2e-phase433.sh` **OK** |
| Local E2E phase434 (field-ui-readonly) | done | `e2e-phase434.sh` **OK** |
| Local E2E phase435 (soft marker 440) | done | `e2e-phase435.sh` **OK** |
| Local E2E phase436 (STATUS mentions) | done | `e2e-phase436.sh` **OK** |
| Local E2E phase437 (typecheck) | done | `e2e-phase437.sh` **OK** |
| Local E2E phase438 (e2e-all list) | done | `e2e-phase438.sh` **OK** |
| Local E2E phase439 (hard gaps @ 440) | done | `e2e-phase439.sh` **OK** |
| Local E2E phase440 (STATUS soft-complete) | done | `e2e-phase440.sh` **OK** |
| Local E2E phase441 (options.type enum) | done | `e2e-phase441.sh` **OK** |
| Local E2E phase442 (device type write) | done | `e2e-phase442.sh` **OK** |
| Local E2E phase443 (soft marker 448) | done | `e2e-phase443.sh` **OK** |
| Local E2E phase444 (STATUS mentions) | done | `e2e-phase444.sh` **OK** |
| Local E2E phase445 (typecheck) | done | `e2e-phase445.sh` **OK** |
| Local E2E phase446 (e2e-all list) | done | `e2e-phase446.sh` **OK** |
| Local E2E phase447 (hard gaps @ 448) | done | `e2e-phase447.sh` **OK** |
| Local E2E phase448 (STATUS soft-complete) | done | `e2e-phase448.sh` **OK** |
| Local E2E phase449 (dedupe type field) | done | `e2e-phase449.sh` **OK** |
| Local E2E phase450 (soft marker 456) | done | `e2e-phase450.sh` **OK** |
| Local E2E phase451 (STATUS mentions) | done | `e2e-phase451.sh` **OK** |
| Local E2E phase452 (typecheck) | done | `e2e-phase452.sh` **OK** |
| Local E2E phase453 (e2e-all list) | done | `e2e-phase453.sh` **OK** |
| Local E2E phase454 (hard gaps @ 456) | done | `e2e-phase454.sh` **OK** |
| Local E2E phase455 (health soft phase) | done | `e2e-phase455.sh` **OK** |
| Local E2E phase456 (STATUS soft-complete) | done | `e2e-phase456.sh` **OK** |
| Local E2E phase457 (GET /option-enable) | done | `e2e-phase457.sh` **OK** |
| Local E2E phase458 (option_enable_path UI) | done | `e2e-phase458.sh` **OK** |
| Local E2E phase459 (soft marker 464) | done | `e2e-phase459.sh` **OK** |
| Local E2E phase460 (STATUS mentions) | done | `e2e-phase460.sh` **OK** |
| Local E2E phase461 (typecheck) | done | `e2e-phase461.sh` **OK** |
| Local E2E phase462 (e2e-all list) | done | `e2e-phase462.sh` **OK** |
| Local E2E phase463 (hard gaps @ 464) | done | `e2e-phase463.sh` **OK** |
| Local E2E phase464 (STATUS soft-complete) | done | `e2e-phase464.sh` **OK** |
| Local E2E phase465 (EXPECT_PLAN_STEP_IDS) | done | `e2e-phase465.sh` **OK** |
| Local E2E phase466 (expect steps UI) | done | `e2e-phase466.sh` **OK** |
| Local E2E phase467 (soft marker 472) | done | `e2e-phase467.sh` **OK** |
| Local E2E phase468 (STATUS mentions) | done | `e2e-phase468.sh` **OK** |
| Local E2E phase469 (typecheck) | done | `e2e-phase469.sh` **OK** |
| Local E2E phase470 (e2e-all list) | done | `e2e-phase470.sh` **OK** |
| Local E2E phase471 (hard gaps @ 472) | done | `e2e-phase471.sh` **OK** |
| Local E2E phase472 (STATUS soft-complete) | done | `e2e-phase472.sh` **OK** |
| Local E2E phase473 (canonical_step_ids + unknown) | done | `e2e-phase473.sh` **OK** |
| Local E2E phase474 (GET /steps catalog) | done | `e2e-phase474.sh` **OK** |
| Local E2E phase475 (expect_steps_path) | done | `e2e-phase475.sh` **OK** |
| Local E2E phase476 (steps catalog UI) | done | `e2e-phase476.sh` **OK** |
| Local E2E phase477 (soft marker 480) | done | `e2e-phase477.sh` **OK** |
| Local E2E phase478 (STATUS mentions) | done | `e2e-phase478.sh` **OK** |
| Local E2E phase479 (typecheck + e2e-all) | done | `e2e-phase479.sh` **OK** |
| Local E2E phase480 (STATUS soft-complete) | done | `e2e-phase480.sh` **OK** |
| Local E2E phase481 (refuse parse unknown_step) | done | `e2e-phase481.sh` **OK** |
| Local E2E phase482 (probe-step select UI) | done | `e2e-phase482.sh` **OK** |
| Local E2E phase483 (catalog fallback) | done | `e2e-phase483.sh` **OK** |
| Local E2E phase484 (capabilities canonical ids) | done | `e2e-phase484.sh` **OK** |
| Local E2E phase485 (client canonical types) | done | `e2e-phase485.sh` **OK** |
| Local E2E phase486 (soft marker 488) | done | `e2e-phase486.sh` **OK** |
| Local E2E phase487 (STATUS/typecheck/e2e-all) | done | `e2e-phase487.sh` **OK** |
| Local E2E phase488 (STATUS soft-complete) | done | `e2e-phase488.sh` **OK** |
| Local E2E phase489 (fidelity visible/signal_keys) | done | `e2e-phase489.sh` **OK** |
| Local E2E phase490 (fidelity UI summary) | done | `e2e-phase490.sh` **OK** |
| Local E2E phase491 (ssh batch_mode_only) | done | `e2e-phase491.sh` **OK** |
| Local E2E phase492 (password refuse honesty) | done | `e2e-phase492.sh` **OK** |
| Local E2E phase493 (plan canonical ids line) | done | `e2e-phase493.sh` **OK** |
| Local E2E phase494 (soft marker 496) | done | `e2e-phase494.sh` **OK** |
| Local E2E phase495 (STATUS/typecheck/e2e-all) | done | `e2e-phase495.sh` **OK** |
| Local E2E phase496 (STATUS soft-complete) | done | `e2e-phase496.sh` **OK** |
| Local E2E phase497 (hard-gaps ssh refusal map) | done | `e2e-phase497.sh` **OK** |
| Local E2E phase498 (refusePasswordSsh parse) | done | `e2e-phase498.sh` **OK** |
| Local E2E phase499 (SSH refusal UI) | done | `e2e-phase499.sh` **OK** |
| Local E2E phase500 (walkthrough canonical ids) | done | `e2e-phase500.sh` **OK** |
| Local E2E phase501 (pixel note signal_keys) | done | `e2e-phase501.sh` **OK** |
| Local E2E phase502 (soft marker 504) | done | `e2e-phase502.sh` **OK** |
| Local E2E phase503 (STATUS/typecheck/e2e-all) | done | `e2e-phase503.sh` **OK** |
| Local E2E phase504 (STATUS soft-complete) | done | `e2e-phase504.sh` **OK** |
| Local E2E phase505 (field-ui-hidden) | done | `e2e-phase505.sh` **OK** |
| Local E2E phase506 (layout_tree_max_depth) | done | `e2e-phase506.sh` **OK** |
| Local E2E phase507 (fidelity tree UI) | done | `e2e-phase507.sh` **OK** |
| Local E2E phase508 (hard-gap note tree/hidden) | done | `e2e-phase508.sh` **OK** |
| Local E2E phase509 (soft marker 512) | done | `e2e-phase509.sh` **OK** |
| Local E2E phase510 (STATUS mentions) | done | `e2e-phase510.sh` **OK** |
| Local E2E phase511 (typecheck + e2e-all) | done | `e2e-phase511.sh` **OK** |
| Local E2E phase512 (STATUS soft-complete) | done | `e2e-phase512.sh` **OK** |
| Local E2E phase513 (schema fidelity summary) | done | `e2e-phase513.sh` **OK** |
| Local E2E phase514 (client schema fidelity) | done | `e2e-phase514.sh` **OK** |
| Local E2E phase515 (InterfaceOptions fidelity UI) | done | `e2e-phase515.sh` **OK** |
| Local E2E phase516 (RuleOptions fidelity UI) | done | `e2e-phase516.sh` **OK** |
| Local E2E phase517 (soft marker 520) | done | `e2e-phase517.sh` **OK** |
| Local E2E phase518 (STATUS mentions) | done | `e2e-phase518.sh` **OK** |
| Local E2E phase519 (typecheck + e2e-all) | done | `e2e-phase519.sh` **OK** |
| Local E2E phase520 (STATUS soft-complete) | done | `e2e-phase520.sh` **OK** |
| Local E2E phase521 (signal catalog on hard-gaps) | done | `e2e-phase521.sh` **OK** |
| Local E2E phase522 (hard-gaps JSON download) | done | `e2e-phase522.sh` **OK** |
| Local E2E phase523 (buddy pages in score) | done | `e2e-phase523.sh` **OK** |
| Local E2E phase524 (buddy× UI) | done | `e2e-phase524.sh` **OK** |
| Local E2E phase525 (soft marker 528) | done | `e2e-phase525.sh` **OK** |
| Local E2E phase526 (STATUS mentions) | done | `e2e-phase526.sh` **OK** |
| Local E2E phase527 (typecheck + e2e-all) | done | `e2e-phase527.sh` **OK** |
| Local E2E phase528 (STATUS soft-complete) | done | `e2e-phase528.sh` **OK** |
| Local E2E phase529 (score whatsThis/tooltip) | done | `e2e-phase529.sh` **OK** |
| Local E2E phase530 (signal catalog details) | done | `e2e-phase530.sh` **OK** |
| Local E2E phase531 (soft marker 536) | done | `e2e-phase531.sh` **OK** |
| Local E2E phase532 (STATUS mentions) | done | `e2e-phase532.sh` **OK** |
| Local E2E phase533 (typecheck) | done | `e2e-phase533.sh` **OK** |
| Local E2E phase534 (e2e-all list) | done | `e2e-phase534.sh` **OK** |
| Local E2E phase535 (hard gaps @ 536) | done | `e2e-phase535.sh` **OK** |
| Local E2E phase536 (STATUS soft-complete) | done | `e2e-phase536.sh` **OK** |
| Local E2E phase537 (score_parts_count) | done | `e2e-phase537.sh` **OK** |
| Local E2E phase538 (weights× UI) | done | `e2e-phase538.sh` **OK** |
| Local E2E phase539 (soft marker 544) | done | `e2e-phase539.sh` **OK** |
| Local E2E phase540 (STATUS mentions) | done | `e2e-phase540.sh` **OK** |
| Local E2E phase541 (typecheck) | done | `e2e-phase541.sh` **OK** |
| Local E2E phase542 (e2e-all list) | done | `e2e-phase542.sh` **OK** |
| Local E2E phase543 (hard gaps @ 544) | done | `e2e-phase543.sh` **OK** |
| Local E2E phase544 (STATUS soft-complete) | done | `e2e-phase544.sh` **OK** |
| Local E2E phase545 (steps/refusals API) | done | `e2e-phase545.sh` **OK** |
| Local E2E phase546 (refusals path hard-gaps) | done | `e2e-phase546.sh` **OK** |
| Local E2E phase547 (refusals preview UI) | done | `e2e-phase547.sh` **OK** |
| Local E2E phase548 (soft marker 552) | done | `e2e-phase548.sh` **OK** |
| Local E2E phase549 (STATUS mentions) | done | `e2e-phase549.sh` **OK** |
| Local E2E phase550 (typecheck) | done | `e2e-phase550.sh` **OK** |
| Local E2E phase551 (e2e-all + hard gaps) | done | `e2e-phase551.sh` **OK** |
| Local E2E phase552 (STATUS soft-complete) | done | `e2e-phase552.sh` **OK** |
| Local E2E phase553 (expect note refusals) | done | `e2e-phase553.sh` **OK** |
| Local E2E phase554 (closure path UI) | done | `e2e-phase554.sh` **OK** |
| Local E2E phase555 (soft marker 560) | done | `e2e-phase555.sh` **OK** |
| Local E2E phase556 (STATUS mentions) | done | `e2e-phase556.sh` **OK** |
| Local E2E phase557 (typecheck) | done | `e2e-phase557.sh` **OK** |
| Local E2E phase558 (e2e-all list) | done | `e2e-phase558.sh` **OK** |
| Local E2E phase559 (hard gaps @ 560) | done | `e2e-phase559.sh` **OK** |
| Local E2E phase560 (STATUS soft-complete) | done | `e2e-phase560.sh` **OK** |
| Local E2E phase561 (show hard-gap closure) | done | `e2e-phase561.sh` **OK** |
| Local E2E phase562 (soft marker 568) | done | `e2e-phase562.sh` **OK** |
| Local E2E phase563 (STATUS mentions) | done | `e2e-phase563.sh` **OK** |
| Local E2E phase564 (typecheck) | done | `e2e-phase564.sh` **OK** |
| Local E2E phase565 (e2e-all list) | done | `e2e-phase565.sh` **OK** |
| Local E2E phase566 (hard gaps @ 568) | done | `e2e-phase566.sh` **OK** |
| Local E2E phase567 (closure honesty) | done | `e2e-phase567.sh` **OK** |
| Local E2E phase568 (STATUS soft-complete) | done | `e2e-phase568.sh` **OK** |
| Local E2E phase569 (download closure) | done | `e2e-phase569.sh` **OK** |
| Local E2E phase570 (closure sessionStorage) | done | `e2e-phase570.sh` **OK** |
| Local E2E phase571 (soft marker 576) | done | `e2e-phase571.sh` **OK** |
| Local E2E phase572 (STATUS mentions) | done | `e2e-phase572.sh` **OK** |
| Local E2E phase573 (typecheck) | done | `e2e-phase573.sh` **OK** |
| Local E2E phase574 (e2e-all list) | done | `e2e-phase574.sh` **OK** |
| Local E2E phase575 (hard gaps @ 576) | done | `e2e-phase575.sh` **OK** |
| Local E2E phase576 (STATUS soft-complete) | done | `e2e-phase576.sh` **OK** |
| Local E2E phase577 (closure notes/parent) | done | `e2e-phase577.sh` **OK** |
| Local E2E phase578 (closure notes UI) | done | `e2e-phase578.sh` **OK** |
| Local E2E phase579 (soft marker 584) | done | `e2e-phase579.sh` **OK** |
| Local E2E phase580 (STATUS mentions) | done | `e2e-phase580.sh` **OK** |
| Local E2E phase581 (typecheck) | done | `e2e-phase581.sh` **OK** |
| Local E2E phase582 (e2e-all list) | done | `e2e-phase582.sh` **OK** |
| Local E2E phase583 (hard gaps @ 584) | done | `e2e-phase583.sh` **OK** |
| Local E2E phase584 (STATUS soft-complete) | done | `e2e-phase584.sh` **OK** |
| Local E2E phase585 (unknown_step_probe) | done | `e2e-phase585.sh` **OK** |
| Local E2E phase586 (unknown probe UI) | done | `e2e-phase586.sh` **OK** |
| Local E2E phase587 (soft marker 592) | done | `e2e-phase587.sh` **OK** |
| Local E2E phase588 (STATUS mentions) | done | `e2e-phase588.sh` **OK** |
| Local E2E phase589 (typecheck) | done | `e2e-phase589.sh` **OK** |
| Local E2E phase590 (e2e-all list) | done | `e2e-phase590.sh` **OK** |
| Local E2E phase591 (hard gaps @ 592) | done | `e2e-phase591.sh` **OK** |
| Local E2E phase592 (STATUS soft-complete) | done | `e2e-phase592.sh` **OK** |
| Local E2E phase593 (refusals download/persist) | done | `e2e-phase593.sh` **OK** |
| Local E2E phase594 (soft marker 600) | done | `e2e-phase594.sh` **OK** |
| Local E2E phase595 (STATUS mentions) | done | `e2e-phase595.sh` **OK** |
| Local E2E phase596 (typecheck) | done | `e2e-phase596.sh` **OK** |
| Local E2E phase597 (e2e-all list) | done | `e2e-phase597.sh` **OK** |
| Local E2E phase598 (hard gaps @ 600) | done | `e2e-phase598.sh` **OK** |
| Local E2E phase599 (health soft phase) | done | `e2e-phase599.sh` **OK** |
| Local E2E phase600 (STATUS soft-complete) | done | `e2e-phase600.sh` **OK** |
| Local E2E phase601 (honesty_milestone API) | done | `e2e-phase601.sh` **OK** |
| Local E2E phase602 (honesty milestone UI) | done | `e2e-phase602.sh` **OK** |
| Local E2E phase603 (soft marker 608) | done | `e2e-phase603.sh` **OK** |
| Local E2E phase604 (STATUS mentions) | done | `e2e-phase604.sh` **OK** |
| Local E2E phase605 (typecheck) | done | `e2e-phase605.sh` **OK** |
| Local E2E phase606 (e2e-all list) | done | `e2e-phase606.sh` **OK** |
| Local E2E phase607 (hard gaps @ 608) | done | `e2e-phase607.sh` **OK** |
| Local E2E phase608 (STATUS soft-complete) | done | `e2e-phase608.sh` **OK** |
| Local E2E phase609 (closure honesty meta) | done | `e2e-phase609.sh` **OK** |
| Local E2E phase610 (honesty_paths) | done | `e2e-phase610.sh` **OK** |
| Local E2E phase611 (soft-fertig UI) | done | `e2e-phase611.sh` **OK** |
| Local E2E phase612 (hard-gaps snapshot) | done | `e2e-phase612.sh` **OK** |
| Local E2E phase613 (client types) | done | `e2e-phase613.sh` **OK** |
| Local E2E phase614 (marker 616 + tsc) | done | `e2e-phase614.sh` **OK** |
| Local E2E phase615 (e2e-all + gaps) | done | `e2e-phase615.sh` **OK** |
| Local E2E phase616 (STATUS soft-complete) | done | `e2e-phase616.sh` **OK** |
| Local E2E phase617 (health honesty) | done | `e2e-phase617.sh` **OK** |
| Local E2E phase618 (res-status honesty) | done | `e2e-phase618.sh` **OK** |
| Local E2E phase619 (honesty_paths_count) | done | `e2e-phase619.sh` **OK** |
| Local E2E phase620 (copy hard-gaps JSON) | done | `e2e-phase620.sh` **OK** |
| Local E2E phase621 (client paths_count) | done | `e2e-phase621.sh` **OK** |
| Local E2E phase622 (marker 624 + tsc) | done | `e2e-phase622.sh` **OK** |
| Local E2E phase623 (e2e-all + gaps) | done | `e2e-phase623.sh` **OK** |
| Local E2E phase624 (STATUS soft-complete) | done | `e2e-phase624.sh` **OK** |
| Local E2E phase625 (hard-gaps summary) | done | `e2e-phase625.sh` **OK** |
| Local E2E phase626 (summary_path) | done | `e2e-phase626.sh` **OK** |
| Local E2E phase627 (summary UI) | done | `e2e-phase627.sh` **OK** |
| Local E2E phase628 (client summary) | done | `e2e-phase628.sh` **OK** |
| Local E2E phase629 (STATUS 625–632) | done | `e2e-phase629.sh` **OK** |
| Local E2E phase630 (marker 632 + tsc) | done | `e2e-phase630.sh` **OK** |
| Local E2E phase631 (e2e-all + gaps) | done | `e2e-phase631.sh` **OK** |
| Local E2E phase632 (STATUS soft-complete) | done | `e2e-phase632.sh` **OK** |
| Local E2E phase633 (summary fidelity sample) | done | `e2e-phase633.sh` **OK** |
| Local E2E phase634 (summary fidelity UI) | done | `e2e-phase634.sh` **OK** |
| Local E2E phase635 (client summary fidelity) | done | `e2e-phase635.sh` **OK** |
| Local E2E phase636 (STATUS 633–640) | done | `e2e-phase636.sh` **OK** |
| Local E2E phase637 (marker 640) | done | `e2e-phase637.sh` **OK** |
| Local E2E phase638 (typecheck) | done | `e2e-phase638.sh` **OK** |
| Local E2E phase639 (e2e-all + gaps) | done | `e2e-phase639.sh` **OK** |
| Local E2E phase640 (STATUS soft-complete) | done | `e2e-phase640.sh` **OK** |
| Local E2E phase641 (hard-gaps sample) | done | `e2e-phase641.sh` **OK** |
| Local E2E phase642 (UI seed sample) | done | `e2e-phase642.sh` **OK** |
| Local E2E phase643 (client sample types) | done | `e2e-phase643.sh` **OK** |
| Local E2E phase644 (STATUS 641–648) | done | `e2e-phase644.sh` **OK** |
| Local E2E phase645 (marker 648) | done | `e2e-phase645.sh` **OK** |
| Local E2E phase646 (typecheck) | done | `e2e-phase646.sh` **OK** |
| Local E2E phase647 (e2e-all + gaps) | done | `e2e-phase647.sh` **OK** |
| Local E2E phase648 (STATUS soft-complete) | done | `e2e-phase648.sh` **OK** |
| Local E2E phase649 (milestone 650) | done | `e2e-phase649.sh` **OK** |
| Local E2E phase650 (milestone note endpoints) | done | `e2e-phase650.sh` **OK** |
| Local E2E phase651 (milestone note UI) | done | `e2e-phase651.sh` **OK** |
| Local E2E phase652 (client milestone note) | done | `e2e-phase652.sh` **OK** |
| Local E2E phase653 (STATUS milestone 650) | done | `e2e-phase653.sh` **OK** |
| Local E2E phase654 (marker 656 + tsc) | done | `e2e-phase654.sh` **OK** |
| Local E2E phase655 (e2e-all + gaps) | done | `e2e-phase655.sh` **OK** |
| Local E2E phase656 (STATUS soft-complete) | done | `e2e-phase656.sh` **OK** |
| Local E2E phase657 (expect step notes) | done | `e2e-phase657.sh` **OK** |
| Local E2E phase658 (step notes UI) | done | `e2e-phase658.sh` **OK** |
| Local E2E phase659 (client step notes) | done | `e2e-phase659.sh` **OK** |
| Local E2E phase660 (STATUS 657–664) | done | `e2e-phase660.sh` **OK** |
| Local E2E phase661 (marker 664) | done | `e2e-phase661.sh` **OK** |
| Local E2E phase662 (typecheck) | done | `e2e-phase662.sh` **OK** |
| Local E2E phase663 (e2e-all + gaps) | done | `e2e-phase663.sh` **OK** |
| Local E2E phase664 (STATUS soft-complete) | done | `e2e-phase664.sh` **OK** |
| Local E2E phase665 (step notes count) | done | `e2e-phase665.sh` **OK** |
| Local E2E phase666 (notes=N UI) | done | `e2e-phase666.sh` **OK** |
| Local E2E phase667 (client step counts) | done | `e2e-phase667.sh` **OK** |
| Local E2E phase668 (STATUS 665–672) | done | `e2e-phase668.sh` **OK** |
| Local E2E phase669 (marker 672) | done | `e2e-phase669.sh` **OK** |
| Local E2E phase670 (typecheck) | done | `e2e-phase670.sh` **OK** |
| Local E2E phase671 (e2e-all + gaps) | done | `e2e-phase671.sh` **OK** |
| Local E2E phase672 (STATUS soft-complete) | done | `e2e-phase672.sh` **OK** |
| Local E2E phase673 (SSH notes) | done | `e2e-phase673.sh` **OK** |
| Local E2E phase674 (SSH notes UI) | done | `e2e-phase674.sh` **OK** |
| Local E2E phase675 (client SSH notes) | done | `e2e-phase675.sh` **OK** |
| Local E2E phase676 (STATUS 673–680) | done | `e2e-phase676.sh` **OK** |
| Local E2E phase677 (marker 680) | done | `e2e-phase677.sh` **OK** |
| Local E2E phase678 (typecheck) | done | `e2e-phase678.sh` **OK** |
| Local E2E phase679 (e2e-all + gaps) | done | `e2e-phase679.sh` **OK** |
| Local E2E phase680 (STATUS soft-complete) | done | `e2e-phase680.sh` **OK** |
| Local E2E phase681 (milestone 700) | done | `e2e-phase681.sh` **OK** |
| Local E2E phase682 (milestone 700 endpoints) | done | `e2e-phase682.sh` **OK** |
| Local E2E phase683 (milestone 700 UI) | done | `e2e-phase683.sh` **OK** |
| Local E2E phase684 (STATUS milestone 700) | done | `e2e-phase684.sh` **OK** |
| Local E2E phase685 (marker 688) | done | `e2e-phase685.sh` **OK** |
| Local E2E phase686 (typecheck) | done | `e2e-phase686.sh` **OK** |
| Local E2E phase687 (e2e-all + gaps) | done | `e2e-phase687.sh` **OK** |
| Local E2E phase688 (STATUS soft-complete) | done | `e2e-phase688.sh` **OK** |
| Local E2E phase689 (spacer sizeType fidelity) | done | `e2e-phase689.sh` **OK** |
| Local E2E phase690 (dialog_fields size_type) | done | `e2e-phase690.sh` **OK** |
| Local E2E phase691 (signal_keys spacers) | done | `e2e-phase691.sh` **OK** |
| Local E2E phase692 (STATUS 689–696) | done | `e2e-phase692.sh` **OK** |
| Local E2E phase693 (marker 696) | done | `e2e-phase693.sh` **OK** |
| Local E2E phase694 (typecheck) | done | `e2e-phase694.sh` **OK** |
| Local E2E phase695 (e2e-all + gaps) | done | `e2e-phase695.sh` **OK** |
| Local E2E phase696 (STATUS soft-complete) | done | `e2e-phase696.sh` **OK** |
| Local E2E phase697 (size_type UI) | done | `e2e-phase697.sh` **OK** |
| Local E2E phase698 (CSS size-type) | done | `e2e-phase698.sh` **OK** |
| Local E2E phase699 (client size_type) | done | `e2e-phase699.sh` **OK** |
| Local E2E phase700 (STATUS 697–704) | done | `e2e-phase700.sh` **OK** |
| Local E2E phase701 (marker 704) | done | `e2e-phase701.sh` **OK** |
| Local E2E phase702 (typecheck) | done | `e2e-phase702.sh` **OK** |
| Local E2E phase703 (e2e-all + gaps) | done | `e2e-phase703.sh` **OK** |
| Local E2E phase704 (STATUS soft-complete) | done | `e2e-phase704.sh` **OK** |
| Local E2E phase705 (summary spacer counts) | done | `e2e-phase705.sh` **OK** |
| Local E2E phase706 (summary spacer UI) | done | `e2e-phase706.sh` **OK** |
| Local E2E phase707 (client summary spacers) | done | `e2e-phase707.sh` **OK** |
| Local E2E phase708 (STATUS 705–712) | done | `e2e-phase708.sh` **OK** |
| Local E2E phase709 (marker 712) | done | `e2e-phase709.sh` **OK** |
| Local E2E phase710 (typecheck) | done | `e2e-phase710.sh` **OK** |
| Local E2E phase711 (e2e-all + gaps) | done | `e2e-phase711.sh` **OK** |
| Local E2E phase712 (STATUS soft-complete) | done | `e2e-phase712.sh` **OK** |
| Local E2E phase713 (milestone 750) | done | `e2e-phase713.sh` **OK** |
| Local E2E phase714 (milestone 750 endpoints) | done | `e2e-phase714.sh` **OK** |
| Local E2E phase715 (milestone 750 UI) | done | `e2e-phase715.sh` **OK** |
| Local E2E phase716 (STATUS milestone 750) | done | `e2e-phase716.sh` **OK** |
| Local E2E phase717 (marker 720) | done | `e2e-phase717.sh` **OK** |
| Local E2E phase718 (typecheck) | done | `e2e-phase718.sh` **OK** |
| Local E2E phase719 (e2e-all + gaps) | done | `e2e-phase719.sh` **OK** |
| Local E2E phase720 (STATUS soft-complete) | done | `e2e-phase720.sh` **OK** |
| Local E2E phase721 (hard-gaps spacer sample) | done | `e2e-phase721.sh` **OK** |
| Local E2E phase722 (UI spacer seed) | done | `e2e-phase722.sh` **OK** |
| Local E2E phase723 (client hard-gaps spacers) | done | `e2e-phase723.sh` **OK** |
| Local E2E phase724 (STATUS 721–728) | done | `e2e-phase724.sh` **OK** |
| Local E2E phase725 (marker 728) | done | `e2e-phase725.sh` **OK** |
| Local E2E phase726 (typecheck) | done | `e2e-phase726.sh` **OK** |
| Local E2E phase727 (e2e-all + gaps) | done | `e2e-phase727.sh` **OK** |
| Local E2E phase728 (STATUS soft-complete) | done | `e2e-phase728.sh` **OK** |
| Local E2E phase729 (size_policy expanding) | done | `e2e-phase729.sh` **OK** |
| Local E2E phase730 (expanding UI bit) | done | `e2e-phase730.sh` **OK** |
| Local E2E phase731 (client expanding) | done | `e2e-phase731.sh` **OK** |
| Local E2E phase732 (STATUS 729–736) | done | `e2e-phase732.sh` **OK** |
| Local E2E phase733 (marker 736) | done | `e2e-phase733.sh` **OK** |
| Local E2E phase734 (typecheck) | done | `e2e-phase734.sh` **OK** |
| Local E2E phase735 (e2e-all + gaps) | done | `e2e-phase735.sh` **OK** |
| Local E2E phase736 (STATUS soft-complete) | done | `e2e-phase736.sh` **OK** |
| Local E2E phase737 (milestone 800) | done | `e2e-phase737.sh` **OK** |
| Local E2E phase738 (milestone 800 endpoints) | done | `e2e-phase738.sh` **OK** |
| Local E2E phase739 (milestone 800 UI) | done | `e2e-phase739.sh` **OK** |
| Local E2E phase740 (STATUS milestone 800) | done | `e2e-phase740.sh` **OK** |
| Local E2E phase741 (marker 744) | done | `e2e-phase741.sh` **OK** |
| Local E2E phase742 (typecheck) | done | `e2e-phase742.sh` **OK** |
| Local E2E phase743 (e2e-all + gaps) | done | `e2e-phase743.sh` **OK** |
| Local E2E phase744 (STATUS soft-complete) | done | `e2e-phase744.sh` **OK** |
| Local E2E phase745 (size-policy CSS) | done | `e2e-phase745.sh` **OK** |
| Local E2E phase746 (OptionField size classes) | done | `e2e-phase746.sh` **OK** |
| Local E2E phase747 (marker 752) | done | `e2e-phase747.sh` **OK** |
| Local E2E phase748 (STATUS 745–752) | done | `e2e-phase748.sh` **OK** |
| Local E2E phase749 (typecheck) | done | `e2e-phase749.sh` **OK** |
| Local E2E phase750 (hard gaps @ ≥752) | done | `e2e-phase750.sh` **OK** |
| Local E2E phase751 (e2e-all list) | done | `e2e-phase751.sh` **OK** |
| Local E2E phase752 (STATUS soft-complete) | done | `e2e-phase752.sh` **OK** |
| Local E2E phase753 (milestone 850) | done | `e2e-phase753.sh` **OK** |
| Local E2E phase754 (milestone 850 endpoints) | done | `e2e-phase754.sh` **OK** |
| Local E2E phase755 (milestone 850 UI) | done | `e2e-phase755.sh` **OK** |
| Local E2E phase756 (STATUS milestone 850) | done | `e2e-phase756.sh` **OK** |
| Local E2E phase757 (marker 760) | done | `e2e-phase757.sh` **OK** |
| Local E2E phase758 (typecheck) | done | `e2e-phase758.sh` **OK** |
| Local E2E phase759 (e2e-all + gaps) | done | `e2e-phase759.sh` **OK** |
| Local E2E phase760 (STATUS soft-complete) | done | `e2e-phase760.sh` **OK** |
| Local E2E phase761 (size_policy_fixed) | done | `e2e-phase761.sh` **OK** |
| Local E2E phase762 (UI fixed=) | done | `e2e-phase762.sh` **OK** |
| Local E2E phase763 (client fixed types) | done | `e2e-phase763.sh` **OK** |
| Local E2E phase764 (STATUS 761–768) | done | `e2e-phase764.sh` **OK** |
| Local E2E phase765 (marker 768) | done | `e2e-phase765.sh` **OK** |
| Local E2E phase766 (typecheck) | done | `e2e-phase766.sh` **OK** |
| Local E2E phase767 (e2e-all + gaps) | done | `e2e-phase767.sh` **OK** |
| Local E2E phase768 (STATUS soft-complete) | done | `e2e-phase768.sh` **OK** |
| Local E2E phase769 (spacer CSS Max/Min/Pref) | done | `e2e-phase769.sh` **OK** |
| Local E2E phase770 (qtSpacerStyle sizeTypes) | done | `e2e-phase770.sh` **OK** |
| Local E2E phase771 (STATUS 769–776) | done | `e2e-phase771.sh` **OK** |
| Local E2E phase772 (marker 776) | done | `e2e-phase772.sh` **OK** |
| Local E2E phase773 (typecheck) | done | `e2e-phase773.sh` **OK** |
| Local E2E phase774 (catalog spacers) | done | `e2e-phase774.sh` **OK** |
| Local E2E phase775 (e2e-all + gaps) | done | `e2e-phase775.sh` **OK** |
| Local E2E phase776 (STATUS soft-complete) | done | `e2e-phase776.sh` **OK** |
| Local E2E phase777 (size_policy_minimum) | done | `e2e-phase777.sh` **OK** |
| Local E2E phase778 (UI minimum=) | done | `e2e-phase778.sh` **OK** |
| Local E2E phase779 (client minimum types) | done | `e2e-phase779.sh` **OK** |
| Local E2E phase780 (STATUS 777–784) | done | `e2e-phase780.sh` **OK** |
| Local E2E phase781 (marker 784) | done | `e2e-phase781.sh` **OK** |
| Local E2E phase782 (typecheck) | done | `e2e-phase782.sh` **OK** |
| Local E2E phase783 (e2e-all + gaps) | done | `e2e-phase783.sh` **OK** |
| Local E2E phase784 (STATUS soft-complete) | done | `e2e-phase784.sh` **OK** |
| Local E2E phase785 (min/max size sample) | done | `e2e-phase785.sh` **OK** |
| Local E2E phase786 (UI minSize/maxSize) | done | `e2e-phase786.sh` **OK** |
| Local E2E phase787 (client min/max types) | done | `e2e-phase787.sh` **OK** |
| Local E2E phase788 (STATUS 785–792) | done | `e2e-phase788.sh` **OK** |
| Local E2E phase789 (marker 792) | done | `e2e-phase789.sh` **OK** |
| Local E2E phase790 (typecheck) | done | `e2e-phase790.sh` **OK** |
| Local E2E phase791 (e2e-all + gaps) | done | `e2e-phase791.sh` **OK** |
| Local E2E phase792 (STATUS soft-complete) | done | `e2e-phase792.sh` **OK** |
| Local E2E phase793 (milestone 900) | done | `e2e-phase793.sh` **OK** |
| Local E2E phase794 (milestone 900 endpoints) | done | `e2e-phase794.sh` **OK** |
| Local E2E phase795 (milestone 900 UI) | done | `e2e-phase795.sh` **OK** |
| Local E2E phase796 (STATUS milestone 900) | done | `e2e-phase796.sh` **OK** |
| Local E2E phase797 (marker 800) | done | `e2e-phase797.sh` **OK** |
| Local E2E phase798 (typecheck) | done | `e2e-phase798.sh` **OK** |
| Local E2E phase799 (e2e-all + gaps) | done | `e2e-phase799.sh` **OK** |
| Local E2E phase800 (STATUS soft-complete) | done | `e2e-phase800.sh` **OK** |
| Local E2E phase801 (tree/buddy sample) | done | `e2e-phase801.sh` **OK** |
| Local E2E phase802 (UI treeDepth/buddies) | done | `e2e-phase802.sh` **OK** |
| Local E2E phase803 (client tree/buddy types) | done | `e2e-phase803.sh` **OK** |
| Local E2E phase804 (STATUS 801–808) | done | `e2e-phase804.sh` **OK** |
| Local E2E phase805 (marker 808) | done | `e2e-phase805.sh` **OK** |
| Local E2E phase806 (typecheck) | done | `e2e-phase806.sh` **OK** |
| Local E2E phase807 (e2e-all + gaps) | done | `e2e-phase807.sh` **OK** |
| Local E2E phase808 (STATUS soft-complete) | done | `e2e-phase808.sh` **OK** |
| Local E2E phase809 (size_policy_preferred) | done | `e2e-phase809.sh` **OK** |
| Local E2E phase810 (UI preferred=) | done | `e2e-phase810.sh` **OK** |
| Local E2E phase811 (client preferred types) | done | `e2e-phase811.sh` **OK** |
| Local E2E phase812 (STATUS 809–816) | done | `e2e-phase812.sh` **OK** |
| Local E2E phase813 (marker 816) | done | `e2e-phase813.sh` **OK** |
| Local E2E phase814 (typecheck) | done | `e2e-phase814.sh` **OK** |
| Local E2E phase815 (e2e-all + gaps) | done | `e2e-phase815.sh` **OK** |
| Local E2E phase816 (STATUS soft-complete) | done | `e2e-phase816.sh` **OK** |
| Local E2E phase817 (stacked sample) | done | `e2e-phase817.sh` **OK** |
| Local E2E phase818 (UI stacked bits) | done | `e2e-phase818.sh` **OK** |
| Local E2E phase819 (client stacked types) | done | `e2e-phase819.sh` **OK** |
| Local E2E phase820 (STATUS 817–824) | done | `e2e-phase820.sh` **OK** |
| Local E2E phase821 (marker 824) | done | `e2e-phase821.sh` **OK** |
| Local E2E phase822 (typecheck) | done | `e2e-phase822.sh` **OK** |
| Local E2E phase823 (e2e-all + gaps) | done | `e2e-phase823.sh` **OK** |
| Local E2E phase824 (STATUS soft-complete) | done | `e2e-phase824.sh` **OK** |
| Local E2E phase825 (milestone 950) | done | `e2e-phase825.sh` **OK** |
| Local E2E phase826 (milestone 950 endpoints) | done | `e2e-phase826.sh` **OK** |
| Local E2E phase827 (milestone 950 UI) | done | `e2e-phase827.sh` **OK** |
| Local E2E phase828 (STATUS milestone 950) | done | `e2e-phase828.sh` **OK** |
| Local E2E phase829 (marker 832) | done | `e2e-phase829.sh` **OK** |
| Local E2E phase830 (typecheck) | done | `e2e-phase830.sh` **OK** |
| Local E2E phase831 (e2e-all + gaps) | done | `e2e-phase831.sh` **OK** |
| Local E2E phase832 (STATUS soft-complete) | done | `e2e-phase832.sh` **OK** |
| Local E2E phase833 (flat/checkable/ann) | done | `e2e-phase833.sh` **OK** |
| Local E2E phase834 (UI flat/checkable/ann) | done | `e2e-phase834.sh` **OK** |
| Local E2E phase835 (client section types) | done | `e2e-phase835.sh` **OK** |
| Local E2E phase836 (STATUS 833–840) | done | `e2e-phase836.sh` **OK** |
| Local E2E phase837 (marker 840) | done | `e2e-phase837.sh` **OK** |
| Local E2E phase838 (typecheck) | done | `e2e-phase838.sh` **OK** |
| Local E2E phase839 (e2e-all + gaps) | done | `e2e-phase839.sh` **OK** |
| Local E2E phase840 (STATUS soft-complete) | done | `e2e-phase840.sh` **OK** |
| Local E2E phase841 (min/max score weights) | done | `e2e-phase841.sh` **OK** |
| Local E2E phase842 (sample mirrors min/max) | done | `e2e-phase842.sh` **OK** |
| Local E2E phase843 (STATUS 841–848) | done | `e2e-phase843.sh` **OK** |
| Local E2E phase844 (marker 848) | done | `e2e-phase844.sh` **OK** |
| Local E2E phase845 (typecheck) | done | `e2e-phase845.sh` **OK** |
| Local E2E phase846 (UI min/max bits) | done | `e2e-phase846.sh` **OK** |
| Local E2E phase847 (e2e-all + gaps) | done | `e2e-phase847.sh` **OK** |
| Local E2E phase848 (STATUS soft-complete) | done | `e2e-phase848.sh` **OK** |
| Local E2E phase849 (milestone 1000) | done | `e2e-phase849.sh` **OK** |
| Local E2E phase850 (milestone 1000 endpoints) | done | `e2e-phase850.sh` **OK** |
| Local E2E phase851 (milestone 1000 UI) | done | `e2e-phase851.sh` **OK** |
| Local E2E phase852 (STATUS milestone 1000) | done | `e2e-phase852.sh` **OK** |
| Local E2E phase853 (marker 856) | done | `e2e-phase853.sh` **OK** |
| Local E2E phase854 (typecheck) | done | `e2e-phase854.sh` **OK** |
| Local E2E phase855 (e2e-all + gaps) | done | `e2e-phase855.sh` **OK** |
| Local E2E phase856 (STATUS soft-complete) | done | `e2e-phase856.sh` **OK** |
| Local E2E phase857 (stretch/chrome sample) | done | `e2e-phase857.sh` **OK** |
| Local E2E phase858 (UI stretch/chrome bits) | done | `e2e-phase858.sh` **OK** |
| Local E2E phase859 (client stretch/chrome) | done | `e2e-phase859.sh` **OK** |
| Local E2E phase860 (STATUS 857–864) | done | `e2e-phase860.sh` **OK** |
| Local E2E phase861 (marker 864) | done | `e2e-phase861.sh` **OK** |
| Local E2E phase862 (typecheck) | done | `e2e-phase862.sh` **OK** |
| Local E2E phase863 (e2e-all + gaps) | done | `e2e-phase863.sh` **OK** |
| Local E2E phase864 (STATUS soft-complete) | done | `e2e-phase864.sh` **OK** |
| Local E2E phase865 (milestone 1050) | done | `e2e-phase865.sh` **OK** |
| Local E2E phase866 (milestone 1050 endpoints) | done | `e2e-phase866.sh` **OK** |
| Local E2E phase867 (milestone 1050 UI) | done | `e2e-phase867.sh` **OK** |
| Local E2E phase868 (STATUS milestone 1050) | done | `e2e-phase868.sh` **OK** |
| Local E2E phase869 (marker 872) | done | `e2e-phase869.sh` **OK** |
| Local E2E phase870 (typecheck) | done | `e2e-phase870.sh` **OK** |
| Local E2E phase871 (e2e-all + gaps) | done | `e2e-phase871.sh` **OK** |
| Local E2E phase872 (STATUS soft-complete) | done | `e2e-phase872.sh` **OK** |
| Local E2E phase873 (grid/label/tooltip) | done | `e2e-phase873.sh` **OK** |
| Local E2E phase874 (UI field bits) | done | `e2e-phase874.sh` **OK** |
| Local E2E phase875 (client field types) | done | `e2e-phase875.sh` **OK** |
| Local E2E phase876 (STATUS 873–880) | done | `e2e-phase876.sh` **OK** |
| Local E2E phase877 (marker 880) | done | `e2e-phase877.sh` **OK** |
| Local E2E phase878 (typecheck) | done | `e2e-phase878.sh` **OK** |
| Local E2E phase879 (e2e-all + gaps) | done | `e2e-phase879.sh` **OK** |
| Local E2E phase880 (STATUS soft-complete) | done | `e2e-phase880.sh` **OK** |
| Local E2E phase881 (milestone 1100) | done | `e2e-phase881.sh` **OK** |
| Local E2E phase882 (milestone 1100 endpoints) | done | `e2e-phase882.sh` **OK** |
| Local E2E phase883 (milestone 1100 UI) | done | `e2e-phase883.sh` **OK** |
| Local E2E phase884 (STATUS milestone 1100) | done | `e2e-phase884.sh` **OK** |
| Local E2E phase885 (marker 888) | done | `e2e-phase885.sh` **OK** |
| Local E2E phase886 (typecheck) | done | `e2e-phase886.sh` **OK** |
| Local E2E phase887 (e2e-all + gaps) | done | `e2e-phase887.sh` **OK** |
| Local E2E phase888 (STATUS soft-complete) | done | `e2e-phase888.sh` **OK** |
| Local E2E phase889 (pages/sections/stacks) | done | `e2e-phase889.sh` **OK** |
| Local E2E phase890 (UI pages/sections/stacks) | done | `e2e-phase890.sh` **OK** |
| Local E2E phase891 (client pages/stacks types) | done | `e2e-phase891.sh` **OK** |
| Local E2E phase892 (STATUS 889–896) | done | `e2e-phase892.sh` **OK** |
| Local E2E phase893 (marker 896) | done | `e2e-phase893.sh` **OK** |
| Local E2E phase894 (typecheck) | done | `e2e-phase894.sh` **OK** |
| Local E2E phase895 (e2e-all + gaps) | done | `e2e-phase895.sh` **OK** |
| Local E2E phase896 (STATUS soft-complete) | done | `e2e-phase896.sh` **OK** |
| Local E2E phase897 (milestone 1150) | done | `e2e-phase897.sh` **OK** |
| Local E2E phase898 (milestone 1150 endpoints) | done | `e2e-phase898.sh` **OK** |
| Local E2E phase899 (milestone 1150 UI) | done | `e2e-phase899.sh` **OK** |
| Local E2E phase900 (STATUS milestone 1150) | done | `e2e-phase900.sh` **OK** |
| Local E2E phase901 (marker 904) | done | `e2e-phase901.sh` **OK** |
| Local E2E phase902 (typecheck) | done | `e2e-phase902.sh` **OK** |
| Local E2E phase903 (e2e-all + gaps) | done | `e2e-phase903.sh` **OK** |
| Local E2E phase904 (STATUS soft-complete) | done | `e2e-phase904.sh` **OK** |
| Local E2E phase905 (chrome title/tabPos) | done | `e2e-phase905.sh` **OK** |
| Local E2E phase906 (UI windowTitle/tabPos) | done | `e2e-phase906.sh` **OK** |
| Local E2E phase907 (client title/tabPos) | done | `e2e-phase907.sh` **OK** |
| Local E2E phase908 (STATUS 905–912) | done | `e2e-phase908.sh` **OK** |
| Local E2E phase909 (marker 912) | done | `e2e-phase909.sh` **OK** |
| Local E2E phase910 (typecheck) | done | `e2e-phase910.sh` **OK** |
| Local E2E phase911 (e2e-all + gaps) | done | `e2e-phase911.sh` **OK** |
| Local E2E phase912 (STATUS soft-complete) | done | `e2e-phase912.sh` **OK** |
| Local E2E phase913 (milestone 1200) | done | `e2e-phase913.sh` **OK** |
| Local E2E phase914 (milestone 1200 endpoints) | done | `e2e-phase914.sh` **OK** |
| Local E2E phase915 (milestone 1200 UI) | done | `e2e-phase915.sh` **OK** |
| Local E2E phase916 (STATUS milestone 1200) | done | `e2e-phase916.sh` **OK** |
| Local E2E phase917 (marker 920) | done | `e2e-phase917.sh` **OK** |
| Local E2E phase918 (typecheck) | done | `e2e-phase918.sh` **OK** |
| Local E2E phase919 (e2e-all + gaps) | done | `e2e-phase919.sh` **OK** |
| Local E2E phase920 (STATUS soft-complete) | done | `e2e-phase920.sh` **OK** |
| Local E2E phase921 (fidelity UI truncate) | done | `e2e-phase921.sh` **OK** |
| Local E2E phase922 (truncate helper) | done | `e2e-phase922.sh` **OK** |
| Local E2E phase923 (STATUS 921–928) | done | `e2e-phase923.sh` **OK** |
| Local E2E phase924 (marker 928) | done | `e2e-phase924.sh` **OK** |
| Local E2E phase925 (typecheck) | done | `e2e-phase925.sh` **OK** |
| Local E2E phase926 (clear title) | done | `e2e-phase926.sh` **OK** |
| Local E2E phase927 (e2e-all + gaps) | done | `e2e-phase927.sh` **OK** |
| Local E2E phase928 (STATUS soft-complete) | done | `e2e-phase928.sh` **OK** |
| Local E2E phase929 (milestone 1250) | done | `e2e-phase929.sh` **OK** |
| Local E2E phase930 (milestone 1250 endpoints) | done | `e2e-phase930.sh` **OK** |
| Local E2E phase931 (milestone 1250 UI) | done | `e2e-phase931.sh` **OK** |
| Local E2E phase932 (STATUS milestone 1250) | done | `e2e-phase932.sh` **OK** |
| Local E2E phase933 (marker 936) | done | `e2e-phase933.sh` **OK** |
| Local E2E phase934 (typecheck) | done | `e2e-phase934.sh` **OK** |
| Local E2E phase935 (e2e-all + gaps) | done | `e2e-phase935.sh` **OK** |
| Local E2E phase936 (STATUS soft-complete) | done | `e2e-phase936.sh` **OK** |
| Local E2E phase937 (sizePolicy total) | done | `e2e-phase937.sh` **OK** |
| Local E2E phase938 (UI sizePolicy=) | done | `e2e-phase938.sh` **OK** |
| Local E2E phase939 (client sizePolicy total) | done | `e2e-phase939.sh` **OK** |
| Local E2E phase940 (STATUS 937–944) | done | `e2e-phase940.sh` **OK** |
| Local E2E phase941 (marker 944) | done | `e2e-phase941.sh` **OK** |
| Local E2E phase942 (typecheck) | done | `e2e-phase942.sh` **OK** |
| Local E2E phase943 (e2e-all + gaps) | done | `e2e-phase943.sh` **OK** |
| Local E2E phase944 (STATUS soft-complete) | done | `e2e-phase944.sh` **OK** |
| Local E2E phase945 (milestone 1300) | done | `e2e-phase945.sh` **OK** |
| Local E2E phase946 (milestone 1300 endpoints) | done | `e2e-phase946.sh` **OK** |
| Local E2E phase947 (milestone 1300 UI) | done | `e2e-phase947.sh` **OK** |
| Local E2E phase948 (STATUS milestone 1300) | done | `e2e-phase948.sh` **OK** |
| Local E2E phase949 (marker 952) | done | `e2e-phase949.sh` **OK** |
| Local E2E phase950 (typecheck) | done | `e2e-phase950.sh` **OK** |
| Local E2E phase951 (e2e-all + gaps) | done | `e2e-phase951.sh` **OK** |
| Local E2E phase952 (STATUS soft-complete) | done | `e2e-phase952.sh` **OK** |
| Local E2E phase953 (sample_key_count) | done | `e2e-phase953.sh` **OK** |
| Local E2E phase954 (UI sampleKeys=) | done | `e2e-phase954.sh` **OK** |
| Local E2E phase955 (client sample_key_count) | done | `e2e-phase955.sh` **OK** |
| Local E2E phase956 (STATUS 953–960) | done | `e2e-phase956.sh` **OK** |
| Local E2E phase957 (marker 960) | done | `e2e-phase957.sh` **OK** |
| Local E2E phase958 (typecheck) | done | `e2e-phase958.sh` **OK** |
| Local E2E phase959 (e2e-all + gaps) | done | `e2e-phase959.sh` **OK** |
| Local E2E phase960 (STATUS soft-complete) | done | `e2e-phase960.sh` **OK** |
| Local E2E phase961 (with_visible sample) | done | `e2e-phase961.sh` **OK** |
| Local E2E phase962 (UI visible=) | done | `e2e-phase962.sh` **OK** |
| Local E2E phase963 (client with_visible) | done | `e2e-phase963.sh` **OK** |
| Local E2E phase964 (STATUS 961–968) | done | `e2e-phase964.sh` **OK** |
| Local E2E phase965 (marker 968) | done | `e2e-phase965.sh` **OK** |
| Local E2E phase966 (typecheck) | done | `e2e-phase966.sh` **OK** |
| Local E2E phase967 (e2e-all + gaps) | done | `e2e-phase967.sh` **OK** |
| Local E2E phase968 (STATUS soft-complete) | done | `e2e-phase968.sh` **OK** |
| Local E2E phase969 (spacers_with_size_hint) | done | `e2e-phase969.sh` **OK** |
| Local E2E phase970 (UI sizeHint=) | done | `e2e-phase970.sh` **OK** |
| Local E2E phase971 (client size_hint) | done | `e2e-phase971.sh` **OK** |
| Local E2E phase972 (STATUS 969–976) | done | `e2e-phase972.sh` **OK** |
| Local E2E phase973 (marker 976) | done | `e2e-phase973.sh` **OK** |
| Local E2E phase974 (typecheck) | done | `e2e-phase974.sh` **OK** |
| Local E2E phase975 (e2e-all + gaps) | done | `e2e-phase975.sh` **OK** |
| Local E2E phase976 (STATUS soft-complete) | done | `e2e-phase976.sh` **OK** |
| Local E2E phase977 (signal_key_count) | done | `e2e-phase977.sh` **OK** |
| Local E2E phase978 (UI signalKeys=) | done | `e2e-phase978.sh` **OK** |
| Local E2E phase979 (client signal_key_count) | done | `e2e-phase979.sh` **OK** |
| Local E2E phase980 (STATUS 977–984) | done | `e2e-phase980.sh` **OK** |
| Local E2E phase981 (marker 984) | done | `e2e-phase981.sh` **OK** |
| Local E2E phase982 (typecheck) | done | `e2e-phase982.sh` **OK** |
| Local E2E phase983 (e2e-all + gaps) | done | `e2e-phase983.sh` **OK** |
| Local E2E phase984 (STATUS soft-complete) | done | `e2e-phase984.sh` **OK** |
| Local E2E phase985 (with_whats_this) | done | `e2e-phase985.sh` **OK** |
| Local E2E phase986 (UI whatsThis=) | done | `e2e-phase986.sh` **OK** |
| Local E2E phase987 (client with_whats_this) | done | `e2e-phase987.sh` **OK** |
| Local E2E phase988 (STATUS 985–992) | done | `e2e-phase988.sh` **OK** |
| Local E2E phase989 (marker 992) | done | `e2e-phase989.sh` **OK** |
| Local E2E phase990 (typecheck) | done | `e2e-phase990.sh` **OK** |
| Local E2E phase991 (e2e-all + gaps) | done | `e2e-phase991.sh` **OK** |
| Local E2E phase992 (STATUS soft-complete) | done | `e2e-phase992.sh` **OK** |
| Local E2E phase993 (milestone 1350) | done | `e2e-phase993.sh` **OK** |
| Local E2E phase994 (milestone 1350 endpoints) | done | `e2e-phase994.sh` **OK** |
| Local E2E phase995 (milestone 1350 UI) | done | `e2e-phase995.sh` **OK** |
| Local E2E phase996 (STATUS milestone 1350) | done | `e2e-phase996.sh` **OK** |
| Local E2E phase997 (marker 1000) | done | `e2e-phase997.sh` **OK** |
| Local E2E phase998 (typecheck) | done | `e2e-phase998.sh` **OK** |
| Local E2E phase999 (e2e-all + gaps) | done | `e2e-phase999.sh` **OK** |
| Local E2E phase1000 (STATUS soft-complete) | done | `e2e-phase1000.sh` **OK** |
| Local E2E phase1001 (with_enabled) | done | `e2e-phase1001.sh` **OK** |
| Local E2E phase1002 (UI enabled=) | done | `e2e-phase1002.sh` **OK** |
| Local E2E phase1003 (client with_enabled) | done | `e2e-phase1003.sh` **OK** |
| Local E2E phase1004 (STATUS 1001–1008) | done | `e2e-phase1004.sh` **OK** |
| Local E2E phase1005 (marker 1008) | done | `e2e-phase1005.sh` **OK** |
| Local E2E phase1006 (typecheck) | done | `e2e-phase1006.sh` **OK** |
| Local E2E phase1007 (e2e-all + gaps) | done | `e2e-phase1007.sh` **OK** |
| Local E2E phase1008 (STATUS soft-complete) | done | `e2e-phase1008.sh` **OK** |
| Local E2E phase1009 (with_alignment) | done | `e2e-phase1009.sh` **OK** |
| Local E2E phase1010 (UI align=) | done | `e2e-phase1010.sh` **OK** |
| Local E2E phase1011 (client with_alignment) | done | `e2e-phase1011.sh` **OK** |
| Local E2E phase1012 (STATUS 1009–1016) | done | `e2e-phase1012.sh` **OK** |
| Local E2E phase1013 (marker 1016) | done | `e2e-phase1013.sh` **OK** |
| Local E2E phase1014 (typecheck) | done | `e2e-phase1014.sh` **OK** |
| Local E2E phase1015 (e2e-all + gaps) | done | `e2e-phase1015.sh` **OK** |
| Local E2E phase1016 (STATUS soft-complete) | done | `e2e-phase1016.sh` **OK** |
| Local E2E phase1017 (with_read_only) | done | `e2e-phase1017.sh` **OK** |
| Local E2E phase1018 (UI readOnly=) | done | `e2e-phase1018.sh` **OK** |
| Local E2E phase1019 (client with_read_only) | done | `e2e-phase1019.sh` **OK** |
| Local E2E phase1020 (STATUS 1017–1024) | done | `e2e-phase1020.sh` **OK** |
| Local E2E phase1021 (marker 1024) | done | `e2e-phase1021.sh` **OK** |
| Local E2E phase1022 (typecheck) | done | `e2e-phase1022.sh` **OK** |
| Local E2E phase1023 (e2e-all + gaps) | done | `e2e-phase1023.sh` **OK** |
| Local E2E phase1024 (STATUS soft-complete) | done | `e2e-phase1024.sh` **OK** |
| Local E2E phase1025 (pages_with_row_stretch) | done | `e2e-phase1025.sh` **OK** |
| Local E2E phase1026 (UI rowStretch=) | done | `e2e-phase1026.sh` **OK** |
| Local E2E phase1027 (client pages_with_row_stretch) | done | `e2e-phase1027.sh` **OK** |
| Local E2E phase1028 (STATUS 1025–1032) | done | `e2e-phase1028.sh` **OK** |
| Local E2E phase1029 (marker 1032) | done | `e2e-phase1029.sh` **OK** |
| Local E2E phase1030 (typecheck) | done | `e2e-phase1030.sh` **OK** |
| Local E2E phase1031 (e2e-all + gaps) | done | `e2e-phase1031.sh` **OK** |
| Local E2E phase1032 (STATUS soft-complete) | done | `e2e-phase1032.sh` **OK** |
| Local E2E phase1033 (pages_with_tooltip) | done | `e2e-phase1033.sh` **OK** |
| Local E2E phase1034 (UI pageTip=) | done | `e2e-phase1034.sh` **OK** |
| Local E2E phase1035 (client pages_with_tooltip) | done | `e2e-phase1035.sh` **OK** |
| Local E2E phase1036 (STATUS 1033–1040) | done | `e2e-phase1036.sh` **OK** |
| Local E2E phase1037 (marker 1040) | done | `e2e-phase1037.sh` **OK** |
| Local E2E phase1038 (typecheck) | done | `e2e-phase1038.sh` **OK** |
| Local E2E phase1039 (e2e-all + gaps) | done | `e2e-phase1039.sh` **OK** |
| Local E2E phase1040 (STATUS soft-complete) | done | `e2e-phase1040.sh` **OK** |
| Local E2E phase1041 (milestone 1400) | done | `e2e-phase1041.sh` **OK** |
| Local E2E phase1042 (milestone 1400 endpoints) | done | `e2e-phase1042.sh` **OK** |
| Local E2E phase1043 (milestone 1400 UI) | done | `e2e-phase1043.sh` **OK** |
| Local E2E phase1044 (STATUS milestone 1400) | done | `e2e-phase1044.sh` **OK** |
| Local E2E phase1045 (marker 1048) | done | `e2e-phase1045.sh` **OK** |
| Local E2E phase1046 (typecheck) | done | `e2e-phase1046.sh` **OK** |
| Local E2E phase1047 (e2e-all + gaps) | done | `e2e-phase1047.sh` **OK** |
| Local E2E phase1048 (STATUS soft-complete) | done | `e2e-phase1048.sh` **OK** |
| Local E2E phase1049 (with_external_label) | done | `e2e-phase1049.sh` **OK** |
| Local E2E phase1050 (UI extLabel=) | done | `e2e-phase1050.sh` **OK** |
| Local E2E phase1051 (client with_external_label) | done | `e2e-phase1051.sh` **OK** |
| Local E2E phase1052 (STATUS 1049–1056) | done | `e2e-phase1052.sh` **OK** |
| Local E2E phase1053 (marker 1056) | done | `e2e-phase1053.sh` **OK** |
| Local E2E phase1054 (typecheck) | done | `e2e-phase1054.sh` **OK** |
| Local E2E phase1055 (e2e-all + gaps) | done | `e2e-phase1055.sh` **OK** |
| Local E2E phase1056 (STATUS soft-complete) | done | `e2e-phase1056.sh` **OK** |
| Local E2E phase1057 (pages_with_buddy_labels) | done | `e2e-phase1057.sh` **OK** |
| Local E2E phase1058 (UI pageBuddies=) | done | `e2e-phase1058.sh` **OK** |
| Local E2E phase1059 (client pages_with_buddy_labels) | done | `e2e-phase1059.sh` **OK** |
| Local E2E phase1060 (STATUS 1057–1064) | done | `e2e-phase1060.sh` **OK** |
| Local E2E phase1061 (marker 1064) | done | `e2e-phase1061.sh` **OK** |
| Local E2E phase1062 (typecheck) | done | `e2e-phase1062.sh` **OK** |
| Local E2E phase1063 (e2e-all + gaps) | done | `e2e-phase1063.sh` **OK** |
| Local E2E phase1064 (STATUS soft-complete) | done | `e2e-phase1064.sh` **OK** |
| Local E2E phase1065 (milestone 1450) | done | `e2e-phase1065.sh` **OK** |
| Local E2E phase1066 (milestone 1450 endpoints) | done | `e2e-phase1066.sh` **OK** |
| Local E2E phase1067 (milestone 1450 UI) | done | `e2e-phase1067.sh` **OK** |
| Local E2E phase1068 (STATUS milestone 1450) | done | `e2e-phase1068.sh` **OK** |
| Local E2E phase1069 (marker 1072) | done | `e2e-phase1069.sh` **OK** |
| Local E2E phase1070 (typecheck) | done | `e2e-phase1070.sh` **OK** |
| Local E2E phase1071 (e2e-all + gaps) | done | `e2e-phase1071.sh` **OK** |
| Local E2E phase1072 (STATUS soft-complete) | done | `e2e-phase1072.sh` **OK** |
| Local E2E phase1073 (catalog_complete) | done | `e2e-phase1073.sh` **OK** |
| Local E2E phase1074 (UI catalog=) | done | `e2e-phase1074.sh` **OK** |
| Local E2E phase1075 (client catalog_complete) | done | `e2e-phase1075.sh` **OK** |
| Local E2E phase1076 (STATUS 1073–1080) | done | `e2e-phase1076.sh` **OK** |
| Local E2E phase1077 (marker 1080) | done | `e2e-phase1077.sh` **OK** |
| Local E2E phase1078 (typecheck) | done | `e2e-phase1078.sh` **OK** |
| Local E2E phase1079 (e2e-all + gaps) | done | `e2e-phase1079.sh` **OK** |
| Local E2E phase1080 (STATUS soft-complete) | done | `e2e-phase1080.sh` **OK** |
| Local E2E phase1081 (milestone 1500) | done | `e2e-phase1081.sh` **OK** |
| Local E2E phase1082 (milestone 1500 endpoints) | done | `e2e-phase1082.sh` **OK** |
| Local E2E phase1083 (milestone 1500 UI) | done | `e2e-phase1083.sh` **OK** |
| Local E2E phase1084 (STATUS milestone 1500) | done | `e2e-phase1084.sh` **OK** |
| Local E2E phase1085 (marker 1088) | done | `e2e-phase1085.sh` **OK** |
| Local E2E phase1086 (typecheck) | done | `e2e-phase1086.sh` **OK** |
| Local E2E phase1087 (e2e-all + gaps) | done | `e2e-phase1087.sh` **OK** |
| Local E2E phase1088 (STATUS soft-complete) | done | `e2e-phase1088.sh` **OK** |
| Local E2E phase1089 (alt iosacl sample) | done | `e2e-phase1089.sh` **OK** |
| Local E2E phase1090 (UI alt bits) | done | `e2e-phase1090.sh` **OK** |
| Local E2E phase1091 (client alt sample) | done | `e2e-phase1091.sh` **OK** |
| Local E2E phase1092 (STATUS 1089–1096) | done | `e2e-phase1092.sh` **OK** |
| Local E2E phase1093 (marker 1096) | done | `e2e-phase1093.sh` **OK** |
| Local E2E phase1094 (typecheck) | done | `e2e-phase1094.sh` **OK** |
| Local E2E phase1095 (e2e-all + gaps) | done | `e2e-phase1095.sh` **OK** |
| Local E2E phase1096 (STATUS soft-complete) | done | `e2e-phase1096.sh` **OK** |
| Local E2E phase1097 (milestone 1550) | done | `e2e-phase1097.sh` **OK** |
| Local E2E phase1098 (milestone 1550 endpoints) | done | `e2e-phase1098.sh` **OK** |
| Local E2E phase1099 (milestone 1550 UI) | done | `e2e-phase1099.sh` **OK** |
| Local E2E phase1100 (STATUS milestone 1550) | done | `e2e-phase1100.sh` **OK** |
| Local E2E phase1101 (marker 1104) | done | `e2e-phase1101.sh` **OK** |
| Local E2E phase1102 (typecheck) | done | `e2e-phase1102.sh` **OK** |
| Local E2E phase1103 (e2e-all + gaps) | done | `e2e-phase1103.sh` **OK** |
| Local E2E phase1104 (STATUS soft-complete) | done | `e2e-phase1104.sh` **OK** |
| Local E2E phase1105 (alt2 junosacl) | done | `e2e-phase1105.sh` **OK** |
| Local E2E phase1106 (UI alt2 bits) | done | `e2e-phase1106.sh` **OK** |
| Local E2E phase1107 (client alt2) | done | `e2e-phase1107.sh` **OK** |
| Local E2E phase1108 (STATUS 1105–1112) | done | `e2e-phase1108.sh` **OK** |
| Local E2E phase1109 (marker 1112) | done | `e2e-phase1109.sh` **OK** |
| Local E2E phase1110 (typecheck) | done | `e2e-phase1110.sh` **OK** |
| Local E2E phase1111 (e2e-all + gaps) | done | `e2e-phase1111.sh` **OK** |
| Local E2E phase1112 (STATUS soft-complete) | done | `e2e-phase1112.sh` **OK** |
| Local E2E phase1113 (milestone 1600) | done | `e2e-phase1113.sh` **OK** |
| Local E2E phase1114 (milestone 1600 endpoints) | done | `e2e-phase1114.sh` **OK** |
| Local E2E phase1115 (milestone 1600 UI) | done | `e2e-phase1115.sh` **OK** |
| Local E2E phase1116 (STATUS milestone 1600) | done | `e2e-phase1116.sh` **OK** |
| Local E2E phase1117 (marker 1120) | done | `e2e-phase1117.sh` **OK** |
| Local E2E phase1118 (typecheck) | done | `e2e-phase1118.sh` **OK** |
| Local E2E phase1119 (e2e-all + gaps) | done | `e2e-phase1119.sh` **OK** |
| Local E2E phase1120 (STATUS soft-complete) | done | `e2e-phase1120.sh` **OK** |
| Local E2E phase1121 (alt pageBuddies) | done | `e2e-phase1121.sh` **OK** |
| Local E2E phase1122 (UI altPageBuddies=) | done | `e2e-phase1122.sh` **OK** |
| Local E2E phase1123 (client alt pageBuddies) | done | `e2e-phase1123.sh` **OK** |
| Local E2E phase1124 (STATUS 1121–1128) | done | `e2e-phase1124.sh` **OK** |
| Local E2E phase1125 (marker 1128) | done | `e2e-phase1125.sh` **OK** |
| Local E2E phase1126 (typecheck) | done | `e2e-phase1126.sh` **OK** |
| Local E2E phase1127 (e2e-all + gaps) | done | `e2e-phase1127.sh` **OK** |
| Local E2E phase1128 (STATUS soft-complete) | done | `e2e-phase1128.sh` **OK** |
| Local E2E phase1129 (milestone 1650) | done | `e2e-phase1129.sh` **OK** |
| Local E2E phase1130 (milestone 1650 endpoints) | done | `e2e-phase1130.sh` **OK** |
| Local E2E phase1131 (milestone 1650 UI) | done | `e2e-phase1131.sh` **OK** |
| Local E2E phase1132 (STATUS milestone 1650) | done | `e2e-phase1132.sh` **OK** |
| Local E2E phase1133 (marker 1136) | done | `e2e-phase1133.sh` **OK** |
| Local E2E phase1134 (typecheck) | done | `e2e-phase1134.sh` **OK** |
| Local E2E phase1135 (e2e-all + gaps) | done | `e2e-phase1135.sh` **OK** |
| Local E2E phase1136 (STATUS soft-complete) | done | `e2e-phase1136.sh` **OK** |
| Local E2E phase1137 (hard_gap_open_labels) | done | `e2e-phase1137.sh` **OK** |
| Local E2E phase1138 (UI open labels) | done | `e2e-phase1138.sh` **OK** |
| Local E2E phase1139 (client open labels) | done | `e2e-phase1139.sh` **OK** |
| Local E2E phase1140 (STATUS 1137–1144) | done | `e2e-phase1140.sh` **OK** |
| Local E2E phase1141 (marker 1144) | done | `e2e-phase1141.sh` **OK** |
| Local E2E phase1142 (typecheck) | done | `e2e-phase1142.sh` **OK** |
| Local E2E phase1143 (e2e-all + gaps) | done | `e2e-phase1143.sh` **OK** |
| Local E2E phase1144 (STATUS soft-complete) | done | `e2e-phase1144.sh` **OK** |
| Local E2E phase1145 (milestone 1700) | done | `e2e-phase1145.sh` **OK** |
| Local E2E phase1146 (milestone 1700 endpoints) | done | `e2e-phase1146.sh` **OK** |
| Local E2E phase1147 (milestone 1700 UI) | done | `e2e-phase1147.sh` **OK** |
| Local E2E phase1148 (STATUS milestone 1700) | done | `e2e-phase1148.sh` **OK** |
| Local E2E phase1149 (marker 1152) | done | `e2e-phase1149.sh` **OK** |
| Local E2E phase1150 (typecheck) | done | `e2e-phase1150.sh` **OK** |
| Local E2E phase1151 (e2e-all + gaps) | done | `e2e-phase1151.sh` **OK** |
| Local E2E phase1152 (STATUS soft-complete) | done | `e2e-phase1152.sh` **OK** |
| Local E2E phase1153 (hard_gap_closure_titles) | done | `e2e-phase1153.sh` **OK** |
| Local E2E phase1154 (UI closure titles) | done | `e2e-phase1154.sh` **OK** |
| Local E2E phase1155 (client closure titles) | done | `e2e-phase1155.sh` **OK** |
| Local E2E phase1156 (STATUS 1153–1160) | done | `e2e-phase1156.sh` **OK** |
| Local E2E phase1157 (marker 1160) | done | `e2e-phase1157.sh` **OK** |
| Local E2E phase1158 (typecheck) | done | `e2e-phase1158.sh` **OK** |
| Local E2E phase1159 (e2e-all + gaps) | done | `e2e-phase1159.sh` **OK** |
| Local E2E phase1160 (STATUS soft-complete) | done | `e2e-phase1160.sh` **OK** |
| Local E2E phase1161 (milestone 1750) | done | `e2e-phase1161.sh` **OK** |
| Local E2E phase1162 (milestone 1750 endpoints) | done | `e2e-phase1162.sh` **OK** |
| Local E2E phase1163 (milestone 1750 UI) | done | `e2e-phase1163.sh` **OK** |
| Local E2E phase1164 (STATUS milestone 1750) | done | `e2e-phase1164.sh` **OK** |
| Local E2E phase1165 (marker 1168) | done | `e2e-phase1165.sh` **OK** |
| Local E2E phase1166 (typecheck) | done | `e2e-phase1166.sh` **OK** |
| Local E2E phase1167 (e2e-all + gaps) | done | `e2e-phase1167.sh` **OK** |
| Local E2E phase1168 (STATUS soft-complete) | done | `e2e-phase1168.sh` **OK** |
| Local E2E phase1169 (expect_plan_step_titles) | done | `e2e-phase1169.sh` **OK** |
| Local E2E phase1170 (UI expect step titles) | done | `e2e-phase1170.sh` **OK** |
| Local E2E phase1171 (client expect step titles) | done | `e2e-phase1171.sh` **OK** |
| Local E2E phase1172 (STATUS 1169–1176) | done | `e2e-phase1172.sh` **OK** |
| Local E2E phase1173 (marker 1176) | done | `e2e-phase1173.sh` **OK** |
| Local E2E phase1174 (typecheck) | done | `e2e-phase1174.sh` **OK** |
| Local E2E phase1175 (e2e-all + gaps) | done | `e2e-phase1175.sh` **OK** |
| Local E2E phase1176 (STATUS soft-complete) | done | `e2e-phase1176.sh` **OK** |
| Local E2E phase1177 (milestone 1800) | done | `e2e-phase1177.sh` **OK** |
| Local E2E phase1178 (milestone 1800 endpoints) | done | `e2e-phase1178.sh` **OK** |
| Local E2E phase1179 (milestone 1800 UI) | done | `e2e-phase1179.sh` **OK** |
| Local E2E phase1180 (STATUS milestone 1800) | done | `e2e-phase1180.sh` **OK** |
| Local E2E phase1181 (marker 1184) | done | `e2e-phase1181.sh` **OK** |
| Local E2E phase1182 (typecheck) | done | `e2e-phase1182.sh` **OK** |
| Local E2E phase1183 (e2e-all + gaps) | done | `e2e-phase1183.sh` **OK** |
| Local E2E phase1184 (STATUS soft-complete) | done | `e2e-phase1184.sh` **OK** |
| Local E2E phase1185 (ssh titles) | done | `e2e-phase1185.sh` **OK** |
| Local E2E phase1186 (UI ssh alt titles) | done | `e2e-phase1186.sh` **OK** |
| Local E2E phase1187 (client ssh titles) | done | `e2e-phase1187.sh` **OK** |
| Local E2E phase1188 (STATUS 1185–1192) | done | `e2e-phase1188.sh` **OK** |
| Local E2E phase1189 (marker 1192) | done | `e2e-phase1189.sh` **OK** |
| Local E2E phase1190 (typecheck) | done | `e2e-phase1190.sh` **OK** |
| Local E2E phase1191 (e2e-all + gaps) | done | `e2e-phase1191.sh` **OK** |
| Local E2E phase1192 (STATUS soft-complete) | done | `e2e-phase1192.sh` **OK** |
| Local E2E phase1193 (milestone 1850) | done | `e2e-phase1193.sh` **OK** |
| Local E2E phase1194 (milestone 1850 endpoints) | done | `e2e-phase1194.sh` **OK** |
| Local E2E phase1195 (milestone 1850 UI) | done | `e2e-phase1195.sh` **OK** |
| Local E2E phase1196 (STATUS milestone 1850) | done | `e2e-phase1196.sh` **OK** |
| Local E2E phase1197 (marker 1200) | done | `e2e-phase1197.sh` **OK** |
| Local E2E phase1198 (typecheck) | done | `e2e-phase1198.sh` **OK** |
| Local E2E phase1199 (e2e-all + gaps) | done | `e2e-phase1199.sh` **OK** |
| Local E2E phase1200 (STATUS soft-complete) | done | `e2e-phase1200.sh` **OK** |
| Local E2E phase1201 (honesty_path_titles) | done | `e2e-phase1201.sh` **OK** |
| Local E2E phase1202 (UI honesty path titles) | done | `e2e-phase1202.sh` **OK** |
| Local E2E phase1203 (client honesty path titles) | done | `e2e-phase1203.sh` **OK** |
| Local E2E phase1204 (STATUS 1201–1208) | done | `e2e-phase1204.sh` **OK** |
| Local E2E phase1205 (marker 1208) | done | `e2e-phase1205.sh` **OK** |
| Local E2E phase1206 (typecheck) | done | `e2e-phase1206.sh` **OK** |
| Local E2E phase1207 (e2e-all + gaps) | done | `e2e-phase1207.sh` **OK** |
| Local E2E phase1208 (STATUS soft-complete) | done | `e2e-phase1208.sh` **OK** |
| Local E2E phase1209 (milestone 1900) | done | `e2e-phase1209.sh` **OK** |
| Local E2E phase1210 (milestone 1900 endpoints) | done | `e2e-phase1210.sh` **OK** |
| Local E2E phase1211 (milestone 1900 UI) | done | `e2e-phase1211.sh` **OK** |
| Local E2E phase1212 (STATUS milestone 1900) | done | `e2e-phase1212.sh` **OK** |
| Local E2E phase1213 (marker 1216) | done | `e2e-phase1213.sh` **OK** |
| Local E2E phase1214 (typecheck) | done | `e2e-phase1214.sh` **OK** |
| Local E2E phase1215 (e2e-all + gaps) | done | `e2e-phase1215.sh` **OK** |
| Local E2E phase1216 (STATUS soft-complete) | done | `e2e-phase1216.sh` **OK** |
| Local E2E phase1217 (honesty_path_notes) | done | `e2e-phase1217.sh` **OK** |
| Local E2E phase1218 (UI honesty path notes) | done | `e2e-phase1218.sh` **OK** |
| Local E2E phase1219 (client honesty path notes) | done | `e2e-phase1219.sh` **OK** |
| Local E2E phase1220 (STATUS 1217–1224) | done | `e2e-phase1220.sh` **OK** |
| Local E2E phase1221 (marker 1224) | done | `e2e-phase1221.sh` **OK** |
| Local E2E phase1222 (typecheck) | done | `e2e-phase1222.sh` **OK** |
| Local E2E phase1223 (e2e-all + gaps) | done | `e2e-phase1223.sh` **OK** |
| Local E2E phase1224 (STATUS soft-complete) | done | `e2e-phase1224.sh` **OK** |
| Local E2E phase1225 (milestone 1950) | done | `e2e-phase1225.sh` **OK** |
| Local E2E phase1226 (milestone 1950 endpoints) | done | `e2e-phase1226.sh` **OK** |
| Local E2E phase1227 (milestone 1950 UI) | done | `e2e-phase1227.sh` **OK** |
| Local E2E phase1228 (STATUS milestone 1950) | done | `e2e-phase1228.sh` **OK** |
| Local E2E phase1229 (marker 1232) | done | `e2e-phase1229.sh` **OK** |
| Local E2E phase1230 (typecheck) | done | `e2e-phase1230.sh` **OK** |
| Local E2E phase1231 (e2e-all + gaps) | done | `e2e-phase1231.sh` **OK** |
| Local E2E phase1232 (STATUS soft-complete) | done | `e2e-phase1232.sh` **OK** |
| Local E2E phase1233 (soft_fertig_surface_keys) | done | `e2e-phase1233.sh` **OK** |
| Local E2E phase1234 (UI soft-fertig surface) | done | `e2e-phase1234.sh` **OK** |
| Local E2E phase1235 (client soft-fertig surface) | done | `e2e-phase1235.sh` **OK** |
| Local E2E phase1236 (STATUS 1233–1240) | done | `e2e-phase1236.sh` **OK** |
| Local E2E phase1237 (marker 1240) | done | `e2e-phase1237.sh` **OK** |
| Local E2E phase1238 (typecheck) | done | `e2e-phase1238.sh` **OK** |
| Local E2E phase1239 (e2e-all + gaps) | done | `e2e-phase1239.sh` **OK** |
| Local E2E phase1240 (STATUS soft-complete) | done | `e2e-phase1240.sh` **OK** |
| Local E2E phase1241 (milestone 2000) | done | `e2e-phase1241.sh` **OK** |
| Local E2E phase1242 (milestone 2000 endpoints) | done | `e2e-phase1242.sh` **OK** |
| Local E2E phase1243 (milestone 2000 UI) | done | `e2e-phase1243.sh` **OK** |
| Local E2E phase1244 (STATUS milestone 2000) | done | `e2e-phase1244.sh` **OK** |
| Local E2E phase1245 (marker 1248) | done | `e2e-phase1245.sh` **OK** |
| Local E2E phase1246 (typecheck) | done | `e2e-phase1246.sh` **OK** |
| Local E2E phase1247 (e2e-all + gaps) | done | `e2e-phase1247.sh` **OK** |
| Local E2E phase1248 (STATUS soft-complete) | done | `e2e-phase1248.sh` **OK** |
| Local E2E phase1249 (hard_gap_related_refusals) | done | `e2e-phase1249.sh` **OK** |
| Local E2E phase1250 (UI related refusal titles) | done | `e2e-phase1250.sh` **OK** |
| Local E2E phase1251 (client related refusal types) | done | `e2e-phase1251.sh` **OK** |
| Local E2E phase1252 (STATUS 1249–1256) | done | `e2e-phase1252.sh` **OK** |
| Local E2E phase1253 (marker 1256) | done | `e2e-phase1253.sh` **OK** |
| Local E2E phase1254 (typecheck) | done | `e2e-phase1254.sh` **OK** |
| Local E2E phase1255 (e2e-all + gaps) | done | `e2e-phase1255.sh` **OK** |
| Local E2E phase1256 (STATUS soft-complete) | done | `e2e-phase1256.sh` **OK** |
| Local E2E phase1257 (milestone 2050) | done | `e2e-phase1257.sh` **OK** |
| Local E2E phase1258 (milestone 2050 endpoints) | done | `e2e-phase1258.sh` **OK** |
| Local E2E phase1259 (milestone 2050 UI) | done | `e2e-phase1259.sh` **OK** |
| Local E2E phase1260 (STATUS milestone 2050) | done | `e2e-phase1260.sh` **OK** |
| Local E2E phase1261 (marker 1264) | done | `e2e-phase1261.sh` **OK** |
| Local E2E phase1262 (typecheck) | done | `e2e-phase1262.sh` **OK** |
| Local E2E phase1263 (e2e-all + gaps) | done | `e2e-phase1263.sh` **OK** |
| Local E2E phase1264 (STATUS soft-complete) | done | `e2e-phase1264.sh` **OK** |
| Local E2E phase1265 (surface keys + refusals) | done | `e2e-phase1265.sh` **OK** |
| Local E2E phase1266 (UI surface expansion) | done | `e2e-phase1266.sh` **OK** |
| Local E2E phase1267 (client surface + refusal) | done | `e2e-phase1267.sh` **OK** |
| Local E2E phase1268 (STATUS 1265–1272) | done | `e2e-phase1268.sh` **OK** |
| Local E2E phase1269 (marker 1272) | done | `e2e-phase1269.sh` **OK** |
| Local E2E phase1270 (typecheck) | done | `e2e-phase1270.sh` **OK** |
| Local E2E phase1271 (e2e-all + gaps) | done | `e2e-phase1271.sh` **OK** |
| Local E2E phase1272 (STATUS soft-complete) | done | `e2e-phase1272.sh` **OK** |
| Local E2E phase1273 (surface expandable detail) | done | `e2e-phase1273.sh` **OK** |
| Local E2E phase1274 (UI surface detail wiring) | done | `e2e-phase1274.sh` **OK** |
| Local E2E phase1275 (client surface keys) | done | `e2e-phase1275.sh` **OK** |
| Local E2E phase1276 (STATUS 1273–1280) | done | `e2e-phase1276.sh` **OK** |
| Local E2E phase1277 (marker 1280) | done | `e2e-phase1277.sh` **OK** |
| Local E2E phase1278 (typecheck) | done | `e2e-phase1278.sh` **OK** |
| Local E2E phase1279 (e2e-all + gaps) | done | `e2e-phase1279.sh` **OK** |
| Local E2E phase1280 (STATUS soft-complete) | done | `e2e-phase1280.sh` **OK** |
| Local E2E phase1281 (milestone 2100) | done | `e2e-phase1281.sh` **OK** |
| Local E2E phase1282 (milestone 2100 endpoints) | done | `e2e-phase1282.sh` **OK** |
| Local E2E phase1283 (milestone 2100 UI) | done | `e2e-phase1283.sh` **OK** |
| Local E2E phase1284 (STATUS milestone 2100) | done | `e2e-phase1284.sh` **OK** |
| Local E2E phase1285 (marker 1288) | done | `e2e-phase1285.sh` **OK** |
| Local E2E phase1286 (typecheck) | done | `e2e-phase1286.sh` **OK** |
| Local E2E phase1287 (e2e-all + gaps) | done | `e2e-phase1287.sh` **OK** |
| Local E2E phase1288 (STATUS soft-complete) | done | `e2e-phase1288.sh` **OK** |
| Local E2E phase1289 (related refusals detail) | done | `e2e-phase1289.sh` **OK** |
| Local E2E phase1290 (UI related refusals wiring) | done | `e2e-phase1290.sh` **OK** |
| Local E2E phase1291 (client related refusals) | done | `e2e-phase1291.sh` **OK** |
| Local E2E phase1292 (STATUS 1289–1296) | done | `e2e-phase1292.sh` **OK** |
| Local E2E phase1293 (marker 1296) | done | `e2e-phase1293.sh` **OK** |
| Local E2E phase1294 (typecheck) | done | `e2e-phase1294.sh` **OK** |
| Local E2E phase1295 (e2e-all + gaps) | done | `e2e-phase1295.sh` **OK** |
| Local E2E phase1296 (STATUS soft-complete) | done | `e2e-phase1296.sh` **OK** |
| Local E2E phase1297 (milestone 2150) | done | `e2e-phase1297.sh` **OK** |
| Local E2E phase1298 (milestone 2150 endpoints) | done | `e2e-phase1298.sh` **OK** |
| Local E2E phase1299 (milestone 2150 UI) | done | `e2e-phase1299.sh` **OK** |
| Local E2E phase1300 (STATUS milestone 2150) | done | `e2e-phase1300.sh` **OK** |
| Local E2E phase1301 (marker 1304) | done | `e2e-phase1301.sh` **OK** |
| Local E2E phase1302 (typecheck) | done | `e2e-phase1302.sh` **OK** |
| Local E2E phase1303 (e2e-all + gaps) | done | `e2e-phase1303.sh` **OK** |
| Local E2E phase1304 (STATUS soft-complete) | done | `e2e-phase1304.sh` **OK** |
| Local E2E phase1305 (soft_fertig_surface_notes) | done | `e2e-phase1305.sh` **OK** |
| Local E2E phase1306 (UI surface notes) | done | `e2e-phase1306.sh` **OK** |
| Local E2E phase1307 (client surface notes) | done | `e2e-phase1307.sh` **OK** |
| Local E2E phase1308 (STATUS 1305–1312) | done | `e2e-phase1308.sh` **OK** |
| Local E2E phase1309 (marker 1312) | done | `e2e-phase1309.sh` **OK** |
| Local E2E phase1310 (typecheck) | done | `e2e-phase1310.sh` **OK** |
| Local E2E phase1311 (e2e-all + gaps) | done | `e2e-phase1311.sh` **OK** |
| Local E2E phase1312 (STATUS soft-complete) | done | `e2e-phase1312.sh` **OK** |
| Local E2E phase1313 (milestone 2200) | done | `e2e-phase1313.sh` **OK** |
| Local E2E phase1314 (milestone 2200 endpoints) | done | `e2e-phase1314.sh` **OK** |
| Local E2E phase1315 (milestone 2200 UI) | done | `e2e-phase1315.sh` **OK** |
| Local E2E phase1316 (STATUS milestone 2200) | done | `e2e-phase1316.sh` **OK** |
| Local E2E phase1317 (marker 1320) | done | `e2e-phase1317.sh` **OK** |
| Local E2E phase1318 (typecheck) | done | `e2e-phase1318.sh` **OK** |
| Local E2E phase1319 (e2e-all + gaps) | done | `e2e-phase1319.sh` **OK** |
| Local E2E phase1320 (STATUS soft-complete) | done | `e2e-phase1320.sh` **OK** |
| Local E2E phase1321 (related refusals closure+summary) | done | `e2e-phase1321.sh` **OK** |
| Local E2E phase1322 (UI related refusals) | done | `e2e-phase1322.sh` **OK** |
| Local E2E phase1323 (client related refusals) | done | `e2e-phase1323.sh` **OK** |
| Local E2E phase1324 (STATUS 1321–1328) | done | `e2e-phase1324.sh` **OK** |
| Local E2E phase1325 (marker 1328) | done | `e2e-phase1325.sh` **OK** |
| Local E2E phase1326 (typecheck) | done | `e2e-phase1326.sh` **OK** |
| Local E2E phase1327 (e2e-all + gaps) | done | `e2e-phase1327.sh` **OK** |
| Local E2E phase1328 (STATUS soft-complete) | done | `e2e-phase1328.sh` **OK** |
| Local E2E phase1329 (milestone 2250) | done | `e2e-phase1329.sh` **OK** |
| Local E2E phase1330 (milestone 2250 endpoints) | done | `e2e-phase1330.sh` **OK** |
| Local E2E phase1331 (milestone 2250 UI) | done | `e2e-phase1331.sh` **OK** |
| Local E2E phase1332 (STATUS milestone 2250) | done | `e2e-phase1332.sh` **OK** |
| Local E2E phase1333 (marker 1336) | done | `e2e-phase1333.sh` **OK** |
| Local E2E phase1334 (typecheck) | done | `e2e-phase1334.sh` **OK** |
| Local E2E phase1335 (e2e-all + gaps) | done | `e2e-phase1335.sh` **OK** |
| Local E2E phase1336 (STATUS soft-complete) | done | `e2e-phase1336.sh` **OK** |
| Local E2E phase1337 (summary soft_fertig_surface) | done | `e2e-phase1337.sh` **OK** |
| Local E2E phase1338 (UI surface detail) | done | `e2e-phase1338.sh` **OK** |
| Local E2E phase1339 (client soft_fertig_surface) | done | `e2e-phase1339.sh` **OK** |
| Local E2E phase1340 (STATUS 1337–1344) | done | `e2e-phase1340.sh` **OK** |
| Local E2E phase1341 (marker 1344) | done | `e2e-phase1341.sh` **OK** |
| Local E2E phase1342 (typecheck) | done | `e2e-phase1342.sh` **OK** |
| Local E2E phase1343 (e2e-all + gaps) | done | `e2e-phase1343.sh` **OK** |
| Local E2E phase1344 (STATUS soft-complete) | done | `e2e-phase1344.sh` **OK** |
| Local E2E phase1345 (milestone 2300) | done | `e2e-phase1345.sh` **OK** |
| Local E2E phase1346 (milestone 2300 endpoints) | done | `e2e-phase1346.sh` **OK** |
| Local E2E phase1347 (milestone 2300 UI) | done | `e2e-phase1347.sh` **OK** |
| Local E2E phase1348 (STATUS milestone 2300) | done | `e2e-phase1348.sh` **OK** |
| Local E2E phase1349 (marker 1352) | done | `e2e-phase1349.sh` **OK** |
| Local E2E phase1350 (typecheck) | done | `e2e-phase1350.sh` **OK** |
| Local E2E phase1351 (e2e-all + gaps) | done | `e2e-phase1351.sh` **OK** |
| Local E2E phase1352 (STATUS soft-complete) | done | `e2e-phase1352.sh` **OK** |
| Local E2E phase1353 (closure soft_fertig_surface) | done | `e2e-phase1353.sh` **OK** |
| Local E2E phase1354 (UI surface detail) | done | `e2e-phase1354.sh` **OK** |
| Local E2E phase1355 (client soft_fertig_surface) | done | `e2e-phase1355.sh` **OK** |
| Local E2E phase1356 (STATUS 1353–1360) | done | `e2e-phase1356.sh` **OK** |
| Local E2E phase1357 (marker 1360) | done | `e2e-phase1357.sh` **OK** |
| Local E2E phase1358 (typecheck) | done | `e2e-phase1358.sh` **OK** |
| Local E2E phase1359 (e2e-all + gaps) | done | `e2e-phase1359.sh` **OK** |
| Local E2E phase1360 (STATUS soft-complete) | done | `e2e-phase1360.sh` **OK** |
| Local E2E phase1361 (milestone 2350) | done | `e2e-phase1361.sh` **OK** |
| Local E2E phase1362 (milestone 2350 endpoints) | done | `e2e-phase1362.sh` **OK** |
| Local E2E phase1363 (milestone 2350 UI) | done | `e2e-phase1363.sh` **OK** |
| Local E2E phase1364 (STATUS milestone 2350) | done | `e2e-phase1364.sh` **OK** |
| Local E2E phase1365 (marker 1368) | done | `e2e-phase1365.sh` **OK** |
| Local E2E phase1366 (typecheck) | done | `e2e-phase1366.sh` **OK** |
| Local E2E phase1367 (e2e-all + gaps) | done | `e2e-phase1367.sh` **OK** |
| Local E2E phase1368 (STATUS soft-complete) | done | `e2e-phase1368.sh` **OK** |
| Local E2E phase1369 (summary honesty_paths) | done | `e2e-phase1369.sh` **OK** |
| Local E2E phase1370 (UI honesty paths) | done | `e2e-phase1370.sh` **OK** |
| Local E2E phase1371 (client honesty paths) | done | `e2e-phase1371.sh` **OK** |
| Local E2E phase1372 (STATUS 1369–1376) | done | `e2e-phase1372.sh` **OK** |
| Local E2E phase1373 (marker 1376) | done | `e2e-phase1373.sh` **OK** |
| Local E2E phase1374 (typecheck) | done | `e2e-phase1374.sh` **OK** |
| Local E2E phase1375 (e2e-all + gaps) | done | `e2e-phase1375.sh` **OK** |
| Local E2E phase1376 (STATUS soft-complete) | done | `e2e-phase1376.sh` **OK** |
| Local E2E phase1377 (milestone 2400) | done | `e2e-phase1377.sh` **OK** |
| Local E2E phase1378 (milestone 2400 endpoints) | done | `e2e-phase1378.sh` **OK** |
| Local E2E phase1379 (milestone 2400 UI) | done | `e2e-phase1379.sh` **OK** |
| Local E2E phase1380 (STATUS milestone 2400) | done | `e2e-phase1380.sh` **OK** |
| Local E2E phase1381 (marker 1384) | done | `e2e-phase1381.sh` **OK** |
| Local E2E phase1382 (typecheck) | done | `e2e-phase1382.sh` **OK** |
| Local E2E phase1383 (e2e-all + gaps) | done | `e2e-phase1383.sh` **OK** |
| Local E2E phase1384 (STATUS soft-complete) | done | `e2e-phase1384.sh` **OK** |
| Local E2E phase1385 (closure honesty_paths) | done | `e2e-phase1385.sh` **OK** |
| Local E2E phase1386 (UI honesty paths) | done | `e2e-phase1386.sh` **OK** |
| Local E2E phase1387 (client honesty_paths) | done | `e2e-phase1387.sh` **OK** |
| Local E2E phase1388 (STATUS 1385–1392) | done | `e2e-phase1388.sh` **OK** |
| Local E2E phase1389 (marker 1392) | done | `e2e-phase1389.sh` **OK** |
| Local E2E phase1390 (typecheck) | done | `e2e-phase1390.sh` **OK** |
| Local E2E phase1391 (e2e-all + gaps) | done | `e2e-phase1391.sh` **OK** |
| Local E2E phase1392 (STATUS soft-complete) | done | `e2e-phase1392.sh` **OK** |
| Local E2E phase1393 (milestone 2450) | done | `e2e-phase1393.sh` **OK** |
| Local E2E phase1394 (milestone 2450 endpoints) | done | `e2e-phase1394.sh` **OK** |
| Local E2E phase1395 (milestone 2450 UI) | done | `e2e-phase1395.sh` **OK** |
| Local E2E phase1396 (STATUS milestone 2450) | done | `e2e-phase1396.sh` **OK** |
| Local E2E phase1397 (marker 1400) | done | `e2e-phase1397.sh` **OK** |
| Local E2E phase1398 (typecheck) | done | `e2e-phase1398.sh` **OK** |
| Local E2E phase1399 (e2e-all + gaps) | done | `e2e-phase1399.sh` **OK** |
| Local E2E phase1400 (STATUS soft-complete) | done | `e2e-phase1400.sh` **OK** |
| Local E2E phase1401 (surface download UI) | done | `e2e-phase1401.sh` **OK** |
| Local E2E phase1402 (UI surface catalog fields) | done | `e2e-phase1402.sh` **OK** |
| Local E2E phase1403 (client soft_fertig_surface) | done | `e2e-phase1403.sh` **OK** |
| Local E2E phase1404 (STATUS 1401–1408) | done | `e2e-phase1404.sh` **OK** |
| Local E2E phase1405 (marker 1408) | done | `e2e-phase1405.sh` **OK** |
| Local E2E phase1406 (typecheck) | done | `e2e-phase1406.sh` **OK** |
| Local E2E phase1407 (e2e-all + gaps) | done | `e2e-phase1407.sh` **OK** |
| Local E2E phase1408 (STATUS soft-complete) | done | `e2e-phase1408.sh` **OK** |
| Local E2E phase1409 (milestone 2500) | done | `e2e-phase1409.sh` **OK** |
| Local E2E phase1410 (milestone 2500 endpoints) | done | `e2e-phase1410.sh` **OK** |
| Local E2E phase1411 (milestone 2500 UI) | done | `e2e-phase1411.sh` **OK** |
| Local E2E phase1412 (STATUS milestone 2500) | done | `e2e-phase1412.sh` **OK** |
| Local E2E phase1413 (marker 1416) | done | `e2e-phase1413.sh` **OK** |
| Local E2E phase1414 (typecheck) | done | `e2e-phase1414.sh` **OK** |
| Local E2E phase1415 (e2e-all + gaps) | done | `e2e-phase1415.sh` **OK** |
| Local E2E phase1416 (STATUS soft-complete) | done | `e2e-phase1416.sh` **OK** |
| Local E2E phase1417 (related refusals download) | done | `e2e-phase1417.sh` **OK** |
| Local E2E phase1418 (UI related refusals fields) | done | `e2e-phase1418.sh` **OK** |
| Local E2E phase1419 (client related refusals) | done | `e2e-phase1419.sh` **OK** |
| Local E2E phase1420 (STATUS 1417–1424) | done | `e2e-phase1420.sh` **OK** |
| Local E2E phase1421 (marker 1424) | done | `e2e-phase1421.sh` **OK** |
| Local E2E phase1422 (typecheck) | done | `e2e-phase1422.sh` **OK** |
| Local E2E phase1423 (e2e-all + gaps) | done | `e2e-phase1423.sh` **OK** |
| Local E2E phase1424 (STATUS soft-complete) | done | `e2e-phase1424.sh` **OK** |
| Local E2E phase1425 (milestone 2550) | done | `e2e-phase1425.sh` **OK** |
| Local E2E phase1426 (milestone 2550 endpoints) | done | `e2e-phase1426.sh` **OK** |
| Local E2E phase1427 (milestone 2550 UI) | done | `e2e-phase1427.sh` **OK** |
| Local E2E phase1428 (STATUS milestone 2550) | done | `e2e-phase1428.sh` **OK** |
| Local E2E phase1429 (marker 1432) | done | `e2e-phase1429.sh` **OK** |
| Local E2E phase1430 (typecheck) | done | `e2e-phase1430.sh` **OK** |
| Local E2E phase1431 (e2e-all + gaps) | done | `e2e-phase1431.sh` **OK** |
| Local E2E phase1432 (STATUS soft-complete) | done | `e2e-phase1432.sh` **OK** |
| Local E2E phase1433 (honesty paths download) | done | `e2e-phase1433.sh` **OK** |
| Local E2E phase1434 (UI honesty path fields) | done | `e2e-phase1434.sh` **OK** |
| Local E2E phase1435 (client honesty_paths) | done | `e2e-phase1435.sh` **OK** |
| Local E2E phase1436 (STATUS 1433–1440) | done | `e2e-phase1436.sh` **OK** |
| Local E2E phase1437 (marker 1440) | done | `e2e-phase1437.sh` **OK** |
| Local E2E phase1438 (typecheck) | done | `e2e-phase1438.sh` **OK** |
| Local E2E phase1439 (e2e-all + gaps) | done | `e2e-phase1439.sh` **OK** |
| Local E2E phase1440 (STATUS soft-complete) | done | `e2e-phase1440.sh` **OK** |
| Local E2E phase1441 (milestone 2600) | done | `e2e-phase1441.sh` **OK** |
| Local E2E phase1442 (milestone 2600 endpoints) | done | `e2e-phase1442.sh` **OK** |
| Local E2E phase1443 (milestone 2600 UI) | done | `e2e-phase1443.sh` **OK** |
| Local E2E phase1444 (STATUS milestone 2600) | done | `e2e-phase1444.sh` **OK** |
| Local E2E phase1445 (marker 1448) | done | `e2e-phase1445.sh` **OK** |
| Local E2E phase1446 (typecheck) | done | `e2e-phase1446.sh` **OK** |
| Local E2E phase1447 (e2e-all + gaps) | done | `e2e-phase1447.sh` **OK** |
| Local E2E phase1448 (STATUS soft-complete) | done | `e2e-phase1448.sh` **OK** |
| Local E2E phase1449 (sessionStorage catalog keys) | done | `e2e-phase1449.sh` **OK** |
| Local E2E phase1450 (persist on download) | done | `e2e-phase1450.sh` **OK** |
| Local E2E phase1451 (clear catalog keys) | done | `e2e-phase1451.sh` **OK** |
| Local E2E phase1452 (STATUS 1449–1456) | done | `e2e-phase1452.sh` **OK** |
| Local E2E phase1453 (marker 1456) | done | `e2e-phase1453.sh` **OK** |
| Local E2E phase1454 (typecheck) | done | `e2e-phase1454.sh` **OK** |
| Local E2E phase1455 (e2e-all + gaps) | done | `e2e-phase1455.sh` **OK** |
| Local E2E phase1456 (STATUS soft-complete) | done | `e2e-phase1456.sh` **OK** |
| Local E2E phase1457 (milestone 2650) | done | `e2e-phase1457.sh` **OK** |
| Local E2E phase1458 (milestone 2650 endpoints) | done | `e2e-phase1458.sh` **OK** |
| Local E2E phase1459 (milestone 2650 UI) | done | `e2e-phase1459.sh` **OK** |
| Local E2E phase1460 (STATUS milestone 2650) | done | `e2e-phase1460.sh` **OK** |
| Local E2E phase1461 (marker 1464) | done | `e2e-phase1461.sh` **OK** |
| Local E2E phase1462 (typecheck) | done | `e2e-phase1462.sh` **OK** |
| Local E2E phase1463 (e2e-all + gaps) | done | `e2e-phase1463.sh` **OK** |
| Local E2E phase1464 (STATUS soft-complete) | done | `e2e-phase1464.sh` **OK** |
| Local E2E phase1465 (session storage keys catalog) | done | `e2e-phase1465.sh` **OK** |
| Local E2E phase1466 (UI sessionStorage keys) | done | `e2e-phase1466.sh` **OK** |
| Local E2E phase1467 (client session storage) | done | `e2e-phase1467.sh` **OK** |
| Local E2E phase1468 (STATUS 1465–1472) | done | `e2e-phase1468.sh` **OK** |
| Local E2E phase1469 (marker 1472) | done | `e2e-phase1469.sh` **OK** |
| Local E2E phase1470 (typecheck) | done | `e2e-phase1470.sh` **OK** |
| Local E2E phase1471 (e2e-all + gaps) | done | `e2e-phase1471.sh` **OK** |
| Local E2E phase1472 (STATUS soft-complete) | done | `e2e-phase1472.sh` **OK** |
| Local E2E phase1473 (milestone 2700) | done | `e2e-phase1473.sh` **OK** |
| Local E2E phase1474 (milestone 2700 endpoints) | done | `e2e-phase1474.sh` **OK** |
| Local E2E phase1475 (milestone 2700 UI) | done | `e2e-phase1475.sh` **OK** |
| Local E2E phase1476 (STATUS milestone 2700) | done | `e2e-phase1476.sh` **OK** |
| Local E2E phase1477 (marker 1480) | done | `e2e-phase1477.sh` **OK** |
| Local E2E phase1478 (typecheck) | done | `e2e-phase1478.sh` **OK** |
| Local E2E phase1479 (e2e-all + gaps) | done | `e2e-phase1479.sh` **OK** |
| Local E2E phase1480 (STATUS soft-complete) | done | `e2e-phase1480.sh` **OK** |
| Local E2E phase1481 (session storage summary+closure) | done | `e2e-phase1481.sh` **OK** |
| Local E2E phase1482 (UI sessionStorage keys) | done | `e2e-phase1482.sh` **OK** |
| Local E2E phase1483 (client session storage) | done | `e2e-phase1483.sh` **OK** |
| Local E2E phase1484 (STATUS 1481–1488) | done | `e2e-phase1484.sh` **OK** |
| Local E2E phase1485 (marker 1488) | done | `e2e-phase1485.sh` **OK** |
| Local E2E phase1486 (typecheck) | done | `e2e-phase1486.sh` **OK** |
| Local E2E phase1487 (e2e-all + gaps) | done | `e2e-phase1487.sh` **OK** |
| Local E2E phase1488 (STATUS soft-complete) | done | `e2e-phase1488.sh` **OK** |
| Local E2E phase1489 (milestone 2750) | done | `e2e-phase1489.sh` **OK** |
| Local E2E phase1490 (milestone 2750 endpoints) | done | `e2e-phase1490.sh` **OK** |
| Local E2E phase1491 (milestone 2750 UI) | done | `e2e-phase1491.sh` **OK** |
| Local E2E phase1492 (STATUS milestone 2750) | done | `e2e-phase1492.sh` **OK** |
| Local E2E phase1493 (marker 1496) | done | `e2e-phase1493.sh` **OK** |
| Local E2E phase1494 (typecheck) | done | `e2e-phase1494.sh` **OK** |
| Local E2E phase1495 (e2e-all + gaps) | done | `e2e-phase1495.sh` **OK** |
| Local E2E phase1496 (STATUS soft-complete) | done | `e2e-phase1496.sh` **OK** |
| Local E2E phase1497 (sessionStorage expandable) | done | `e2e-phase1497.sh` **OK** |
| Local E2E phase1498 (UI sessionStorage detail) | done | `e2e-phase1498.sh` **OK** |
| Local E2E phase1499 (client session storage) | done | `e2e-phase1499.sh` **OK** |
| Local E2E phase1500 (STATUS 1497–1504) | done | `e2e-phase1500.sh` **OK** |
| Local E2E phase1501 (marker 1504) | done | `e2e-phase1501.sh` **OK** |
| Local E2E phase1502 (typecheck) | done | `e2e-phase1502.sh` **OK** |
| Local E2E phase1503 (e2e-all + gaps) | done | `e2e-phase1503.sh` **OK** |
| Local E2E phase1504 (STATUS soft-complete) | done | `e2e-phase1504.sh` **OK** |
| Local E2E phase1505 (milestone 2800) | done | `e2e-phase1505.sh` **OK** |
| Local E2E phase1506 (milestone 2800 endpoints) | done | `e2e-phase1506.sh` **OK** |
| Local E2E phase1507 (milestone 2800 UI) | done | `e2e-phase1507.sh` **OK** |
| Local E2E phase1508 (STATUS milestone 2800) | done | `e2e-phase1508.sh` **OK** |
| Local E2E phase1509 (marker 1512) | done | `e2e-phase1509.sh` **OK** |
| Local E2E phase1510 (typecheck) | done | `e2e-phase1510.sh` **OK** |
| Local E2E phase1511 (e2e-all + gaps) | done | `e2e-phase1511.sh` **OK** |
| Local E2E phase1512 (STATUS soft-complete) | done | `e2e-phase1512.sh` **OK** |
| Local E2E phase1513 (sessionStorage keys download) | done | `e2e-phase1513.sh` **OK** |
| Local E2E phase1514 (UI session storage fields) | done | `e2e-phase1514.sh` **OK** |
| Local E2E phase1515 (client session storage) | done | `e2e-phase1515.sh` **OK** |
| Local E2E phase1516 (STATUS 1513–1520) | done | `e2e-phase1516.sh` **OK** |
| Local E2E phase1517 (marker 1520) | done | `e2e-phase1517.sh` **OK** |
| Local E2E phase1518 (typecheck) | done | `e2e-phase1518.sh` **OK** |
| Local E2E phase1519 (e2e-all + gaps) | done | `e2e-phase1519.sh` **OK** |
| Local E2E phase1520 (STATUS soft-complete) | done | `e2e-phase1520.sh` **OK** |
| Local E2E phase1521 (milestone 2850) | done | `e2e-phase1521.sh` **OK** |
| Local E2E phase1522 (milestone 2850 endpoints) | done | `e2e-phase1522.sh` **OK** |
| Local E2E phase1523 (milestone 2850 UI) | done | `e2e-phase1523.sh` **OK** |
| Local E2E phase1524 (STATUS milestone 2850) | done | `e2e-phase1524.sh` **OK** |
| Local E2E phase1525 (marker 1528) | done | `e2e-phase1525.sh` **OK** |
| Local E2E phase1526 (typecheck) | done | `e2e-phase1526.sh` **OK** |
| Local E2E phase1527 (e2e-all + gaps) | done | `e2e-phase1527.sh` **OK** |
| Local E2E phase1528 (STATUS soft-complete) | done | `e2e-phase1528.sh` **OK** |
| Local E2E phase1529 (session storage in surface keys) | done | `e2e-phase1529.sh` **OK** |
| Local E2E phase1530 (UI surface+session keys) | done | `e2e-phase1530.sh` **OK** |
| Local E2E phase1531 (client surface+session) | done | `e2e-phase1531.sh` **OK** |
| Local E2E phase1532 (STATUS 1529–1536) | done | `e2e-phase1532.sh` **OK** |
| Local E2E phase1533 (marker 1536) | done | `e2e-phase1533.sh` **OK** |
| Local E2E phase1534 (typecheck) | done | `e2e-phase1534.sh` **OK** |
| Local E2E phase1535 (e2e-all + gaps) | done | `e2e-phase1535.sh` **OK** |
| Local E2E phase1536 (STATUS soft-complete) | done | `e2e-phase1536.sh` **OK** |
| Local E2E phase1537 (milestone 2900) | done | `e2e-phase1537.sh` **OK** |
| Local E2E phase1538 (milestone 2900 endpoints) | done | `e2e-phase1538.sh` **OK** |
| Local E2E phase1539 (milestone 2900 UI) | done | `e2e-phase1539.sh` **OK** |
| Local E2E phase1540 (STATUS milestone 2900) | done | `e2e-phase1540.sh` **OK** |
| Local E2E phase1541 (marker 1544) | done | `e2e-phase1541.sh` **OK** |
| Local E2E phase1542 (typecheck) | done | `e2e-phase1542.sh` **OK** |
| Local E2E phase1543 (e2e-all + gaps) | done | `e2e-phase1543.sh` **OK** |
| Local E2E phase1544 (STATUS soft-complete) | done | `e2e-phase1544.sh` **OK** |
| Local E2E phase1545 (session storage notes) | done | `e2e-phase1545.sh` **OK** |
| Local E2E phase1546 (UI sessionStorage notes) | done | `e2e-phase1546.sh` **OK** |
| Local E2E phase1547 (client session notes types) | done | `e2e-phase1547.sh` **OK** |
| Local E2E phase1548 (STATUS session notes) | done | `e2e-phase1548.sh` **OK** |
| Local E2E phase1549 (marker 1552) | done | `e2e-phase1549.sh` **OK** |
| Local E2E phase1550 (typecheck) | done | `e2e-phase1550.sh` **OK** |
| Local E2E phase1551 (e2e-all + gaps) | done | `e2e-phase1551.sh` **OK** |
| Local E2E phase1552 (STATUS soft-complete) | done | `e2e-phase1552.sh` **OK** |
| Local E2E phase1553 (milestone 2950) | done | `e2e-phase1553.sh` **OK** |
| Local E2E phase1554 (milestone 2950 endpoints) | done | `e2e-phase1554.sh` **OK** |
| Local E2E phase1555 (milestone 2950 UI) | done | `e2e-phase1555.sh` **OK** |
| Local E2E phase1556 (STATUS milestone 2950) | done | `e2e-phase1556.sh` **OK** |
| Local E2E phase1557 (marker 1560) | done | `e2e-phase1557.sh` **OK** |
| Local E2E phase1558 (typecheck) | done | `e2e-phase1558.sh` **OK** |
| Local E2E phase1559 (e2e-all + gaps) | done | `e2e-phase1559.sh` **OK** |
| Local E2E phase1560 (STATUS soft-complete) | done | `e2e-phase1560.sh` **OK** |
| Local E2E phase1561 (session notes in surface) | done | `e2e-phase1561.sh` **OK** |
| Local E2E phase1562 (UI surface+session notes) | done | `e2e-phase1562.sh` **OK** |
| Local E2E phase1563 (client surface+session notes) | done | `e2e-phase1563.sh` **OK** |
| Local E2E phase1564 (STATUS surface+session notes) | done | `e2e-phase1564.sh` **OK** |
| Local E2E phase1565 (marker 1568) | done | `e2e-phase1565.sh` **OK** |
| Local E2E phase1566 (typecheck) | done | `e2e-phase1566.sh` **OK** |
| Local E2E phase1567 (e2e-all + gaps) | done | `e2e-phase1567.sh` **OK** |
| Local E2E phase1568 (STATUS soft-complete) | done | `e2e-phase1568.sh` **OK** |
| Local E2E phase1569 (milestone 3000) | done | `e2e-phase1569.sh` **OK** |
| Local E2E phase1570 (milestone 3000 endpoints) | done | `e2e-phase1570.sh` **OK** |
| Local E2E phase1571 (milestone 3000 UI) | done | `e2e-phase1571.sh` **OK** |
| Local E2E phase1572 (STATUS milestone 3000) | done | `e2e-phase1572.sh` **OK** |
| Local E2E phase1573 (marker 1576) | done | `e2e-phase1573.sh` **OK** |
| Local E2E phase1574 (typecheck) | done | `e2e-phase1574.sh` **OK** |
| Local E2E phase1575 (e2e-all + gaps) | done | `e2e-phase1575.sh` **OK** |
| Local E2E phase1576 (STATUS soft-complete) | done | `e2e-phase1576.sh` **OK** |
| Local E2E phase1577 (honesty export keys) | done | `e2e-phase1577.sh` **OK** |
| Local E2E phase1578 (UI honesty exports) | done | `e2e-phase1578.sh` **OK** |
| Local E2E phase1579 (client honesty export types) | done | `e2e-phase1579.sh` **OK** |
| Local E2E phase1580 (STATUS honesty export) | done | `e2e-phase1580.sh` **OK** |
| Local E2E phase1581 (marker 1584) | done | `e2e-phase1581.sh` **OK** |
| Local E2E phase1582 (typecheck) | done | `e2e-phase1582.sh` **OK** |
| Local E2E phase1583 (e2e-all + gaps) | done | `e2e-phase1583.sh` **OK** |
| Local E2E phase1584 (STATUS soft-complete) | done | `e2e-phase1584.sh` **OK** |
| Local E2E phase1585 (milestone 3050) | done | `e2e-phase1585.sh` **OK** |
| Local E2E phase1586 (milestone 3050 endpoints) | done | `e2e-phase1586.sh` **OK** |
| Local E2E phase1587 (milestone 3050 UI) | done | `e2e-phase1587.sh` **OK** |
| Local E2E phase1588 (STATUS milestone 3050) | done | `e2e-phase1588.sh` **OK** |
| Local E2E phase1589 (marker 1592) | done | `e2e-phase1589.sh` **OK** |
| Local E2E phase1590 (typecheck) | done | `e2e-phase1590.sh` **OK** |
| Local E2E phase1591 (e2e-all + gaps) | done | `e2e-phase1591.sh` **OK** |
| Local E2E phase1592 (STATUS soft-complete) | done | `e2e-phase1592.sh` **OK** |
| Local E2E phase1593 (honesty export in surface) | done | `e2e-phase1593.sh` **OK** |
| Local E2E phase1594 (UI surface+honesty export) | done | `e2e-phase1594.sh` **OK** |
| Local E2E phase1595 (client surface+honesty export) | done | `e2e-phase1595.sh` **OK** |
| Local E2E phase1596 (STATUS surface+honesty export) | done | `e2e-phase1596.sh` **OK** |
| Local E2E phase1597 (marker 1600) | done | `e2e-phase1597.sh` **OK** |
| Local E2E phase1598 (typecheck) | done | `e2e-phase1598.sh` **OK** |
| Local E2E phase1599 (e2e-all + gaps) | done | `e2e-phase1599.sh` **OK** |
| Local E2E phase1600 (STATUS soft-complete) | done | `e2e-phase1600.sh` **OK** |
| Local E2E phase1601 (milestone 3100) | done | `e2e-phase1601.sh` **OK** |
| Local E2E phase1602 (milestone 3100 endpoints) | done | `e2e-phase1602.sh` **OK** |
| Local E2E phase1603 (milestone 3100 UI) | done | `e2e-phase1603.sh` **OK** |
| Local E2E phase1604 (STATUS milestone 3100) | done | `e2e-phase1604.sh` **OK** |
| Local E2E phase1605 (marker 1608) | done | `e2e-phase1605.sh` **OK** |
| Local E2E phase1606 (typecheck) | done | `e2e-phase1606.sh` **OK** |
| Local E2E phase1607 (e2e-all + gaps) | done | `e2e-phase1607.sh` **OK** |
| Local E2E phase1608 (STATUS soft-complete) | done | `e2e-phase1608.sh` **OK** |
| Local E2E phase1609 (honesty bundle sections) | done | `e2e-phase1609.sh` **OK** |
| Local E2E phase1610 (UI honesty bundle) | done | `e2e-phase1610.sh` **OK** |
| Local E2E phase1611 (client honesty bundle types) | done | `e2e-phase1611.sh` **OK** |
| Local E2E phase1612 (STATUS honesty bundle) | done | `e2e-phase1612.sh` **OK** |
| Local E2E phase1613 (marker 1616) | done | `e2e-phase1613.sh` **OK** |
| Local E2E phase1614 (typecheck) | done | `e2e-phase1614.sh` **OK** |
| Local E2E phase1615 (e2e-all + gaps) | done | `e2e-phase1615.sh` **OK** |
| Local E2E phase1616 (STATUS soft-complete) | done | `e2e-phase1616.sh` **OK** |
| Local E2E phase1617 (milestone 3150) | done | `e2e-phase1617.sh` **OK** |
| Local E2E phase1618 (milestone 3150 endpoints) | done | `e2e-phase1618.sh` **OK** |
| Local E2E phase1619 (milestone 3150 UI) | done | `e2e-phase1619.sh` **OK** |
| Local E2E phase1620 (STATUS milestone 3150) | done | `e2e-phase1620.sh` **OK** |
| Local E2E phase1621 (marker 1624) | done | `e2e-phase1621.sh` **OK** |
| Local E2E phase1622 (typecheck) | done | `e2e-phase1622.sh` **OK** |
| Local E2E phase1623 (e2e-all + gaps) | done | `e2e-phase1623.sh` **OK** |
| Local E2E phase1624 (STATUS soft-complete) | done | `e2e-phase1624.sh` **OK** |
| Local E2E phase1625 (honesty bundle in surface) | done | `e2e-phase1625.sh` **OK** |
| Local E2E phase1626 (UI surface+honesty bundle) | done | `e2e-phase1626.sh` **OK** |
| Local E2E phase1627 (client surface+honesty bundle) | done | `e2e-phase1627.sh` **OK** |
| Local E2E phase1628 (STATUS surface+honesty bundle) | done | `e2e-phase1628.sh` **OK** |
| Local E2E phase1629 (marker 1632) | done | `e2e-phase1629.sh` **OK** |
| Local E2E phase1630 (typecheck) | done | `e2e-phase1630.sh` **OK** |
| Local E2E phase1631 (e2e-all + gaps) | done | `e2e-phase1631.sh` **OK** |
| Local E2E phase1632 (STATUS soft-complete) | done | `e2e-phase1632.sh` **OK** |
| Local E2E phase1633 (milestone 3200) | done | `e2e-phase1633.sh` **OK** |
| Local E2E phase1634 (milestone 3200 endpoints) | done | `e2e-phase1634.sh` **OK** |
| Local E2E phase1635 (milestone 3200 UI) | done | `e2e-phase1635.sh` **OK** |
| Local E2E phase1636 (STATUS milestone 3200) | done | `e2e-phase1636.sh` **OK** |
| Local E2E phase1637 (marker 1640) | done | `e2e-phase1637.sh` **OK** |
| Local E2E phase1638 (typecheck) | done | `e2e-phase1638.sh` **OK** |
| Local E2E phase1639 (e2e-all + gaps) | done | `e2e-phase1639.sh` **OK** |
| Local E2E phase1640 (STATUS soft-complete) | done | `e2e-phase1640.sh` **OK** |
| Local E2E phase1641 (honesty_bundle catalogs) | done | `e2e-phase1641.sh` **OK** |
| Local E2E phase1642 (UI honestyBundle key) | done | `e2e-phase1642.sh` **OK** |
| Local E2E phase1643 (client honesty_bundle types) | done | `e2e-phase1643.sh` **OK** |
| Local E2E phase1644 (STATUS honesty_bundle catalogs) | done | `e2e-phase1644.sh` **OK** |
| Local E2E phase1645 (marker 1648) | done | `e2e-phase1645.sh` **OK** |
| Local E2E phase1646 (typecheck) | done | `e2e-phase1646.sh` **OK** |
| Local E2E phase1647 (e2e-all + gaps) | done | `e2e-phase1647.sh` **OK** |
| Local E2E phase1648 (STATUS soft-complete) | done | `e2e-phase1648.sh` **OK** |
| Local E2E phase1649 (milestone 3250) | done | `e2e-phase1649.sh` **OK** |
| Local E2E phase1650 (milestone 3250 endpoints) | done | `e2e-phase1650.sh` **OK** |
| Local E2E phase1651 (milestone 3250 UI) | done | `e2e-phase1651.sh` **OK** |
| Local E2E phase1652 (STATUS milestone 3250) | done | `e2e-phase1652.sh` **OK** |
| Local E2E phase1653 (marker 1656) | done | `e2e-phase1653.sh` **OK** |
| Local E2E phase1654 (typecheck) | done | `e2e-phase1654.sh` **OK** |
| Local E2E phase1655 (e2e-all + gaps) | done | `e2e-phase1655.sh` **OK** |
| Local E2E phase1656 (STATUS soft-complete) | done | `e2e-phase1656.sh` **OK** |
| Local E2E phase1657 (session storage clear keys) | done | `e2e-phase1657.sh` **OK** |
| Local E2E phase1658 (UI Clear honesty catalogs) | done | `e2e-phase1658.sh` **OK** |
| Local E2E phase1659 (client clear types) | done | `e2e-phase1659.sh` **OK** |
| Local E2E phase1660 (STATUS clear honesty catalogs) | done | `e2e-phase1660.sh` **OK** |
| Local E2E phase1661 (marker 1664) | done | `e2e-phase1661.sh` **OK** |
| Local E2E phase1662 (typecheck) | done | `e2e-phase1662.sh` **OK** |
| Local E2E phase1663 (e2e-all + gaps) | done | `e2e-phase1663.sh` **OK** |
| Local E2E phase1664 (STATUS soft-complete) | done | `e2e-phase1664.sh` **OK** |
| Local E2E phase1665 (milestone 3300) | done | `e2e-phase1665.sh` **OK** |
| Local E2E phase1666 (milestone 3300 endpoints) | done | `e2e-phase1666.sh` **OK** |
| Local E2E phase1667 (milestone 3300 UI) | done | `e2e-phase1667.sh` **OK** |
| Local E2E phase1668 (STATUS milestone 3300) | done | `e2e-phase1668.sh` **OK** |
| Local E2E phase1669 (marker 1672) | done | `e2e-phase1669.sh` **OK** |
| Local E2E phase1670 (typecheck) | done | `e2e-phase1670.sh` **OK** |
| Local E2E phase1671 (e2e-all + gaps) | done | `e2e-phase1671.sh` **OK** |
| Local E2E phase1672 (STATUS soft-complete) | done | `e2e-phase1672.sh` **OK** |
| Local E2E phase1673 (clear in surface keys) | done | `e2e-phase1673.sh` **OK** |
| Local E2E phase1674 (UI surface+clear) | done | `e2e-phase1674.sh` **OK** |
| Local E2E phase1675 (client surface+clear) | done | `e2e-phase1675.sh` **OK** |
| Local E2E phase1676 (STATUS surface+clear) | done | `e2e-phase1676.sh` **OK** |
| Local E2E phase1677 (marker 1680) | done | `e2e-phase1677.sh` **OK** |
| Local E2E phase1678 (typecheck) | done | `e2e-phase1678.sh` **OK** |
| Local E2E phase1679 (e2e-all + gaps) | done | `e2e-phase1679.sh` **OK** |
| Local E2E phase1680 (STATUS soft-complete) | done | `e2e-phase1680.sh` **OK** |
| Local E2E phase1681 (milestone 3350) | done | `e2e-phase1681.sh` **OK** |
| Local E2E phase1682 (milestone 3350 endpoints) | done | `e2e-phase1682.sh` **OK** |
| Local E2E phase1683 (milestone 3350 UI) | done | `e2e-phase1683.sh` **OK** |
| Local E2E phase1684 (STATUS milestone 3350) | done | `e2e-phase1684.sh` **OK** |
| Local E2E phase1685 (marker 1688) | done | `e2e-phase1685.sh` **OK** |
| Local E2E phase1686 (typecheck) | done | `e2e-phase1686.sh` **OK** |
| Local E2E phase1687 (e2e-all + gaps) | done | `e2e-phase1687.sh` **OK** |
| Local E2E phase1688 (STATUS soft-complete) | done | `e2e-phase1688.sh` **OK** |
| Local E2E phase1689 (clear catalog data) | done | `e2e-phase1689.sh` **OK** |
| Local E2E phase1690 (UI clear detail/download) | done | `e2e-phase1690.sh` **OK** |
| Local E2E phase1691 (client clear types) | done | `e2e-phase1691.sh` **OK** |
| Local E2E phase1692 (STATUS clear detail) | done | `e2e-phase1692.sh` **OK** |
| Local E2E phase1693 (marker 1696) | done | `e2e-phase1693.sh` **OK** |
| Local E2E phase1694 (typecheck) | done | `e2e-phase1694.sh` **OK** |
| Local E2E phase1695 (e2e-all + gaps) | done | `e2e-phase1695.sh` **OK** |
| Local E2E phase1696 (STATUS soft-complete) | done | `e2e-phase1696.sh` **OK** |
| Local E2E phase1697 (milestone 3400) | done | `e2e-phase1697.sh` **OK** |
| Local E2E phase1698 (milestone 3400 endpoints) | done | `e2e-phase1698.sh` **OK** |
| Local E2E phase1699 (milestone 3400 UI) | done | `e2e-phase1699.sh` **OK** |
| Local E2E phase1700 (STATUS milestone 3400) | done | `e2e-phase1700.sh` **OK** |
| Local E2E phase1701 (marker 1704) | done | `e2e-phase1701.sh` **OK** |
| Local E2E phase1702 (typecheck) | done | `e2e-phase1702.sh` **OK** |
| Local E2E phase1703 (e2e-all + gaps) | done | `e2e-phase1703.sh` **OK** |
| Local E2E phase1704 (STATUS soft-complete) | done | `e2e-phase1704.sh` **OK** |
| Local E2E phase1705 (clear in export/bundle) | done | `e2e-phase1705.sh` **OK** |
| Local E2E phase1706 (UI bundle clear section) | done | `e2e-phase1706.sh` **OK** |
| Local E2E phase1707 (client export/bundle types) | done | `e2e-phase1707.sh` **OK** |
| Local E2E phase1708 (STATUS clear export/bundle) | done | `e2e-phase1708.sh` **OK** |
| Local E2E phase1709 (marker 1712) | done | `e2e-phase1709.sh` **OK** |
| Local E2E phase1710 (typecheck) | done | `e2e-phase1710.sh` **OK** |
| Local E2E phase1711 (e2e-all + gaps) | done | `e2e-phase1711.sh` **OK** |
| Local E2E phase1712 (STATUS soft-complete) | done | `e2e-phase1712.sh` **OK** |
| Local E2E phase1713 (milestone 3450) | done | `e2e-phase1713.sh` **OK** |
| Local E2E phase1714 (milestone 3450 endpoints) | done | `e2e-phase1714.sh` **OK** |
| Local E2E phase1715 (milestone 3450 UI) | done | `e2e-phase1715.sh` **OK** |
| Local E2E phase1716 (STATUS milestone 3450) | done | `e2e-phase1716.sh` **OK** |
| Local E2E phase1717 (marker 1720) | done | `e2e-phase1717.sh` **OK** |
| Local E2E phase1718 (typecheck) | done | `e2e-phase1718.sh` **OK** |
| Local E2E phase1719 (e2e-all + gaps) | done | `e2e-phase1719.sh` **OK** |
| Local E2E phase1720 (STATUS soft-complete) | done | `e2e-phase1720.sh` **OK** |
| Local E2E phase1721 (surface version) | done | `e2e-phase1721.sh` **OK** |
| Local E2E phase1722 (UI surface version) | done | `e2e-phase1722.sh` **OK** |
| Local E2E phase1723 (client surface version types) | done | `e2e-phase1723.sh` **OK** |
| Local E2E phase1724 (STATUS surface version) | done | `e2e-phase1724.sh` **OK** |
| Local E2E phase1725 (marker 1728) | done | `e2e-phase1725.sh` **OK** |
| Local E2E phase1726 (typecheck) | done | `e2e-phase1726.sh` **OK** |
| Local E2E phase1727 (e2e-all + gaps) | done | `e2e-phase1727.sh` **OK** |
| Local E2E phase1728 (STATUS soft-complete) | done | `e2e-phase1728.sh` **OK** |
| Local E2E phase1729 (milestone 3500) | done | `e2e-phase1729.sh` **OK** |
| Local E2E phase1730 (milestone 3500 endpoints) | done | `e2e-phase1730.sh` **OK** |
| Local E2E phase1731 (milestone 3500 UI) | done | `e2e-phase1731.sh` **OK** |
| Local E2E phase1732 (STATUS milestone 3500) | done | `e2e-phase1732.sh` **OK** |
| Local E2E phase1733 (marker 1736) | done | `e2e-phase1733.sh` **OK** |
| Local E2E phase1734 (typecheck) | done | `e2e-phase1734.sh` **OK** |
| Local E2E phase1735 (e2e-all + gaps) | done | `e2e-phase1735.sh` **OK** |
| Local E2E phase1736 (STATUS soft-complete) | done | `e2e-phase1736.sh` **OK** |
| Local E2E phase1737 (surface_version export/bundle) | done | `e2e-phase1737.sh` **OK** |
| Local E2E phase1738 (UI surface version download) | done | `e2e-phase1738.sh` **OK** |
| Local E2E phase1739 (client surface_version types) | done | `e2e-phase1739.sh` **OK** |
| Local E2E phase1740 (STATUS surface_version export/bundle) | done | `e2e-phase1740.sh` **OK** |
| Local E2E phase1741 (marker 1744) | done | `e2e-phase1741.sh` **OK** |
| Local E2E phase1742 (typecheck) | done | `e2e-phase1742.sh` **OK** |
| Local E2E phase1743 (e2e-all + gaps) | done | `e2e-phase1743.sh` **OK** |
| Local E2E phase1744 (STATUS soft-complete) | done | `e2e-phase1744.sh` **OK** |
| Local E2E phase1745 (milestone 3550) | done | `e2e-phase1745.sh` **OK** |
| Local E2E phase1746 (milestone 3550 endpoints) | done | `e2e-phase1746.sh` **OK** |
| Local E2E phase1747 (milestone 3550 UI) | done | `e2e-phase1747.sh` **OK** |
| Local E2E phase1748 (STATUS milestone 3550) | done | `e2e-phase1748.sh` **OK** |
| Local E2E phase1749 (marker 1752) | done | `e2e-phase1749.sh` **OK** |
| Local E2E phase1750 (typecheck) | done | `e2e-phase1750.sh` **OK** |
| Local E2E phase1751 (e2e-all + gaps) | done | `e2e-phase1751.sh` **OK** |
| Local E2E phase1752 (STATUS soft-complete) | done | `e2e-phase1752.sh` **OK** |
| Local E2E phase1753 (catalog summary) | done | `e2e-phase1753.sh` **OK** |
| Local E2E phase1754 (UI surface/summary) | done | `e2e-phase1754.sh` **OK** |
| Local E2E phase1755 (client catalog summary type) | done | `e2e-phase1755.sh` **OK** |
| Local E2E phase1756 (STATUS catalog summary) | done | `e2e-phase1756.sh` **OK** |
| Local E2E phase1757 (marker 1760) | done | `e2e-phase1757.sh` **OK** |
| Local E2E phase1758 (typecheck) | done | `e2e-phase1758.sh` **OK** |
| Local E2E phase1759 (e2e-all + gaps) | done | `e2e-phase1759.sh` **OK** |
| Local E2E phase1760 (STATUS soft-complete) | done | `e2e-phase1760.sh` **OK** |
| Local E2E phase1761 (milestone 3600) | done | `e2e-phase1761.sh` **OK** |
| Local E2E phase1762 (milestone 3600 endpoints) | done | `e2e-phase1762.sh` **OK** |
| Local E2E phase1763 (milestone 3600 UI) | done | `e2e-phase1763.sh` **OK** |
| Local E2E phase1764 (STATUS milestone 3600) | done | `e2e-phase1764.sh` **OK** |
| Local E2E phase1765 (marker 1768) | done | `e2e-phase1765.sh` **OK** |
| Local E2E phase1766 (typecheck) | done | `e2e-phase1766.sh` **OK** |
| Local E2E phase1767 (e2e-all + gaps) | done | `e2e-phase1767.sh` **OK** |
| Local E2E phase1768 (STATUS soft-complete) | done | `e2e-phase1768.sh` **OK** |
| Local E2E phase1769 (catalog summary data) | done | `e2e-phase1769.sh` **OK** |
| Local E2E phase1770 (UI catalog summary) | done | `e2e-phase1770.sh` **OK** |
| Local E2E phase1771 (client catalog summary) | done | `e2e-phase1771.sh` **OK** |
| Local E2E phase1772 (STATUS catalog summary UI) | done | `e2e-phase1772.sh` **OK** |
| Local E2E phase1773 (marker 1776) | done | `e2e-phase1773.sh` **OK** |
| Local E2E phase1774 (typecheck) | done | `e2e-phase1774.sh` **OK** |
| Local E2E phase1775 (e2e-all + gaps) | done | `e2e-phase1775.sh` **OK** |
| Local E2E phase1776 (STATUS soft-complete) | done | `e2e-phase1776.sh` **OK** |
| Local E2E phase1777 (milestone 3650) | done | `e2e-phase1777.sh` **OK** |
| Local E2E phase1778 (milestone 3650 endpoints) | done | `e2e-phase1778.sh` **OK** |
| Local E2E phase1779 (milestone 3650 UI) | done | `e2e-phase1779.sh` **OK** |
| Local E2E phase1780 (STATUS milestone 3650) | done | `e2e-phase1780.sh` **OK** |
| Local E2E phase1781 (marker 1784) | done | `e2e-phase1781.sh` **OK** |
| Local E2E phase1782 (typecheck) | done | `e2e-phase1782.sh` **OK** |
| Local E2E phase1783 (e2e-all + gaps) | done | `e2e-phase1783.sh` **OK** |
| Local E2E phase1784 (STATUS soft-complete) | done | `e2e-phase1784.sh` **OK** |
| Local E2E phase1785 (catalog_summary export/bundle) | done | `e2e-phase1785.sh` **OK** |
| Local E2E phase1786 (UI bundle catalog_summary) | done | `e2e-phase1786.sh` **OK** |
| Local E2E phase1787 (client catalog_summary types) | done | `e2e-phase1787.sh` **OK** |
| Local E2E phase1788 (STATUS catalog_summary export/bundle) | done | `e2e-phase1788.sh` **OK** |
| Local E2E phase1789 (marker 1792) | done | `e2e-phase1789.sh` **OK** |
| Local E2E phase1790 (typecheck) | done | `e2e-phase1790.sh` **OK** |
| Local E2E phase1791 (e2e-all + gaps) | done | `e2e-phase1791.sh` **OK** |
| Local E2E phase1792 (STATUS soft-complete) | done | `e2e-phase1792.sh` **OK** |
| Local E2E phase1793 (milestone 3700) | done | `e2e-phase1793.sh` **OK** |
| Local E2E phase1794 (milestone 3700 endpoints) | done | `e2e-phase1794.sh` **OK** |
| Local E2E phase1795 (milestone 3700 UI) | done | `e2e-phase1795.sh` **OK** |
| Local E2E phase1796 (STATUS milestone 3700) | done | `e2e-phase1796.sh` **OK** |
| Local E2E phase1797 (marker 1800) | done | `e2e-phase1797.sh` **OK** |
| Local E2E phase1798 (typecheck) | done | `e2e-phase1798.sh` **OK** |
| Local E2E phase1799 (e2e-all + gaps) | done | `e2e-phase1799.sh` **OK** |
| Local E2E phase1800 (STATUS soft-complete) | done | `e2e-phase1800.sh` **OK** |
| Local E2E phase1801 (surface version 1.1) | done | `e2e-phase1801.sh` **OK** |
| Local E2E phase1802 (UI surface schema) | done | `e2e-phase1802.sh` **OK** |
| Local E2E phase1803 (client surface version) | done | `e2e-phase1803.sh` **OK** |
| Local E2E phase1804 (STATUS schema 1.1) | done | `e2e-phase1804.sh` **OK** |
| Local E2E phase1805 (marker 1808) | done | `e2e-phase1805.sh` **OK** |
| Local E2E phase1806 (typecheck) | done | `e2e-phase1806.sh` **OK** |
| Local E2E phase1807 (e2e-all + gaps) | done | `e2e-phase1807.sh` **OK** |
| Local E2E phase1808 (STATUS soft-complete) | done | `e2e-phase1808.sh` **OK** |
| Local E2E phase1809 (milestone 3750) | done | `e2e-phase1809.sh` **OK** |
| Local E2E phase1810 (milestone 3750 endpoints) | done | `e2e-phase1810.sh` **OK** |
| Local E2E phase1811 (milestone 3750 UI) | done | `e2e-phase1811.sh` **OK** |
| Local E2E phase1812 (STATUS milestone 3750) | done | `e2e-phase1812.sh` **OK** |
| Local E2E phase1813 (marker 1816) | done | `e2e-phase1813.sh` **OK** |
| Local E2E phase1814 (typecheck) | done | `e2e-phase1814.sh` **OK** |
| Local E2E phase1815 (e2e-all + gaps) | done | `e2e-phase1815.sh` **OK** |
| Local E2E phase1816 (STATUS soft-complete) | done | `e2e-phase1816.sh` **OK** |
| Local E2E phase1817 (honesty track note) | done | `e2e-phase1817.sh` **OK** |
| Local E2E phase1818 (UI track note) | done | `e2e-phase1818.sh` **OK** |
| Local E2E phase1819 (client track note type) | done | `e2e-phase1819.sh` **OK** |
| Local E2E phase1820 (STATUS track note) | done | `e2e-phase1820.sh` **OK** |
| Local E2E phase1821 (marker 1824) | done | `e2e-phase1821.sh` **OK** |
| Local E2E phase1822 (typecheck) | done | `e2e-phase1822.sh` **OK** |
| Local E2E phase1823 (e2e-all + gaps) | done | `e2e-phase1823.sh` **OK** |
| Local E2E phase1824 (STATUS soft-complete) | done | `e2e-phase1824.sh` **OK** |
| Local E2E phase1825 (milestone 3800) | done | `e2e-phase1825.sh` **OK** |
| Local E2E phase1826 (milestone 3800 endpoints) | done | `e2e-phase1826.sh` **OK** |
| Local E2E phase1827 (milestone 3800 UI) | done | `e2e-phase1827.sh` **OK** |
| Local E2E phase1828 (STATUS milestone 3800) | done | `e2e-phase1828.sh` **OK** |
| Local E2E phase1829 (marker 1832) | done | `e2e-phase1829.sh` **OK** |
| Local E2E phase1830 (typecheck) | done | `e2e-phase1830.sh` **OK** |
| Local E2E phase1831 (e2e-all + gaps) | done | `e2e-phase1831.sh` **OK** |
| Local E2E phase1832 (STATUS soft-complete) | done | `e2e-phase1832.sh` **OK** |
| Local E2E phase1833 (track_note catalogs) | done | `e2e-phase1833.sh` **OK** |
| Local E2E phase1834 (UI track_note download) | done | `e2e-phase1834.sh` **OK** |
| Local E2E phase1835 (client track_note) | done | `e2e-phase1835.sh` **OK** |
| Local E2E phase1836 (STATUS track_note export/bundle) | done | `e2e-phase1836.sh` **OK** |
| Local E2E phase1837 (marker 1840) | done | `e2e-phase1837.sh` **OK** |
| Local E2E phase1838 (typecheck) | done | `e2e-phase1838.sh` **OK** |
| Local E2E phase1839 (e2e-all + gaps) | done | `e2e-phase1839.sh` **OK** |
| Local E2E phase1840 (STATUS soft-complete) | done | `e2e-phase1840.sh` **OK** |
| Local E2E phase1841 (milestone 3850) | done | `e2e-phase1841.sh` **OK** |
| Local E2E phase1842 (milestone 3850 endpoints) | done | `e2e-phase1842.sh` **OK** |
| Local E2E phase1843 (milestone 3850 UI) | done | `e2e-phase1843.sh` **OK** |
| Local E2E phase1844 (STATUS milestone 3850) | done | `e2e-phase1844.sh` **OK** |
| Local E2E phase1845 (marker 1848) | done | `e2e-phase1845.sh` **OK** |
| Local E2E phase1846 (typecheck) | done | `e2e-phase1846.sh` **OK** |
| Local E2E phase1847 (e2e-all + gaps) | done | `e2e-phase1847.sh` **OK** |
| Local E2E phase1848 (STATUS soft-complete) | done | `e2e-phase1848.sh` **OK** |
| Local E2E phase1849 (track_note sessionStorage) | done | `e2e-phase1849.sh` **OK** |
| Local E2E phase1850 (UI track_note session) | done | `e2e-phase1850.sh` **OK** |
| Local E2E phase1851 (track_note session notes) | done | `e2e-phase1851.sh` **OK** |
| Local E2E phase1852 (STATUS track_note session) | done | `e2e-phase1852.sh` **OK** |
| Local E2E phase1853 (marker 1856) | done | `e2e-phase1853.sh` **OK** |
| Local E2E phase1854 (typecheck) | done | `e2e-phase1854.sh` **OK** |
| Local E2E phase1855 (e2e-all + gaps) | done | `e2e-phase1855.sh` **OK** |
| Local E2E phase1856 (STATUS soft-complete) | done | `e2e-phase1856.sh` **OK** |
| Local E2E phase1857 (milestone 3900) | done | `e2e-phase1857.sh` **OK** |
| Local E2E phase1858 (milestone 3900 endpoints) | done | `e2e-phase1858.sh` **OK** |
| Local E2E phase1859 (milestone 3900 UI) | done | `e2e-phase1859.sh` **OK** |
| Local E2E phase1860 (STATUS milestone 3900) | done | `e2e-phase1860.sh` **OK** |
| Local E2E phase1861 (marker 1864) | done | `e2e-phase1861.sh` **OK** |
| Local E2E phase1862 (typecheck) | done | `e2e-phase1862.sh` **OK** |
| Local E2E phase1863 (e2e-all + gaps) | done | `e2e-phase1863.sh` **OK** |
| Local E2E phase1864 (STATUS soft-complete) | done | `e2e-phase1864.sh` **OK** |
| Local E2E phase1865 (schema 1.2) | done | `e2e-phase1865.sh` **OK** |
| Local E2E phase1866 (UI surface schema) | done | `e2e-phase1866.sh` **OK** |
| Local E2E phase1867 (client surface version) | done | `e2e-phase1867.sh` **OK** |
| Local E2E phase1868 (STATUS schema 1.2) | done | `e2e-phase1868.sh` **OK** |
| Local E2E phase1869 (marker 1872) | done | `e2e-phase1869.sh` **OK** |
| Local E2E phase1870 (typecheck) | done | `e2e-phase1870.sh` **OK** |
| Local E2E phase1871 (e2e-all + gaps) | done | `e2e-phase1871.sh` **OK** |
| Local E2E phase1872 (STATUS soft-complete) | done | `e2e-phase1872.sh` **OK** |
| Local E2E phase1873 (milestone 3950) | done | `e2e-phase1873.sh` **OK** |
| Local E2E phase1874 (milestone 3950 endpoints) | done | `e2e-phase1874.sh` **OK** |
| Local E2E phase1875 (milestone 3950 UI) | done | `e2e-phase1875.sh` **OK** |
| Local E2E phase1876 (STATUS milestone 3950) | done | `e2e-phase1876.sh` **OK** |
| Local E2E phase1877 (marker 1880) | done | `e2e-phase1877.sh` **OK** |
| Local E2E phase1878 (typecheck) | done | `e2e-phase1878.sh` **OK** |
| Local E2E phase1879 (e2e-all + gaps) | done | `e2e-phase1879.sh` **OK** |
| Local E2E phase1880 (STATUS soft-complete) | done | `e2e-phase1880.sh` **OK** |
| Local E2E phase1881 (track_note restore note) | done | `e2e-phase1881.sh` **OK** |
| Local E2E phase1882 (UI track note detail) | done | `e2e-phase1882.sh` **OK** |
| Local E2E phase1883 (UI track note restore) | done | `e2e-phase1883.sh` **OK** |
| Local E2E phase1884 (STATUS track note detail) | done | `e2e-phase1884.sh` **OK** |
| Local E2E phase1885 (marker 1888) | done | `e2e-phase1885.sh` **OK** |
| Local E2E phase1886 (typecheck) | done | `e2e-phase1886.sh` **OK** |
| Local E2E phase1887 (e2e-all + gaps) | done | `e2e-phase1887.sh` **OK** |
| Local E2E phase1888 (STATUS soft-complete) | done | `e2e-phase1888.sh` **OK** |
| Local E2E phase1889 (milestone 4000) | done | `e2e-phase1889.sh` **OK** |
| Local E2E phase1890 (milestone 4000 endpoints) | done | `e2e-phase1890.sh` **OK** |
| Local E2E phase1891 (milestone 4000 UI) | done | `e2e-phase1891.sh` **OK** |
| Local E2E phase1892 (STATUS milestone 4000) | done | `e2e-phase1892.sh` **OK** |
| Local E2E phase1893 (marker 1896) | done | `e2e-phase1893.sh` **OK** |
| Local E2E phase1894 (typecheck) | done | `e2e-phase1894.sh` **OK** |
| Local E2E phase1895 (e2e-all + gaps) | done | `e2e-phase1895.sh` **OK** |
| Local E2E phase1896 (STATUS soft-complete) | done | `e2e-phase1896.sh` **OK** |
| Local E2E phase1897 (honesty readiness) | done | `e2e-phase1897.sh` **OK** |
| Local E2E phase1898 (UI honesty readiness) | done | `e2e-phase1898.sh` **OK** |
| Local E2E phase1899 (client readiness type) | done | `e2e-phase1899.sh` **OK** |
| Local E2E phase1900 (STATUS honesty readiness) | done | `e2e-phase1900.sh` **OK** |
| Local E2E phase1901 (marker 1904) | done | `e2e-phase1901.sh` **OK** |
| Local E2E phase1902 (typecheck) | done | `e2e-phase1902.sh` **OK** |
| Local E2E phase1903 (e2e-all + gaps) | done | `e2e-phase1903.sh` **OK** |
| Local E2E phase1904 (STATUS soft-complete) | done | `e2e-phase1904.sh` **OK** |
| Local E2E phase1905 (milestone 4050) | done | `e2e-phase1905.sh` **OK** |
| Local E2E phase1906 (milestone 4050 endpoints) | done | `e2e-phase1906.sh` **OK** |
| Local E2E phase1907 (milestone 4050 UI) | done | `e2e-phase1907.sh` **OK** |
| Local E2E phase1908 (STATUS milestone 4050) | done | `e2e-phase1908.sh` **OK** |
| Local E2E phase1909 (marker 1912) | done | `e2e-phase1909.sh` **OK** |
| Local E2E phase1910 (typecheck) | done | `e2e-phase1910.sh` **OK** |
| Local E2E phase1911 (e2e-all + gaps) | done | `e2e-phase1911.sh` **OK** |
| Local E2E phase1912 (STATUS soft-complete) | done | `e2e-phase1912.sh` **OK** |
| Local E2E phase1913 (readiness export/bundle) | done | `e2e-phase1913.sh` **OK** |
| Local E2E phase1914 (UI readiness bundle) | done | `e2e-phase1914.sh` **OK** |
| Local E2E phase1915 (readiness notes) | done | `e2e-phase1915.sh` **OK** |
| Local E2E phase1916 (STATUS readiness export/bundle) | done | `e2e-phase1916.sh` **OK** |
| Local E2E phase1917 (marker 1920) | done | `e2e-phase1917.sh` **OK** |
| Local E2E phase1918 (typecheck) | done | `e2e-phase1918.sh` **OK** |
| Local E2E phase1919 (e2e-all + gaps) | done | `e2e-phase1919.sh` **OK** |
| Local E2E phase1920 (STATUS soft-complete) | done | `e2e-phase1920.sh` **OK** |
| Local E2E phase1921 (milestone 4100) | done | `e2e-phase1921.sh` **OK** |
| Local E2E phase1922 (milestone 4100 endpoints) | done | `e2e-phase1922.sh` **OK** |
| Local E2E phase1923 (milestone 4100 UI) | done | `e2e-phase1923.sh` **OK** |
| Local E2E phase1924 (STATUS milestone 4100) | done | `e2e-phase1924.sh` **OK** |
| Local E2E phase1925 (marker 1928) | done | `e2e-phase1925.sh` **OK** |
| Local E2E phase1926 (typecheck) | done | `e2e-phase1926.sh` **OK** |
| Local E2E phase1927 (e2e-all + gaps) | done | `e2e-phase1927.sh` **OK** |
| Local E2E phase1928 (STATUS soft-complete) | done | `e2e-phase1928.sh` **OK** |
| Local E2E phase1929 (schema 1.3) | done | `e2e-phase1929.sh` **OK** |
| Local E2E phase1930 (UI surface schema) | done | `e2e-phase1930.sh` **OK** |
| Local E2E phase1931 (client surface/readiness) | done | `e2e-phase1931.sh` **OK** |
| Local E2E phase1932 (STATUS schema 1.3) | done | `e2e-phase1932.sh` **OK** |
| Local E2E phase1933 (marker 1936) | done | `e2e-phase1933.sh` **OK** |
| Local E2E phase1934 (typecheck) | done | `e2e-phase1934.sh` **OK** |
| Local E2E phase1935 (e2e-all + gaps) | done | `e2e-phase1935.sh` **OK** |
| Local E2E phase1936 (STATUS soft-complete) | done | `e2e-phase1936.sh` **OK** |
| Local E2E phase1937 (milestone 4150) | done | `e2e-phase1937.sh` **OK** |
| Local E2E phase1938 (milestone 4150 endpoints) | done | `e2e-phase1938.sh` **OK** |
| Local E2E phase1939 (milestone 4150 UI) | done | `e2e-phase1939.sh` **OK** |
| Local E2E phase1940 (STATUS milestone 4150) | done | `e2e-phase1940.sh` **OK** |
| Local E2E phase1941 (marker 1944) | done | `e2e-phase1941.sh` **OK** |
| Local E2E phase1942 (typecheck) | done | `e2e-phase1942.sh` **OK** |
| Local E2E phase1943 (e2e-all + gaps) | done | `e2e-phase1943.sh` **OK** |
| Local E2E phase1944 (STATUS soft-complete) | done | `e2e-phase1944.sh` **OK** |
| Local E2E phase1945 (readiness sessionStorage) | done | `e2e-phase1945.sh` **OK** |
| Local E2E phase1946 (UI readiness session) | done | `e2e-phase1946.sh` **OK** |
| Local E2E phase1947 (readiness session notes) | done | `e2e-phase1947.sh` **OK** |
| Local E2E phase1948 (STATUS readiness session) | done | `e2e-phase1948.sh` **OK** |
| Local E2E phase1949 (marker 1952) | done | `e2e-phase1949.sh` **OK** |
| Local E2E phase1950 (typecheck) | done | `e2e-phase1950.sh` **OK** |
| Local E2E phase1951 (e2e-all + gaps) | done | `e2e-phase1951.sh` **OK** |
| Local E2E phase1952 (STATUS soft-complete) | done | `e2e-phase1952.sh` **OK** |
| Local E2E phase1953 (milestone 4200) | done | `e2e-phase1953.sh` **OK** |
| Local E2E phase1954 (milestone 4200 endpoints) | done | `e2e-phase1954.sh` **OK** |
| Local E2E phase1955 (milestone 4200 UI) | done | `e2e-phase1955.sh` **OK** |
| Local E2E phase1956 (STATUS milestone 4200) | done | `e2e-phase1956.sh` **OK** |
| Local E2E phase1957 (marker 1960) | done | `e2e-phase1957.sh` **OK** |
| Local E2E phase1958 (typecheck) | done | `e2e-phase1958.sh` **OK** |
| Local E2E phase1959 (e2e-all + gaps) | done | `e2e-phase1959.sh` **OK** |
| Local E2E phase1960 (STATUS soft-complete) | done | `e2e-phase1960.sh` **OK** |
| Local E2E phase1961 (catalog_summary readiness flags) | done | `e2e-phase1961.sh` **OK** |
| Local E2E phase1962 (UI catalog summary) | done | `e2e-phase1962.sh` **OK** |
| Local E2E phase1963 (client catalog summary) | done | `e2e-phase1963.sh` **OK** |
| Local E2E phase1964 (STATUS catalog flags) | done | `e2e-phase1964.sh` **OK** |
| Local E2E phase1965 (marker 1968) | done | `e2e-phase1965.sh` **OK** |
| Local E2E phase1966 (typecheck) | done | `e2e-phase1966.sh` **OK** |
| Local E2E phase1967 (e2e-all + gaps) | done | `e2e-phase1967.sh` **OK** |
| Local E2E phase1968 (STATUS soft-complete) | done | `e2e-phase1968.sh` **OK** |
| Local E2E phase1969 (milestone 4250) | done | `e2e-phase1969.sh` **OK** |
| Local E2E phase1970 (milestone 4250 endpoints) | done | `e2e-phase1970.sh` **OK** |
| Local E2E phase1971 (milestone 4250 UI) | done | `e2e-phase1971.sh` **OK** |
| Local E2E phase1972 (STATUS milestone 4250) | done | `e2e-phase1972.sh` **OK** |
| Local E2E phase1973 (marker 1976) | done | `e2e-phase1973.sh` **OK** |
| Local E2E phase1974 (typecheck) | done | `e2e-phase1974.sh` **OK** |
| Local E2E phase1975 (e2e-all + gaps) | done | `e2e-phase1975.sh` **OK** |
| Local E2E phase1976 (STATUS soft-complete) | done | `e2e-phase1976.sh` **OK** |
| Local E2E phase1977 (schema 1.4) | done | `e2e-phase1977.sh` **OK** |
| Local E2E phase1978 (UI surface schema) | done | `e2e-phase1978.sh` **OK** |
| Local E2E phase1979 (client surface version) | done | `e2e-phase1979.sh` **OK** |
| Local E2E phase1980 (STATUS schema 1.4) | done | `e2e-phase1980.sh` **OK** |
| Local E2E phase1981 (marker 1984) | done | `e2e-phase1981.sh` **OK** |
| Local E2E phase1982 (typecheck) | done | `e2e-phase1982.sh` **OK** |
| Local E2E phase1983 (e2e-all + gaps) | done | `e2e-phase1983.sh` **OK** |
| Local E2E phase1984 (STATUS soft-complete) | done | `e2e-phase1984.sh` **OK** |
| Local E2E phase1985 (milestone 4300) | done | `e2e-phase1985.sh` **OK** |
| Local E2E phase1986 (milestone 4300 endpoints) | done | `e2e-phase1986.sh` **OK** |
| Local E2E phase1987 (milestone 4300 UI) | done | `e2e-phase1987.sh` **OK** |
| Local E2E phase1988 (STATUS milestone 4300) | done | `e2e-phase1988.sh` **OK** |
| Local E2E phase1989 (marker 1992) | done | `e2e-phase1989.sh` **OK** |
| Local E2E phase1990 (typecheck) | done | `e2e-phase1990.sh` **OK** |
| Local E2E phase1991 (e2e-all + gaps) | done | `e2e-phase1991.sh` **OK** |
| Local E2E phase1992 (STATUS soft-complete) | done | `e2e-phase1992.sh` **OK** |
| Local E2E phase1993 (soft_complete_note) | done | `e2e-phase1993.sh` **OK** |
| Local E2E phase1994 (UI soft_complete_note) | done | `e2e-phase1994.sh` **OK** |
| Local E2E phase1995 (client soft_complete_note) | done | `e2e-phase1995.sh` **OK** |
| Local E2E phase1996 (STATUS soft_complete_note) | done | `e2e-phase1996.sh` **OK** |
| Local E2E phase1997 (marker 2000) | done | `e2e-phase1997.sh` **OK** |
| Local E2E phase1998 (typecheck) | done | `e2e-phase1998.sh` **OK** |
| Local E2E phase1999 (e2e-all + gaps) | done | `e2e-phase1999.sh` **OK** |
| Local E2E phase2000 (STATUS soft-complete) | done | `e2e-phase2000.sh` **OK** |
| Local E2E phase2001 (milestone 4350) | done | `e2e-phase2001.sh` **OK** |
| Local E2E phase2002 (milestone 4350 endpoints) | done | `e2e-phase2002.sh` **OK** |
| Local E2E phase2003 (milestone 4350 UI) | done | `e2e-phase2003.sh` **OK** |
| Local E2E phase2004 (STATUS milestone 4350) | done | `e2e-phase2004.sh` **OK** |
| Local E2E phase2005 (marker 2008) | done | `e2e-phase2005.sh` **OK** |
| Local E2E phase2006 (typecheck) | done | `e2e-phase2006.sh` **OK** |
| Local E2E phase2007 (e2e-all + gaps) | done | `e2e-phase2007.sh` **OK** |
| Local E2E phase2008 (STATUS soft-complete) | done | `e2e-phase2008.sh` **OK** |
| Local E2E phase2009 (soft_complete_note export/bundle) | done | `e2e-phase2009.sh` **OK** |
| Local E2E phase2010 (UI soft_complete_note download) | done | `e2e-phase2010.sh` **OK** |
| Local E2E phase2011 (soft_complete_note notes) | done | `e2e-phase2011.sh` **OK** |
| Local E2E phase2012 (STATUS soft_complete_note export) | done | `e2e-phase2012.sh` **OK** |
| Local E2E phase2013 (marker 2016) | done | `e2e-phase2013.sh` **OK** |
| Local E2E phase2014 (typecheck) | done | `e2e-phase2014.sh` **OK** |
| Local E2E phase2015 (e2e-all + gaps) | done | `e2e-phase2015.sh` **OK** |
| Local E2E phase2016 (STATUS soft-complete) | done | `e2e-phase2016.sh` **OK** |
| Local E2E phase2017 (milestone 4400) | done | `e2e-phase2017.sh` **OK** |
| Local E2E phase2018 (milestone 4400 endpoints) | done | `e2e-phase2018.sh` **OK** |
| Local E2E phase2019 (milestone 4400 UI) | done | `e2e-phase2019.sh` **OK** |
| Local E2E phase2020 (STATUS milestone 4400) | done | `e2e-phase2020.sh` **OK** |
| Local E2E phase2021 (marker 2024) | done | `e2e-phase2021.sh` **OK** |
| Local E2E phase2022 (typecheck) | done | `e2e-phase2022.sh` **OK** |
| Local E2E phase2023 (e2e-all + gaps) | done | `e2e-phase2023.sh` **OK** |
| Local E2E phase2024 (STATUS soft-complete) | done | `e2e-phase2024.sh` **OK** |
| Local E2E phase2025 (schema 1.5) | done | `e2e-phase2025.sh` **OK** |
| Local E2E phase2026 (UI surface schema) | done | `e2e-phase2026.sh` **OK** |
| Local E2E phase2027 (client surface/soft_complete) | done | `e2e-phase2027.sh` **OK** |
| Local E2E phase2028 (STATUS schema 1.5) | done | `e2e-phase2028.sh` **OK** |
| Local E2E phase2029 (marker 2032) | done | `e2e-phase2029.sh` **OK** |
| Local E2E phase2030 (typecheck) | done | `e2e-phase2030.sh` **OK** |
| Local E2E phase2031 (e2e-all + gaps) | done | `e2e-phase2031.sh` **OK** |
| Local E2E phase2032 (STATUS soft-complete) | done | `e2e-phase2032.sh` **OK** |
| Local E2E phase2033 (milestone 4450) | done | `e2e-phase2033.sh` **OK** |
| Local E2E phase2034 (milestone 4450 endpoints) | done | `e2e-phase2034.sh` **OK** |
| Local E2E phase2035 (milestone 4450 UI) | done | `e2e-phase2035.sh` **OK** |
| Local E2E phase2036 (STATUS milestone 4450) | done | `e2e-phase2036.sh` **OK** |
| Local E2E phase2037 (marker 2040) | done | `e2e-phase2037.sh` **OK** |
| Local E2E phase2038 (typecheck) | done | `e2e-phase2038.sh` **OK** |
| Local E2E phase2039 (e2e-all + gaps) | done | `e2e-phase2039.sh` **OK** |
| Local E2E phase2040 (STATUS soft-complete) | done | `e2e-phase2040.sh` **OK** |
| Local E2E phase2041 (soft_complete_note sessionStorage) | done | `e2e-phase2041.sh` **OK** |
| Local E2E phase2042 (UI soft_complete_note session) | done | `e2e-phase2042.sh` **OK** |
| Local E2E phase2043 (soft_complete_note session notes) | done | `e2e-phase2043.sh` **OK** |
| Local E2E phase2044 (STATUS soft_complete_note session) | done | `e2e-phase2044.sh` **OK** |
| Local E2E phase2045 (marker 2048) | done | `e2e-phase2045.sh` **OK** |
| Local E2E phase2046 (typecheck) | done | `e2e-phase2046.sh` **OK** |
| Local E2E phase2047 (e2e-all + gaps) | done | `e2e-phase2047.sh` **OK** |
| Local E2E phase2048 (STATUS soft-complete) | done | `e2e-phase2048.sh` **OK** |
| Local E2E phase2049 (milestone 4500) | done | `e2e-phase2049.sh` **OK** |
| Local E2E phase2050 (milestone 4500 endpoints) | done | `e2e-phase2050.sh` **OK** |
| Local E2E phase2051 (milestone 4500 UI) | done | `e2e-phase2051.sh` **OK** |
| Local E2E phase2052 (STATUS milestone 4500) | done | `e2e-phase2052.sh` **OK** |
| Local E2E phase2053 (marker 2056) | done | `e2e-phase2053.sh` **OK** |
| Local E2E phase2054 (typecheck) | done | `e2e-phase2054.sh` **OK** |
| Local E2E phase2055 (e2e-all + gaps) | done | `e2e-phase2055.sh` **OK** |
| Local E2E phase2056 (STATUS soft-complete) | done | `e2e-phase2056.sh` **OK** |
| Local E2E phase2057 (soft_complete_note restore note) | done | `e2e-phase2057.sh` **OK** |
| Local E2E phase2058 (UI soft_complete_note detail) | done | `e2e-phase2058.sh` **OK** |
| Local E2E phase2059 (UI soft_complete_note restore) | done | `e2e-phase2059.sh` **OK** |
| Local E2E phase2060 (STATUS soft_complete_note detail) | done | `e2e-phase2060.sh` **OK** |
| Local E2E phase2061 (marker 2064) | done | `e2e-phase2061.sh` **OK** |
| Local E2E phase2062 (typecheck) | done | `e2e-phase2062.sh` **OK** |
| Local E2E phase2063 (e2e-all + gaps) | done | `e2e-phase2063.sh` **OK** |
| Local E2E phase2064 (STATUS soft-complete) | done | `e2e-phase2064.sh` **OK** |
| Local E2E phase2065 (milestone 4550) | done | `e2e-phase2065.sh` **OK** |
| Local E2E phase2066 (milestone 4550 endpoints) | done | `e2e-phase2066.sh` **OK** |
| Local E2E phase2067 (milestone 4550 UI) | done | `e2e-phase2067.sh` **OK** |
| Local E2E phase2068 (STATUS milestone 4550) | done | `e2e-phase2068.sh` **OK** |
| Local E2E phase2069 (marker 2072) | done | `e2e-phase2069.sh` **OK** |
| Local E2E phase2070 (typecheck) | done | `e2e-phase2070.sh` **OK** |
| Local E2E phase2071 (e2e-all + gaps) | done | `e2e-phase2071.sh` **OK** |
| Local E2E phase2072 (STATUS soft-complete) | done | `e2e-phase2072.sh` **OK** |
| Local E2E phase2073 (honesty surface changelog) | done | `e2e-phase2073.sh` **OK** |
| Local E2E phase2074 (UI surface changelog) | done | `e2e-phase2074.sh` **OK** |
| Local E2E phase2075 (client changelog type) | done | `e2e-phase2075.sh` **OK** |
| Local E2E phase2076 (STATUS surface changelog) | done | `e2e-phase2076.sh` **OK** |
| Local E2E phase2077 (marker 2080) | done | `e2e-phase2077.sh` **OK** |
| Local E2E phase2078 (typecheck) | done | `e2e-phase2078.sh` **OK** |
| Local E2E phase2079 (e2e-all + gaps) | done | `e2e-phase2079.sh` **OK** |
| Local E2E phase2080 (STATUS soft-complete) | done | `e2e-phase2080.sh` **OK** |
| Local E2E phase2081 (milestone 4600) | done | `e2e-phase2081.sh` **OK** |
| Local E2E phase2082 (milestone 4600 endpoints) | done | `e2e-phase2082.sh` **OK** |
| Local E2E phase2083 (milestone 4600 UI) | done | `e2e-phase2083.sh` **OK** |
| Local E2E phase2084 (STATUS milestone 4600) | done | `e2e-phase2084.sh` **OK** |
| Local E2E phase2085 (marker 2088) | done | `e2e-phase2085.sh` **OK** |
| Local E2E phase2086 (typecheck) | done | `e2e-phase2086.sh` **OK** |
| Local E2E phase2087 (e2e-all + gaps) | done | `e2e-phase2087.sh` **OK** |
| Local E2E phase2088 (STATUS soft-complete) | done | `e2e-phase2088.sh` **OK** |
| Local E2E phase2089 (surface_changelog export) | done | `e2e-phase2089.sh` **OK** |
| Local E2E phase2090 (UI surface_changelog bundle) | done | `e2e-phase2090.sh` **OK** |
| Local E2E phase2091 (surface_changelog notes) | done | `e2e-phase2091.sh` **OK** |
| Local E2E phase2092 (STATUS surface_changelog export) | done | `e2e-phase2092.sh` **OK** |
| Local E2E phase2093 (marker 2096) | done | `e2e-phase2093.sh` **OK** |
| Local E2E phase2094 (typecheck) | done | `e2e-phase2094.sh` **OK** |
| Local E2E phase2095 (e2e-all + gaps) | done | `e2e-phase2095.sh` **OK** |
| Local E2E phase2096 (STATUS soft-complete) | done | `e2e-phase2096.sh` **OK** |
| Local E2E phase2097 (milestone 4650) | done | `e2e-phase2097.sh` **OK** |
| Local E2E phase2098 (milestone 4650 endpoints) | done | `e2e-phase2098.sh` **OK** |
| Local E2E phase2099 (milestone 4650 UI) | done | `e2e-phase2099.sh` **OK** |
| Local E2E phase2100 (STATUS milestone 4650) | done | `e2e-phase2100.sh` **OK** |
| Local E2E phase2101 (marker 2104) | done | `e2e-phase2101.sh` **OK** |
| Local E2E phase2102 (typecheck) | done | `e2e-phase2102.sh` **OK** |
| Local E2E phase2103 (e2e-all + gaps) | done | `e2e-phase2103.sh` **OK** |
| Local E2E phase2104 (STATUS soft-complete) | done | `e2e-phase2104.sh` **OK** |
| Local E2E phase2105 (schema 1.6) | done | `e2e-phase2105.sh` **OK** |
| Local E2E phase2106 (UI surface schema) | done | `e2e-phase2106.sh` **OK** |
| Local E2E phase2107 (client surface/changelog) | done | `e2e-phase2107.sh` **OK** |
| Local E2E phase2108 (STATUS schema 1.6) | done | `e2e-phase2108.sh` **OK** |
| Local E2E phase2109 (marker 2112) | done | `e2e-phase2109.sh` **OK** |
| Local E2E phase2110 (typecheck) | done | `e2e-phase2110.sh` **OK** |
| Local E2E phase2111 (e2e-all + gaps) | done | `e2e-phase2111.sh` **OK** |
| Local E2E phase2112 (STATUS soft-complete) | done | `e2e-phase2112.sh` **OK** |
| Local E2E phase2113 (milestone 4700) | done | `e2e-phase2113.sh` **OK** |
| Local E2E phase2114 (milestone 4700 endpoints) | done | `e2e-phase2114.sh` **OK** |
| Local E2E phase2115 (milestone 4700 UI) | done | `e2e-phase2115.sh` **OK** |
| Local E2E phase2116 (STATUS milestone 4700) | done | `e2e-phase2116.sh` **OK** |
| Local E2E phase2117 (marker 2120) | done | `e2e-phase2117.sh` **OK** |
| Local E2E phase2118 (typecheck) | done | `e2e-phase2118.sh` **OK** |
| Local E2E phase2119 (e2e-all + gaps) | done | `e2e-phase2119.sh` **OK** |
| Local E2E phase2120 (STATUS soft-complete) | done | `e2e-phase2120.sh` **OK** |
| Local E2E phase2121 (surface_changelog sessionStorage) | done | `e2e-phase2121.sh` **OK** |
| Local E2E phase2122 (UI surface_changelog session) | done | `e2e-phase2122.sh` **OK** |
| Local E2E phase2123 (surface_changelog session notes) | done | `e2e-phase2123.sh` **OK** |
| Local E2E phase2124 (STATUS surface_changelog session) | done | `e2e-phase2124.sh` **OK** |
| Local E2E phase2125 (marker 2128) | done | `e2e-phase2125.sh` **OK** |
| Local E2E phase2126 (typecheck) | done | `e2e-phase2126.sh` **OK** |
| Local E2E phase2127 (e2e-all + gaps) | done | `e2e-phase2127.sh` **OK** |
| Local E2E phase2128 (STATUS soft-complete) | done | `e2e-phase2128.sh` **OK** |
| Local E2E phase2129 (milestone 4750) | done | `e2e-phase2129.sh` **OK** |
| Local E2E phase2130 (milestone 4750 endpoints) | done | `e2e-phase2130.sh` **OK** |
| Local E2E phase2131 (milestone 4750 UI) | done | `e2e-phase2131.sh` **OK** |
| Local E2E phase2132 (STATUS milestone 4750) | done | `e2e-phase2132.sh` **OK** |
| Local E2E phase2133 (marker 2136) | done | `e2e-phase2133.sh` **OK** |
| Local E2E phase2134 (typecheck) | done | `e2e-phase2134.sh` **OK** |
| Local E2E phase2135 (e2e-all + gaps) | done | `e2e-phase2135.sh` **OK** |
| Local E2E phase2136 (STATUS soft-complete) | done | `e2e-phase2136.sh` **OK** |
| Local E2E phase2137 (honesty operator brief) | done | `e2e-phase2137.sh` **OK** |
| Local E2E phase2138 (UI operator brief) | done | `e2e-phase2138.sh` **OK** |
| Local E2E phase2139 (client operator brief type) | done | `e2e-phase2139.sh` **OK** |
| Local E2E phase2140 (STATUS operator brief) | done | `e2e-phase2140.sh` **OK** |
| Local E2E phase2141 (marker 2144) | done | `e2e-phase2141.sh` **OK** |
| Local E2E phase2142 (typecheck) | done | `e2e-phase2142.sh` **OK** |
| Local E2E phase2143 (e2e-all + gaps) | done | `e2e-phase2143.sh` **OK** |
| Local E2E phase2144 (STATUS soft-complete) | done | `e2e-phase2144.sh` **OK** |
| Local E2E phase2145 (milestone 4800) | done | `e2e-phase2145.sh` **OK** |
| Local E2E phase2146 (milestone 4800 endpoints) | done | `e2e-phase2146.sh` **OK** |
| Local E2E phase2147 (milestone 4800 UI) | done | `e2e-phase2147.sh` **OK** |
| Local E2E phase2148 (STATUS milestone 4800) | done | `e2e-phase2148.sh` **OK** |
| Local E2E phase2149 (marker 2152) | done | `e2e-phase2149.sh` **OK** |
| Local E2E phase2150 (typecheck) | done | `e2e-phase2150.sh` **OK** |
| Local E2E phase2151 (e2e-all + gaps) | done | `e2e-phase2151.sh` **OK** |
| Local E2E phase2152 (STATUS soft-complete) | done | `e2e-phase2152.sh` **OK** |
| Local E2E phase2153 (operator_brief export) | done | `e2e-phase2153.sh` **OK** |
| Local E2E phase2154 (UI operator_brief bundle) | done | `e2e-phase2154.sh` **OK** |
| Local E2E phase2155 (operator_brief notes) | done | `e2e-phase2155.sh` **OK** |
| Local E2E phase2156 (STATUS operator_brief export) | done | `e2e-phase2156.sh` **OK** |
| Local E2E phase2157 (marker 2160) | done | `e2e-phase2157.sh` **OK** |
| Local E2E phase2158 (typecheck) | done | `e2e-phase2158.sh` **OK** |
| Local E2E phase2159 (e2e-all + gaps) | done | `e2e-phase2159.sh` **OK** |
| Local E2E phase2160 (STATUS soft-complete) | done | `e2e-phase2160.sh` **OK** |
| Local E2E phase2161 (milestone 4850) | done | `e2e-phase2161.sh` **OK** |
| Local E2E phase2162 (milestone 4850 endpoints) | done | `e2e-phase2162.sh` **OK** |
| Local E2E phase2163 (milestone 4850 UI) | done | `e2e-phase2163.sh` **OK** |
| Local E2E phase2164 (STATUS milestone 4850) | done | `e2e-phase2164.sh` **OK** |
| Local E2E phase2165 (marker 2168) | done | `e2e-phase2165.sh` **OK** |
| Local E2E phase2166 (typecheck) | done | `e2e-phase2166.sh` **OK** |
| Local E2E phase2167 (e2e-all + gaps) | done | `e2e-phase2167.sh` **OK** |
| Local E2E phase2168 (STATUS soft-complete) | done | `e2e-phase2168.sh` **OK** |
| Local E2E phase2169 (schema 1.7) | done | `e2e-phase2169.sh` **OK** |
| Local E2E phase2170 (UI surface schema) | done | `e2e-phase2170.sh` **OK** |
| Local E2E phase2171 (client surface/operator brief) | done | `e2e-phase2171.sh` **OK** |
| Local E2E phase2172 (STATUS schema 1.7) | done | `e2e-phase2172.sh` **OK** |
| Local E2E phase2173 (marker 2176) | done | `e2e-phase2173.sh` **OK** |
| Local E2E phase2174 (typecheck) | done | `e2e-phase2174.sh` **OK** |
| Local E2E phase2175 (e2e-all + gaps) | done | `e2e-phase2175.sh` **OK** |
| Local E2E phase2176 (STATUS soft-complete) | done | `e2e-phase2176.sh` **OK** |
| Local E2E phase2177 (milestone 4900) | done | `e2e-phase2177.sh` **OK** |
| Local E2E phase2178 (milestone 4900 endpoints) | done | `e2e-phase2178.sh` **OK** |
| Local E2E phase2179 (milestone 4900 UI) | done | `e2e-phase2179.sh` **OK** |
| Local E2E phase2180 (STATUS milestone 4900) | done | `e2e-phase2180.sh` **OK** |
| Local E2E phase2181 (marker 2184) | done | `e2e-phase2181.sh` **OK** |
| Local E2E phase2182 (typecheck) | done | `e2e-phase2182.sh` **OK** |
| Local E2E phase2183 (e2e-all + gaps) | done | `e2e-phase2183.sh` **OK** |
| Local E2E phase2184 (STATUS soft-complete) | done | `e2e-phase2184.sh` **OK** |
| Local E2E phase2185 (operator_brief sessionStorage) | done | `e2e-phase2185.sh` **OK** |
| Local E2E phase2186 (UI operator_brief session) | done | `e2e-phase2186.sh` **OK** |
| Local E2E phase2187 (operator_brief session notes) | done | `e2e-phase2187.sh` **OK** |
| Local E2E phase2188 (STATUS operator_brief session) | done | `e2e-phase2188.sh` **OK** |
| Local E2E phase2189 (marker 2192) | done | `e2e-phase2189.sh` **OK** |
| Local E2E phase2190 (typecheck) | done | `e2e-phase2190.sh` **OK** |
| Local E2E phase2191 (e2e-all + gaps) | done | `e2e-phase2191.sh` **OK** |
| Local E2E phase2192 (STATUS soft-complete) | done | `e2e-phase2192.sh` **OK** |
| Local E2E phase2193 (milestone 4950) | done | `e2e-phase2193.sh` **OK** |
| Local E2E phase2194 (milestone 4950 endpoints) | done | `e2e-phase2194.sh` **OK** |
| Local E2E phase2195 (milestone 4950 UI) | done | `e2e-phase2195.sh` **OK** |
| Local E2E phase2196 (STATUS milestone 4950) | done | `e2e-phase2196.sh` **OK** |
| Local E2E phase2197 (marker 2200) | done | `e2e-phase2197.sh` **OK** |
| Local E2E phase2198 (typecheck) | done | `e2e-phase2198.sh` **OK** |
| Local E2E phase2199 (e2e-all + gaps) | done | `e2e-phase2199.sh` **OK** |
| Local E2E phase2200 (STATUS soft-complete) | done | `e2e-phase2200.sh` **OK** |
| Local E2E phase2201 (Soft 2200+ surface) | done | `e2e-phase2201.sh` **OK** |
| Local E2E phase2202 (UI Soft 2200+) | done | `e2e-phase2202.sh` **OK** |
| Local E2E phase2203 (client Soft 2200+) | done | `e2e-phase2203.sh` **OK** |
| Local E2E phase2204 (STATUS Soft 2200+) | done | `e2e-phase2204.sh` **OK** |
| Local E2E phase2205 (marker 2208) | done | `e2e-phase2205.sh` **OK** |
| Local E2E phase2206 (typecheck) | done | `e2e-phase2206.sh` **OK** |
| Local E2E phase2207 (e2e-all + gaps) | done | `e2e-phase2207.sh` **OK** |
| Local E2E phase2208 (STATUS soft-complete) | done | `e2e-phase2208.sh` **OK** |
| Local E2E phase2209 (milestone 5000) | done | `e2e-phase2209.sh` **OK** |
| Local E2E phase2210 (milestone 5000 endpoints) | done | `e2e-phase2210.sh` **OK** |
| Local E2E phase2211 (milestone 5000 UI) | done | `e2e-phase2211.sh` **OK** |
| Local E2E phase2212 (STATUS milestone 5000) | done | `e2e-phase2212.sh` **OK** |
| Local E2E phase2213 (marker 2216) | done | `e2e-phase2213.sh` **OK** |
| Local E2E phase2214 (typecheck) | done | `e2e-phase2214.sh` **OK** |
| Local E2E phase2215 (e2e-all + gaps) | done | `e2e-phase2215.sh` **OK** |
| Local E2E phase2216 (STATUS soft-complete) | done | `e2e-phase2216.sh` **OK** |
| Local E2E phase2217 (hard-gap roster) | done | `e2e-phase2217.sh` **OK** |
| Local E2E phase2218 (UI hard-gap roster) | done | `e2e-phase2218.sh` **OK** |
| Local E2E phase2219 (client hard-gap roster) | done | `e2e-phase2219.sh` **OK** |
| Local E2E phase2220 (STATUS hard-gap roster) | done | `e2e-phase2220.sh` **OK** |
| Local E2E phase2221 (marker 2224) | done | `e2e-phase2221.sh` **OK** |
| Local E2E phase2222 (typecheck) | done | `e2e-phase2222.sh` **OK** |
| Local E2E phase2223 (e2e-all + gaps) | done | `e2e-phase2223.sh` **OK** |
| Local E2E phase2224 (STATUS soft-complete) | done | `e2e-phase2224.sh` **OK** |
| Local E2E phase2225 (milestone 5050) | done | `e2e-phase2225.sh` **OK** |
| Local E2E phase2226 (milestone 5050 endpoints) | done | `e2e-phase2226.sh` **OK** |
| Local E2E phase2227 (milestone 5050 UI) | done | `e2e-phase2227.sh` **OK** |
| Local E2E phase2228 (STATUS milestone 5050) | done | `e2e-phase2228.sh` **OK** |
| Local E2E phase2229 (marker 2232) | done | `e2e-phase2229.sh` **OK** |
| Local E2E phase2230 (typecheck) | done | `e2e-phase2230.sh` **OK** |
| Local E2E phase2231 (e2e-all + gaps) | done | `e2e-phase2231.sh` **OK** |
| Local E2E phase2232 (STATUS soft-complete) | done | `e2e-phase2232.sh` **OK** |
| Local E2E phase2233 (hard_gap_roster export) | done | `e2e-phase2233.sh` **OK** |
| Local E2E phase2234 (UI hard_gap_roster bundle) | done | `e2e-phase2234.sh` **OK** |
| Local E2E phase2235 (hard_gap_roster titles/notes) | done | `e2e-phase2235.sh` **OK** |
| Local E2E phase2236 (STATUS hard_gap_roster export) | done | `e2e-phase2236.sh` **OK** |
| Local E2E phase2237 (marker 2240) | done | `e2e-phase2237.sh` **OK** |
| Local E2E phase2238 (typecheck) | done | `e2e-phase2238.sh` **OK** |
| Local E2E phase2239 (e2e-all + gaps) | done | `e2e-phase2239.sh` **OK** |
| Local E2E phase2240 (STATUS soft-complete) | done | `e2e-phase2240.sh` **OK** |
| Local E2E phase2241 (milestone 5100) | done | `e2e-phase2241.sh` **OK** |
| Local E2E phase2242 (milestone 5100 endpoints) | done | `e2e-phase2242.sh` **OK** |
| Local E2E phase2243 (milestone 5100 UI) | done | `e2e-phase2243.sh` **OK** |
| Local E2E phase2244 (STATUS milestone 5100) | done | `e2e-phase2244.sh` **OK** |
| Local E2E phase2245 (marker 2248) | done | `e2e-phase2245.sh` **OK** |
| Local E2E phase2246 (typecheck) | done | `e2e-phase2246.sh` **OK** |
| Local E2E phase2247 (e2e-all + gaps) | done | `e2e-phase2247.sh` **OK** |
| Local E2E phase2248 (STATUS soft-complete) | done | `e2e-phase2248.sh` **OK** |
| Local E2E phase2249 (schema 1.8) | done | `e2e-phase2249.sh` **OK** |
| Local E2E phase2250 (UI surface schema) | done | `e2e-phase2250.sh` **OK** |
| Local E2E phase2251 (client types) | done | `e2e-phase2251.sh` **OK** |
| Local E2E phase2252 (STATUS schema 1.8) | done | `e2e-phase2252.sh` **OK** |
| Local E2E phase2253 (marker 2256) | done | `e2e-phase2253.sh` **OK** |
| Local E2E phase2254 (typecheck) | done | `e2e-phase2254.sh` **OK** |
| Local E2E phase2255 (e2e-all + gaps) | done | `e2e-phase2255.sh` **OK** |
| Local E2E phase2256 (STATUS soft-complete) | done | `e2e-phase2256.sh` **OK** |
| Local E2E phase2257 (milestone 5150) | done | `e2e-phase2257.sh` **OK** |
| Local E2E phase2258 (milestone 5150 endpoints) | done | `e2e-phase2258.sh` **OK** |
| Local E2E phase2259 (milestone 5150 UI) | done | `e2e-phase2259.sh` **OK** |
| Local E2E phase2260 (STATUS milestone 5150) | done | `e2e-phase2260.sh` **OK** |
| Local E2E phase2261 (marker 2264) | done | `e2e-phase2261.sh` **OK** |
| Local E2E phase2262 (typecheck) | done | `e2e-phase2262.sh` **OK** |
| Local E2E phase2263 (e2e-all + gaps) | done | `e2e-phase2263.sh` **OK** |
| Local E2E phase2264 (STATUS soft-complete) | done | `e2e-phase2264.sh` **OK** |
| Local E2E phase2265 (hard_gap_roster sessionStorage) | done | `e2e-phase2265.sh` **OK** |
| Local E2E phase2266 (UI hard_gap_roster sessionStorage) | done | `e2e-phase2266.sh` **OK** |
| Local E2E phase2267 (clear hard-gap roster) | done | `e2e-phase2267.sh` **OK** |
| Local E2E phase2268 (STATUS hard_gap_roster sessionStorage) | done | `e2e-phase2268.sh` **OK** |
| Local E2E phase2269 (marker 2272) | done | `e2e-phase2269.sh` **OK** |
| Local E2E phase2270 (typecheck) | done | `e2e-phase2270.sh` **OK** |
| Local E2E phase2271 (e2e-all + gaps) | done | `e2e-phase2271.sh` **OK** |
| Local E2E phase2272 (STATUS soft-complete) | done | `e2e-phase2272.sh` **OK** |
| Local E2E phase2273 (milestone 5200) | done | `e2e-phase2273.sh` **OK** |
| Local E2E phase2274 (milestone 5200 endpoints) | done | `e2e-phase2274.sh` **OK** |
| Local E2E phase2275 (milestone 5200 UI) | done | `e2e-phase2275.sh` **OK** |
| Local E2E phase2276 (STATUS milestone 5200) | done | `e2e-phase2276.sh` **OK** |
| Local E2E phase2277 (marker 2280) | done | `e2e-phase2277.sh` **OK** |
| Local E2E phase2278 (typecheck) | done | `e2e-phase2278.sh` **OK** |
| Local E2E phase2279 (e2e-all + gaps) | done | `e2e-phase2279.sh` **OK** |
| Local E2E phase2280 (STATUS soft-complete) | done | `e2e-phase2280.sh` **OK** |
| Local E2E phase2281 (Soft 2280+ surface) | done | `e2e-phase2281.sh` **OK** |
| Local E2E phase2282 (UI Soft 2280+) | done | `e2e-phase2282.sh` **OK** |
| Local E2E phase2283 (client Soft 2280+) | done | `e2e-phase2283.sh` **OK** |
| Local E2E phase2284 (STATUS Soft 2280+) | done | `e2e-phase2284.sh` **OK** |
| Local E2E phase2285 (marker 2288) | done | `e2e-phase2285.sh` **OK** |
| Local E2E phase2286 (typecheck) | done | `e2e-phase2286.sh` **OK** |
| Local E2E phase2287 (e2e-all + gaps) | done | `e2e-phase2287.sh` **OK** |
| Local E2E phase2288 (STATUS soft-complete) | done | `e2e-phase2288.sh` **OK** |
| Local E2E phase2289 (milestone 5250) | done | `e2e-phase2289.sh` **OK** |
| Local E2E phase2290 (milestone 5250 endpoints) | done | `e2e-phase2290.sh` **OK** |
| Local E2E phase2291 (milestone 5250 UI) | done | `e2e-phase2291.sh` **OK** |
| Local E2E phase2292 (STATUS milestone 5250) | done | `e2e-phase2292.sh` **OK** |
| Local E2E phase2293 (marker 2296) | done | `e2e-phase2293.sh` **OK** |
| Local E2E phase2294 (typecheck) | done | `e2e-phase2294.sh` **OK** |
| Local E2E phase2295 (e2e-all + gaps) | done | `e2e-phase2295.sh` **OK** |
| Local E2E phase2296 (STATUS soft-complete) | done | `e2e-phase2296.sh` **OK** |
| Local E2E phase2297 (hard-gap refusal roster) | done | `e2e-phase2297.sh` **OK** |
| Local E2E phase2298 (UI hard-gap refusal roster) | done | `e2e-phase2298.sh` **OK** |
| Local E2E phase2299 (client hard-gap refusal roster) | done | `e2e-phase2299.sh` **OK** |
| Local E2E phase2300 (STATUS hard-gap refusal roster) | done | `e2e-phase2300.sh` **OK** |
| Local E2E phase2301 (marker 2304) | done | `e2e-phase2301.sh` **OK** |
| Local E2E phase2302 (typecheck) | done | `e2e-phase2302.sh` **OK** |
| Local E2E phase2303 (e2e-all + gaps) | done | `e2e-phase2303.sh` **OK** |
| Local E2E phase2304 (STATUS soft-complete) | done | `e2e-phase2304.sh` **OK** |
| Local E2E phase2305 (milestone 5300) | done | `e2e-phase2305.sh` **OK** |
| Local E2E phase2306 (milestone 5300 endpoints) | done | `e2e-phase2306.sh` **OK** |
| Local E2E phase2307 (milestone 5300 UI) | done | `e2e-phase2307.sh` **OK** |
| Local E2E phase2308 (STATUS milestone 5300) | done | `e2e-phase2308.sh` **OK** |
| Local E2E phase2309 (marker 2312) | done | `e2e-phase2309.sh` **OK** |
| Local E2E phase2310 (typecheck) | done | `e2e-phase2310.sh` **OK** |
| Local E2E phase2311 (e2e-all + gaps) | done | `e2e-phase2311.sh` **OK** |
| Local E2E phase2312 (STATUS soft-complete) | done | `e2e-phase2312.sh` **OK** |
| Local E2E phase2313 (hard_gap_refusal_roster export) | done | `e2e-phase2313.sh` **OK** |
| Local E2E phase2314 (UI hard_gap_refusal_roster bundle) | done | `e2e-phase2314.sh` **OK** |
| Local E2E phase2315 (hard_gap_refusal_roster titles/notes) | done | `e2e-phase2315.sh` **OK** |
| Local E2E phase2316 (STATUS hard_gap_refusal_roster export) | done | `e2e-phase2316.sh` **OK** |
| Local E2E phase2317 (marker 2320) | done | `e2e-phase2317.sh` **OK** |
| Local E2E phase2318 (typecheck) | done | `e2e-phase2318.sh` **OK** |
| Local E2E phase2319 (e2e-all + gaps) | done | `e2e-phase2319.sh` **OK** |
| Local E2E phase2320 (STATUS soft-complete) | done | `e2e-phase2320.sh` **OK** |
| Local E2E phase2321 (milestone 5350) | done | `e2e-phase2321.sh` **OK** |
| Local E2E phase2322 (milestone 5350 endpoints) | done | `e2e-phase2322.sh` **OK** |
| Local E2E phase2323 (milestone 5350 UI) | done | `e2e-phase2323.sh` **OK** |
| Local E2E phase2324 (STATUS milestone 5350) | done | `e2e-phase2324.sh` **OK** |
| Local E2E phase2325 (marker 2328) | done | `e2e-phase2325.sh` **OK** |
| Local E2E phase2326 (typecheck) | done | `e2e-phase2326.sh` **OK** |
| Local E2E phase2327 (e2e-all + gaps) | done | `e2e-phase2327.sh` **OK** |
| Local E2E phase2328 (STATUS soft-complete) | done | `e2e-phase2328.sh` **OK** |
| Local E2E phase2329 (schema 1.9) | done | `e2e-phase2329.sh` **OK** |
| Local E2E phase2330 (UI surface schema) | done | `e2e-phase2330.sh` **OK** |
| Local E2E phase2331 (client types) | done | `e2e-phase2331.sh` **OK** |
| Local E2E phase2332 (STATUS schema 1.9) | done | `e2e-phase2332.sh` **OK** |
| Local E2E phase2333 (marker 2336) | done | `e2e-phase2333.sh` **OK** |
| Local E2E phase2334 (typecheck) | done | `e2e-phase2334.sh` **OK** |
| Local E2E phase2335 (e2e-all + gaps) | done | `e2e-phase2335.sh` **OK** |
| Local E2E phase2336 (STATUS soft-complete) | done | `e2e-phase2336.sh` **OK** |
| Local E2E phase2337 (milestone 5400) | done | `e2e-phase2337.sh` **OK** |
| Local E2E phase2338 (milestone 5400 endpoints) | done | `e2e-phase2338.sh` **OK** |
| Local E2E phase2339 (milestone 5400 UI) | done | `e2e-phase2339.sh` **OK** |
| Local E2E phase2340 (STATUS milestone 5400) | done | `e2e-phase2340.sh` **OK** |
| Local E2E phase2341 (marker 2344) | done | `e2e-phase2341.sh` **OK** |
| Local E2E phase2342 (typecheck) | done | `e2e-phase2342.sh` **OK** |
| Local E2E phase2343 (e2e-all + gaps) | done | `e2e-phase2343.sh` **OK** |
| Local E2E phase2344 (STATUS soft-complete) | done | `e2e-phase2344.sh` **OK** |
| Local E2E phase2345 (hard_gap_refusal_roster sessionStorage) | done | `e2e-phase2345.sh` **OK** |
| Local E2E phase2346 (UI hard_gap_refusal_roster sessionStorage) | done | `e2e-phase2346.sh` **OK** |
| Local E2E phase2347 (clear hard-gap refusal roster) | done | `e2e-phase2347.sh` **OK** |
| Local E2E phase2348 (STATUS hard_gap_refusal_roster sessionStorage) | done | `e2e-phase2348.sh` **OK** |
| Local E2E phase2349 (marker 2352) | done | `e2e-phase2349.sh` **OK** |
| Local E2E phase2350 (typecheck) | done | `e2e-phase2350.sh` **OK** |
| Local E2E phase2351 (e2e-all + gaps) | done | `e2e-phase2351.sh` **OK** |
| Local E2E phase2352 (STATUS soft-complete) | done | `e2e-phase2352.sh` **OK** |
| Local E2E phase2353 (milestone 5450) | done | `e2e-phase2353.sh` **OK** |
| Local E2E phase2354 (milestone 5450 endpoints) | done | `e2e-phase2354.sh` **OK** |
| Local E2E phase2355 (milestone 5450 UI) | done | `e2e-phase2355.sh` **OK** |
| Local E2E phase2356 (STATUS milestone 5450) | done | `e2e-phase2356.sh` **OK** |
| Local E2E phase2357 (marker 2360) | done | `e2e-phase2357.sh` **OK** |
| Local E2E phase2358 (typecheck) | done | `e2e-phase2358.sh` **OK** |
| Local E2E phase2359 (e2e-all + gaps) | done | `e2e-phase2359.sh` **OK** |
| Local E2E phase2360 (STATUS soft-complete) | done | `e2e-phase2360.sh` **OK** |
| Local E2E phase2361 (Soft 2360+ surface) | done | `e2e-phase2361.sh` **OK** |
| Local E2E phase2362 (UI Soft 2360+) | done | `e2e-phase2362.sh` **OK** |
| Local E2E phase2363 (client Soft 2360+) | done | `e2e-phase2363.sh` **OK** |
| Local E2E phase2364 (STATUS Soft 2360+) | done | `e2e-phase2364.sh` **OK** |
| Local E2E phase2365 (marker 2368) | done | `e2e-phase2365.sh` **OK** |
| Local E2E phase2366 (typecheck) | done | `e2e-phase2366.sh` **OK** |
| Local E2E phase2367 (e2e-all + gaps) | done | `e2e-phase2367.sh` **OK** |
| Local E2E phase2368 (STATUS soft-complete) | done | `e2e-phase2368.sh` **OK** |
| Local E2E phase2369 (milestone 5500) | done | `e2e-phase2369.sh` **OK** |
| Local E2E phase2370 (milestone 5500 endpoints) | done | `e2e-phase2370.sh` **OK** |
| Local E2E phase2371 (milestone 5500 UI) | done | `e2e-phase2371.sh` **OK** |
| Local E2E phase2372 (STATUS milestone 5500) | done | `e2e-phase2372.sh` **OK** |
| Local E2E phase2373 (marker 2376) | done | `e2e-phase2373.sh` **OK** |
| Local E2E phase2374 (typecheck) | done | `e2e-phase2374.sh` **OK** |
| Local E2E phase2375 (e2e-all + gaps) | done | `e2e-phase2375.sh` **OK** |
| Local E2E phase2376 (STATUS soft-complete) | done | `e2e-phase2376.sh` **OK** |
| Local E2E phase2377 (honesty path roster) | done | `e2e-phase2377.sh` **OK** |
| Local E2E phase2378 (UI honesty path roster) | done | `e2e-phase2378.sh` **OK** |
| Local E2E phase2379 (client honesty path roster) | done | `e2e-phase2379.sh` **OK** |
| Local E2E phase2380 (STATUS honesty path roster) | done | `e2e-phase2380.sh` **OK** |
| Local E2E phase2381 (marker 2384) | done | `e2e-phase2381.sh` **OK** |
| Local E2E phase2382 (typecheck) | done | `e2e-phase2382.sh` **OK** |
| Local E2E phase2383 (e2e-all + gaps) | done | `e2e-phase2383.sh` **OK** |
| Local E2E phase2384 (STATUS soft-complete) | done | `e2e-phase2384.sh` **OK** |
| Local E2E phase2385 (milestone 5550) | done | `e2e-phase2385.sh` **OK** |
| Local E2E phase2386 (milestone 5550 endpoints) | done | `e2e-phase2386.sh` **OK** |
| Local E2E phase2387 (milestone 5550 UI) | done | `e2e-phase2387.sh` **OK** |
| Local E2E phase2388 (STATUS milestone 5550) | done | `e2e-phase2388.sh` **OK** |
| Local E2E phase2389 (marker 2392) | done | `e2e-phase2389.sh` **OK** |
| Local E2E phase2390 (typecheck) | done | `e2e-phase2390.sh` **OK** |
| Local E2E phase2391 (e2e-all + gaps) | done | `e2e-phase2391.sh` **OK** |
| Local E2E phase2392 (STATUS soft-complete) | done | `e2e-phase2392.sh` **OK** |
| Local E2E phase2393 (honesty_path_roster export) | done | `e2e-phase2393.sh` **OK** |
| Local E2E phase2394 (UI honesty_path_roster bundle) | done | `e2e-phase2394.sh` **OK** |
| Local E2E phase2395 (honesty_path_roster titles/notes) | done | `e2e-phase2395.sh` **OK** |
| Local E2E phase2396 (STATUS honesty_path_roster export) | done | `e2e-phase2396.sh` **OK** |
| Local E2E phase2397 (marker 2400) | done | `e2e-phase2397.sh` **OK** |
| Local E2E phase2398 (typecheck) | done | `e2e-phase2398.sh` **OK** |
| Local E2E phase2399 (e2e-all + gaps) | done | `e2e-phase2399.sh` **OK** |
| Local E2E phase2400 (STATUS soft-complete) | done | `e2e-phase2400.sh` **OK** |
| Local E2E phase2401 (milestone 5600) | done | `e2e-phase2401.sh` **OK** |
| Local E2E phase2402 (milestone 5600 endpoints) | done | `e2e-phase2402.sh` **OK** |
| Local E2E phase2403 (milestone 5600 UI) | done | `e2e-phase2403.sh` **OK** |
| Local E2E phase2404 (STATUS milestone 5600) | done | `e2e-phase2404.sh` **OK** |
| Local E2E phase2405 (marker 2408) | done | `e2e-phase2405.sh` **OK** |
| Local E2E phase2406 (typecheck) | done | `e2e-phase2406.sh` **OK** |
| Local E2E phase2407 (e2e-all + gaps) | done | `e2e-phase2407.sh` **OK** |
| Local E2E phase2408 (STATUS soft-complete) | done | `e2e-phase2408.sh` **OK** |
| Local E2E phase2409 (schema 2.0) | done | `e2e-phase2409.sh` **OK** |
| Local E2E phase2410 (UI surface schema) | done | `e2e-phase2410.sh` **OK** |
| Local E2E phase2411 (client types) | done | `e2e-phase2411.sh` **OK** |
| Local E2E phase2412 (STATUS schema 2.0) | done | `e2e-phase2412.sh` **OK** |
| Local E2E phase2413 (marker 2416) | done | `e2e-phase2413.sh` **OK** |
| Local E2E phase2414 (typecheck) | done | `e2e-phase2414.sh` **OK** |
| Local E2E phase2415 (e2e-all + gaps) | done | `e2e-phase2415.sh` **OK** |
| Local E2E phase2416 (STATUS soft-complete) | done | `e2e-phase2416.sh` **OK** |
| Local E2E phase2417 (milestone 5650) | done | `e2e-phase2417.sh` **OK** |
| Local E2E phase2418 (milestone 5650 endpoints) | done | `e2e-phase2418.sh` **OK** |
| Local E2E phase2419 (milestone 5650 UI) | done | `e2e-phase2419.sh` **OK** |
| Local E2E phase2420 (STATUS milestone 5650) | done | `e2e-phase2420.sh` **OK** |
| Local E2E phase2421 (marker 2424) | done | `e2e-phase2421.sh` **OK** |
| Local E2E phase2422 (typecheck) | done | `e2e-phase2422.sh` **OK** |
| Local E2E phase2423 (e2e-all + gaps) | done | `e2e-phase2423.sh` **OK** |
| Local E2E phase2424 (STATUS soft-complete) | done | `e2e-phase2424.sh` **OK** |
| Local E2E phase2425 (honesty_path_roster sessionStorage) | done | `e2e-phase2425.sh` **OK** |
| Local E2E phase2426 (UI honesty_path_roster sessionStorage) | done | `e2e-phase2426.sh` **OK** |
| Local E2E phase2427 (clear honesty path roster) | done | `e2e-phase2427.sh` **OK** |
| Local E2E phase2428 (STATUS honesty_path_roster sessionStorage) | done | `e2e-phase2428.sh` **OK** |
| Local E2E phase2429 (marker 2432) | done | `e2e-phase2429.sh` **OK** |
| Local E2E phase2430 (typecheck) | done | `e2e-phase2430.sh` **OK** |
| Local E2E phase2431 (e2e-all + gaps) | done | `e2e-phase2431.sh` **OK** |
| Local E2E phase2432 (STATUS soft-complete) | done | `e2e-phase2432.sh` **OK** |
| Local E2E phase2433 (milestone 5700) | done | `e2e-phase2433.sh` **OK** |
| Local E2E phase2434 (milestone 5700 endpoints) | done | `e2e-phase2434.sh` **OK** |
| Local E2E phase2435 (milestone 5700 UI) | done | `e2e-phase2435.sh` **OK** |
| Local E2E phase2436 (STATUS milestone 5700) | done | `e2e-phase2436.sh` **OK** |
| Local E2E phase2437 (marker 2440) | done | `e2e-phase2437.sh` **OK** |
| Local E2E phase2438 (typecheck) | done | `e2e-phase2438.sh` **OK** |
| Local E2E phase2439 (e2e-all + gaps) | done | `e2e-phase2439.sh` **OK** |
| Local E2E phase2440 (STATUS soft-complete) | done | `e2e-phase2440.sh` **OK** |
| Local E2E phase2441 (Soft 2440+ surface) | done | `e2e-phase2441.sh` **OK** |
| Local E2E phase2442 (UI Soft 2440+) | done | `e2e-phase2442.sh` **OK** |
| Local E2E phase2443 (client Soft 2440+) | done | `e2e-phase2443.sh` **OK** |
| Local E2E phase2444 (STATUS Soft 2440+) | done | `e2e-phase2444.sh` **OK** |
| Local E2E phase2445 (marker 2448) | done | `e2e-phase2445.sh` **OK** |
| Local E2E phase2446 (typecheck) | done | `e2e-phase2446.sh` **OK** |
| Local E2E phase2447 (e2e-all + gaps) | done | `e2e-phase2447.sh` **OK** |
| Local E2E phase2448 (STATUS soft-complete) | done | `e2e-phase2448.sh` **OK** |
| Local E2E phase2449 (milestone 5750) | done | `e2e-phase2449.sh` **OK** |
| Local E2E phase2450 (milestone 5750 endpoints) | done | `e2e-phase2450.sh` **OK** |
| Local E2E phase2451 (milestone 5750 UI) | done | `e2e-phase2451.sh` **OK** |
| Local E2E phase2452 (STATUS milestone 5750) | done | `e2e-phase2452.sh` **OK** |
| Local E2E phase2453 (marker 2456) | done | `e2e-phase2453.sh` **OK** |
| Local E2E phase2454 (typecheck) | done | `e2e-phase2454.sh` **OK** |
| Local E2E phase2455 (e2e-all + gaps) | done | `e2e-phase2455.sh` **OK** |
| Local E2E phase2456 (STATUS soft-complete) | done | `e2e-phase2456.sh` **OK** |
| Local E2E phase2457 (sessionStorage roster) | done | `e2e-phase2457.sh` **OK** |
| Local E2E phase2458 (UI sessionStorage roster) | done | `e2e-phase2458.sh` **OK** |
| Local E2E phase2459 (client sessionStorage roster) | done | `e2e-phase2459.sh` **OK** |
| Local E2E phase2460 (STATUS sessionStorage roster) | done | `e2e-phase2460.sh` **OK** |
| Local E2E phase2461 (marker 2464) | done | `e2e-phase2461.sh` **OK** |
| Local E2E phase2462 (typecheck) | done | `e2e-phase2462.sh` **OK** |
| Local E2E phase2463 (e2e-all + gaps) | done | `e2e-phase2463.sh` **OK** |
| Local E2E phase2464 (STATUS soft-complete) | done | `e2e-phase2464.sh` **OK** |
| Local E2E phase2465 (milestone 5800) | done | `e2e-phase2465.sh` **OK** |
| Local E2E phase2466 (milestone 5800 endpoints) | done | `e2e-phase2466.sh` **OK** |
| Local E2E phase2467 (milestone 5800 UI) | done | `e2e-phase2467.sh` **OK** |
| Local E2E phase2468 (STATUS milestone 5800) | done | `e2e-phase2468.sh` **OK** |
| Local E2E phase2469 (marker 2472) | done | `e2e-phase2469.sh` **OK** |
| Local E2E phase2470 (typecheck) | done | `e2e-phase2470.sh` **OK** |
| Local E2E phase2471 (e2e-all + gaps) | done | `e2e-phase2471.sh` **OK** |
| Local E2E phase2472 (STATUS soft-complete) | done | `e2e-phase2472.sh` **OK** |
| Local E2E phase2473 (session_storage_roster export) | done | `e2e-phase2473.sh` **OK** |
| Local E2E phase2474 (UI session_storage_roster bundle) | done | `e2e-phase2474.sh` **OK** |
| Local E2E phase2475 (export titles/notes) | done | `e2e-phase2475.sh` **OK** |
| Local E2E phase2476 (STATUS session_storage_roster export) | done | `e2e-phase2476.sh` **OK** |
| Local E2E phase2477 (marker 2480) | done | `e2e-phase2477.sh` **OK** |
| Local E2E phase2478 (typecheck) | done | `e2e-phase2478.sh` **OK** |
| Local E2E phase2479 (e2e-all + gaps) | done | `e2e-phase2479.sh` **OK** |
| Local E2E phase2480 (STATUS soft-complete) | done | `e2e-phase2480.sh` **OK** |
| Local E2E phase2481 (milestone 5850) | done | `e2e-phase2481.sh` **OK** |
| Local E2E phase2482 (milestone 5850 endpoints) | done | `e2e-phase2482.sh` **OK** |
| Local E2E phase2483 (milestone 5850 UI) | done | `e2e-phase2483.sh` **OK** |
| Local E2E phase2484 (STATUS milestone 5850) | done | `e2e-phase2484.sh` **OK** |
| Local E2E phase2485 (marker 2488) | done | `e2e-phase2485.sh` **OK** |
| Local E2E phase2486 (typecheck) | done | `e2e-phase2486.sh` **OK** |
| Local E2E phase2487 (e2e-all + gaps) | done | `e2e-phase2487.sh` **OK** |
| Local E2E phase2488 (STATUS soft-complete) | done | `e2e-phase2488.sh` **OK** |
| Local E2E phase2489 (schema 2.1) | done | `e2e-phase2489.sh` **OK** |
| Local E2E phase2490 (UI schema 2.1) | done | `e2e-phase2490.sh` **OK** |
| Local E2E phase2491 (client schema) | done | `e2e-phase2491.sh` **OK** |
| Local E2E phase2492 (STATUS schema 2.1) | done | `e2e-phase2492.sh` **OK** |
| Local E2E phase2493 (marker 2496) | done | `e2e-phase2493.sh` **OK** |
| Local E2E phase2494 (typecheck) | done | `e2e-phase2494.sh` **OK** |
| Local E2E phase2495 (e2e-all + gaps) | done | `e2e-phase2495.sh` **OK** |
| Local E2E phase2496 (STATUS soft-complete) | done | `e2e-phase2496.sh` **OK** |
| Local E2E phase2497 (milestone 5900) | done | `e2e-phase2497.sh` **OK** |
| Local E2E phase2498 (milestone 5900 endpoints) | done | `e2e-phase2498.sh` **OK** |
| Local E2E phase2499 (milestone 5900 UI) | done | `e2e-phase2499.sh` **OK** |
| Local E2E phase2500 (STATUS milestone 5900) | done | `e2e-phase2500.sh` **OK** |
| Local E2E phase2501 (marker 2504) | done | `e2e-phase2501.sh` **OK** |
| Local E2E phase2502 (typecheck) | done | `e2e-phase2502.sh` **OK** |
| Local E2E phase2503 (e2e-all + gaps) | done | `e2e-phase2503.sh` **OK** |
| Local E2E phase2504 (STATUS soft-complete) | done | `e2e-phase2504.sh` **OK** |
| Local E2E phase2505 (session_storage_roster session) | done | `e2e-phase2505.sh` **OK** |
| Local E2E phase2506 (UI session persist) | done | `e2e-phase2506.sh` **OK** |
| Local E2E phase2507 (clear title) | done | `e2e-phase2507.sh` **OK** |
| Local E2E phase2508 (STATUS session) | done | `e2e-phase2508.sh` **OK** |
| Local E2E phase2509 (marker 2512) | done | `e2e-phase2509.sh` **OK** |
| Local E2E phase2510 (typecheck) | done | `e2e-phase2510.sh` **OK** |
| Local E2E phase2511 (e2e-all + gaps) | done | `e2e-phase2511.sh` **OK** |
| Local E2E phase2512 (STATUS soft-complete) | done | `e2e-phase2512.sh` **OK** |
| Local E2E phase2513 (milestone 5950) | done | `e2e-phase2513.sh` **OK** |
| Local E2E phase2514 (milestone 5950 endpoints) | done | `e2e-phase2514.sh` **OK** |
| Local E2E phase2515 (milestone 5950 UI) | done | `e2e-phase2515.sh` **OK** |
| Local E2E phase2516 (STATUS milestone 5950) | done | `e2e-phase2516.sh` **OK** |
| Local E2E phase2517 (marker 2520) | done | `e2e-phase2517.sh` **OK** |
| Local E2E phase2518 (typecheck) | done | `e2e-phase2518.sh` **OK** |
| Local E2E phase2519 (e2e-all + gaps) | done | `e2e-phase2519.sh` **OK** |
| Local E2E phase2520 (STATUS soft-complete) | done | `e2e-phase2520.sh` **OK** |
| Local E2E phase2521 (Soft 2520+ checkpoint) | done | `e2e-phase2521.sh` **OK** |
| Local E2E phase2522 (UI Soft 2520+) | done | `e2e-phase2522.sh` **OK** |
| Local E2E phase2523 (client Soft 2520+) | done | `e2e-phase2523.sh` **OK** |
| Local E2E phase2524 (STATUS Soft 2520+) | done | `e2e-phase2524.sh` **OK** |
| Local E2E phase2525 (marker 2528) | done | `e2e-phase2525.sh` **OK** |
| Local E2E phase2526 (typecheck) | done | `e2e-phase2526.sh` **OK** |
| Local E2E phase2527 (e2e-all + gaps) | done | `e2e-phase2527.sh` **OK** |
| Local E2E phase2528 (STATUS soft-complete) | done | `e2e-phase2528.sh` **OK** |
| Local E2E phase2529 (milestone 6000) | done | `e2e-phase2529.sh` **OK** |
| Local E2E phase2530 (milestone 6000 endpoints) | done | `e2e-phase2530.sh` **OK** |
| Local E2E phase2531 (milestone 6000 UI) | done | `e2e-phase2531.sh` **OK** |
| Local E2E phase2532 (STATUS milestone 6000) | done | `e2e-phase2532.sh` **OK** |
| Local E2E phase2533 (marker 2536) | done | `e2e-phase2533.sh` **OK** |
| Local E2E phase2534 (typecheck) | done | `e2e-phase2534.sh` **OK** |
| Local E2E phase2535 (e2e-all + gaps) | done | `e2e-phase2535.sh` **OK** |
| Local E2E phase2536 (STATUS soft-complete) | done | `e2e-phase2536.sh` **OK** |
| Local E2E phase2537 (honesty export roster) | done | `e2e-phase2537.sh` **OK** |
| Local E2E phase2538 (UI honesty export roster) | done | `e2e-phase2538.sh` **OK** |
| Local E2E phase2539 (client honesty export roster) | done | `e2e-phase2539.sh` **OK** |
| Local E2E phase2540 (STATUS honesty export roster) | done | `e2e-phase2540.sh` **OK** |
| Local E2E phase2541 (marker 2544) | done | `e2e-phase2541.sh` **OK** |
| Local E2E phase2542 (typecheck) | done | `e2e-phase2542.sh` **OK** |
| Local E2E phase2543 (e2e-all + gaps) | done | `e2e-phase2543.sh` **OK** |
| Local E2E phase2544 (STATUS soft-complete) | done | `e2e-phase2544.sh` **OK** |
| Local E2E phase2545 (milestone 6050) | done | `e2e-phase2545.sh` **OK** |
| Local E2E phase2546 (milestone 6050 endpoints) | done | `e2e-phase2546.sh` **OK** |
| Local E2E phase2547 (milestone 6050 UI) | done | `e2e-phase2547.sh` **OK** |
| Local E2E phase2548 (STATUS milestone 6050) | done | `e2e-phase2548.sh` **OK** |
| Local E2E phase2549 (marker 2552) | done | `e2e-phase2549.sh` **OK** |
| Local E2E phase2550 (typecheck) | done | `e2e-phase2550.sh` **OK** |
| Local E2E phase2551 (e2e-all + gaps) | done | `e2e-phase2551.sh` **OK** |
| Local E2E phase2552 (STATUS soft-complete) | done | `e2e-phase2552.sh` **OK** |
| Local E2E phase2553 (honesty_export_roster export) | done | `e2e-phase2553.sh` **OK** |
| Local E2E phase2554 (UI honesty_export_roster bundle) | done | `e2e-phase2554.sh` **OK** |
| Local E2E phase2555 (export titles/notes) | done | `e2e-phase2555.sh` **OK** |
| Local E2E phase2556 (STATUS honesty_export_roster export) | done | `e2e-phase2556.sh` **OK** |
| Local E2E phase2557 (marker 2560) | done | `e2e-phase2557.sh` **OK** |
| Local E2E phase2558 (typecheck) | done | `e2e-phase2558.sh` **OK** |
| Local E2E phase2559 (e2e-all + gaps) | done | `e2e-phase2559.sh` **OK** |
| Local E2E phase2560 (STATUS soft-complete) | done | `e2e-phase2560.sh` **OK** |
| Local E2E phase2561 (milestone 6100) | done | `e2e-phase2561.sh` **OK** |
| Local E2E phase2562 (milestone 6100 endpoints) | done | `e2e-phase2562.sh` **OK** |
| Local E2E phase2563 (milestone 6100 UI) | done | `e2e-phase2563.sh` **OK** |
| Local E2E phase2564 (STATUS milestone 6100) | done | `e2e-phase2564.sh` **OK** |
| Local E2E phase2565 (marker 2568) | done | `e2e-phase2565.sh` **OK** |
| Local E2E phase2566 (typecheck) | done | `e2e-phase2566.sh` **OK** |
| Local E2E phase2567 (e2e-all + gaps) | done | `e2e-phase2567.sh` **OK** |
| Local E2E phase2568 (STATUS soft-complete) | done | `e2e-phase2568.sh` **OK** |
| Local E2E phase2569 (schema 2.2) | done | `e2e-phase2569.sh` **OK** |
| Local E2E phase2570 (UI schema 2.2) | done | `e2e-phase2570.sh` **OK** |
| Local E2E phase2571 (client schema) | done | `e2e-phase2571.sh` **OK** |
| Local E2E phase2572 (STATUS schema 2.2) | done | `e2e-phase2572.sh` **OK** |
| Local E2E phase2573 (marker 2576) | done | `e2e-phase2573.sh` **OK** |
| Local E2E phase2574 (typecheck) | done | `e2e-phase2574.sh` **OK** |
| Local E2E phase2575 (e2e-all + gaps) | done | `e2e-phase2575.sh` **OK** |
| Local E2E phase2576 (STATUS soft-complete) | done | `e2e-phase2576.sh` **OK** |
| Local E2E phase2577 (milestone 6150) | done | `e2e-phase2577.sh` **OK** |
| Local E2E phase2578 (milestone 6150 endpoints) | done | `e2e-phase2578.sh` **OK** |
| Local E2E phase2579 (milestone 6150 UI) | done | `e2e-phase2579.sh` **OK** |
| Local E2E phase2580 (STATUS milestone 6150) | done | `e2e-phase2580.sh` **OK** |
| Local E2E phase2581 (marker 2584) | done | `e2e-phase2581.sh` **OK** |
| Local E2E phase2582 (typecheck) | done | `e2e-phase2582.sh` **OK** |
| Local E2E phase2583 (e2e-all + gaps) | done | `e2e-phase2583.sh` **OK** |
| Local E2E phase2584 (STATUS soft-complete) | done | `e2e-phase2584.sh` **OK** |
| Local E2E phase2585 (honesty_export_roster session) | done | `e2e-phase2585.sh` **OK** |
| Local E2E phase2586 (UI session persist) | done | `e2e-phase2586.sh` **OK** |
| Local E2E phase2587 (clear title) | done | `e2e-phase2587.sh` **OK** |
| Local E2E phase2588 (STATUS session) | done | `e2e-phase2588.sh` **OK** |
| Local E2E phase2589 (marker 2592) | done | `e2e-phase2589.sh` **OK** |
| Local E2E phase2590 (typecheck) | done | `e2e-phase2590.sh` **OK** |
| Local E2E phase2591 (e2e-all + gaps) | done | `e2e-phase2591.sh` **OK** |
| Local E2E phase2592 (STATUS soft-complete) | done | `e2e-phase2592.sh` **OK** |
| Local E2E phase2593 (milestone 6200) | done | `e2e-phase2593.sh` **OK** |
| Local E2E phase2594 (milestone 6200 endpoints) | done | `e2e-phase2594.sh` **OK** |
| Local E2E phase2595 (milestone 6200 UI) | done | `e2e-phase2595.sh` **OK** |
| Local E2E phase2596 (STATUS milestone 6200) | done | `e2e-phase2596.sh` **OK** |
| Local E2E phase2597 (marker 2600) | done | `e2e-phase2597.sh` **OK** |
| Local E2E phase2598 (typecheck) | done | `e2e-phase2598.sh` **OK** |
| Local E2E phase2599 (e2e-all + gaps) | done | `e2e-phase2599.sh` **OK** |
| Local E2E phase2600 (STATUS soft-complete) | done | `e2e-phase2600.sh` **OK** |
| Local E2E phase2601 (Soft 2600+ checkpoint) | done | `e2e-phase2601.sh` **OK** |
| Local E2E phase2602 (UI Soft 2600+) | done | `e2e-phase2602.sh` **OK** |
| Local E2E phase2603 (client Soft 2600+) | done | `e2e-phase2603.sh` **OK** |
| Local E2E phase2604 (STATUS Soft 2600+) | done | `e2e-phase2604.sh` **OK** |
| Local E2E phase2605 (marker 2608) | done | `e2e-phase2605.sh` **OK** |
| Local E2E phase2606 (typecheck) | done | `e2e-phase2606.sh` **OK** |
| Local E2E phase2607 (e2e-all + gaps) | done | `e2e-phase2607.sh` **OK** |
| Local E2E phase2608 (STATUS soft-complete) | done | `e2e-phase2608.sh` **OK** |
| Local E2E phase2609 (milestone 6250) | done | `e2e-phase2609.sh` **OK** |
| Local E2E phase2610 (milestone 6250 endpoints) | done | `e2e-phase2610.sh` **OK** |
| Local E2E phase2611 (milestone 6250 UI) | done | `e2e-phase2611.sh` **OK** |
| Local E2E phase2612 (STATUS milestone 6250) | done | `e2e-phase2612.sh` **OK** |
| Local E2E phase2613 (marker 2616) | done | `e2e-phase2613.sh` **OK** |
| Local E2E phase2614 (typecheck) | done | `e2e-phase2614.sh` **OK** |
| Local E2E phase2615 (e2e-all + gaps) | done | `e2e-phase2615.sh` **OK** |
| Local E2E phase2616 (STATUS soft-complete) | done | `e2e-phase2616.sh` **OK** |
| Local E2E phase2617 (honesty bundle roster) | done | `e2e-phase2617.sh` **OK** |
| Local E2E phase2618 (UI honesty bundle roster) | done | `e2e-phase2618.sh` **OK** |
| Local E2E phase2619 (client honesty bundle roster) | done | `e2e-phase2619.sh` **OK** |
| Local E2E phase2620 (STATUS honesty bundle roster) | done | `e2e-phase2620.sh` **OK** |
| Local E2E phase2621 (marker 2624) | done | `e2e-phase2621.sh` **OK** |
| Local E2E phase2622 (typecheck) | done | `e2e-phase2622.sh` **OK** |
| Local E2E phase2623 (e2e-all + gaps) | done | `e2e-phase2623.sh` **OK** |
| Local E2E phase2624 (STATUS soft-complete) | done | `e2e-phase2624.sh` **OK** |
| Local E2E phase2625 (milestone 6300) | done | `e2e-phase2625.sh` **OK** |
| Local E2E phase2626 (milestone 6300 endpoints) | done | `e2e-phase2626.sh` **OK** |
| Local E2E phase2627 (milestone 6300 UI) | done | `e2e-phase2627.sh` **OK** |
| Local E2E phase2628 (STATUS milestone 6300) | done | `e2e-phase2628.sh` **OK** |
| Local E2E phase2629 (marker 2632) | done | `e2e-phase2629.sh` **OK** |
| Local E2E phase2630 (typecheck) | done | `e2e-phase2630.sh` **OK** |
| Local E2E phase2631 (e2e-all + gaps) | done | `e2e-phase2631.sh` **OK** |
| Local E2E phase2632 (STATUS soft-complete) | done | `e2e-phase2632.sh` **OK** |
| Local E2E phase2633 (honesty_bundle_roster export) | done | `e2e-phase2633.sh` **OK** |
| Local E2E phase2634 (UI honesty_bundle_roster bundle) | done | `e2e-phase2634.sh` **OK** |
| Local E2E phase2635 (export titles/notes) | done | `e2e-phase2635.sh` **OK** |
| Local E2E phase2636 (STATUS honesty_bundle_roster export) | done | `e2e-phase2636.sh` **OK** |
| Local E2E phase2637 (marker 2640) | done | `e2e-phase2637.sh` **OK** |
| Local E2E phase2638 (typecheck) | done | `e2e-phase2638.sh` **OK** |
| Local E2E phase2639 (e2e-all + gaps) | done | `e2e-phase2639.sh` **OK** |
| Local E2E phase2640 (STATUS soft-complete) | done | `e2e-phase2640.sh` **OK** |
| Local E2E phase2641 (milestone 6350) | done | `e2e-phase2641.sh` **OK** |
| Local E2E phase2642 (milestone 6350 endpoints) | done | `e2e-phase2642.sh` **OK** |
| Local E2E phase2643 (milestone 6350 UI) | done | `e2e-phase2643.sh` **OK** |
| Local E2E phase2644 (STATUS milestone 6350) | done | `e2e-phase2644.sh` **OK** |
| Local E2E phase2645 (marker 2648) | done | `e2e-phase2645.sh` **OK** |
| Local E2E phase2646 (typecheck) | done | `e2e-phase2646.sh` **OK** |
| Local E2E phase2647 (e2e-all + gaps) | done | `e2e-phase2647.sh` **OK** |
| Local E2E phase2648 (STATUS soft-complete) | done | `e2e-phase2648.sh` **OK** |
| Local E2E phase2649 (schema 2.3) | done | `e2e-phase2649.sh` **OK** |
| Local E2E phase2650 (UI schema 2.3) | done | `e2e-phase2650.sh` **OK** |
| Local E2E phase2651 (client schema) | done | `e2e-phase2651.sh` **OK** |
| Local E2E phase2652 (STATUS schema 2.3) | done | `e2e-phase2652.sh` **OK** |
| Local E2E phase2653 (marker 2656) | done | `e2e-phase2653.sh` **OK** |
| Local E2E phase2654 (typecheck) | done | `e2e-phase2654.sh` **OK** |
| Local E2E phase2655 (e2e-all + gaps) | done | `e2e-phase2655.sh` **OK** |
| Local E2E phase2656 (STATUS soft-complete) | done | `e2e-phase2656.sh` **OK** |
| Local E2E phase2657 (milestone 6400) | done | `e2e-phase2657.sh` **OK** |
| Local E2E phase2658 (milestone 6400 endpoints) | done | `e2e-phase2658.sh` **OK** |
| Local E2E phase2659 (milestone 6400 UI) | done | `e2e-phase2659.sh` **OK** |
| Local E2E phase2660 (STATUS milestone 6400) | done | `e2e-phase2660.sh` **OK** |
| Local E2E phase2661 (marker 2664) | done | `e2e-phase2661.sh` **OK** |
| Local E2E phase2662 (typecheck) | done | `e2e-phase2662.sh` **OK** |
| Local E2E phase2663 (e2e-all + gaps) | done | `e2e-phase2663.sh` **OK** |
| Local E2E phase2664 (STATUS soft-complete) | done | `e2e-phase2664.sh` **OK** |
| Local E2E phase2665 (honesty_bundle_roster session) | done | `e2e-phase2665.sh` **OK** |
| Local E2E phase2666 (UI session persist) | done | `e2e-phase2666.sh` **OK** |
| Local E2E phase2667 (clear title) | done | `e2e-phase2667.sh` **OK** |
| Local E2E phase2668 (STATUS session) | done | `e2e-phase2668.sh` **OK** |
| Local E2E phase2669 (marker 2672) | done | `e2e-phase2669.sh` **OK** |
| Local E2E phase2670 (typecheck) | done | `e2e-phase2670.sh` **OK** |
| Local E2E phase2671 (e2e-all + gaps) | done | `e2e-phase2671.sh` **OK** |
| Local E2E phase2672 (STATUS soft-complete) | done | `e2e-phase2672.sh` **OK** |
| Local E2E phase2673 (milestone 6450) | done | `e2e-phase2673.sh` **OK** |
| Local E2E phase2674 (milestone 6450 endpoints) | done | `e2e-phase2674.sh` **OK** |
| Local E2E phase2675 (milestone 6450 UI) | done | `e2e-phase2675.sh` **OK** |
| Local E2E phase2676 (STATUS milestone 6450) | done | `e2e-phase2676.sh` **OK** |
| Local E2E phase2677 (marker 2680) | done | `e2e-phase2677.sh` **OK** |
| Local E2E phase2678 (typecheck) | done | `e2e-phase2678.sh` **OK** |
| Local E2E phase2679 (e2e-all + gaps) | done | `e2e-phase2679.sh` **OK** |
| Local E2E phase2680 (STATUS soft-complete) | done | `e2e-phase2680.sh` **OK** |
| Local E2E phase2681 (Soft 2680+ checkpoint) | done | `e2e-phase2681.sh` **OK** |
| Local E2E phase2682 (UI Soft 2680+) | done | `e2e-phase2682.sh` **OK** |
| Local E2E phase2683 (client Soft 2680+) | done | `e2e-phase2683.sh` **OK** |
| Local E2E phase2684 (STATUS Soft 2680+) | done | `e2e-phase2684.sh` **OK** |
| Local E2E phase2685 (marker 2688) | done | `e2e-phase2685.sh` **OK** |
| Local E2E phase2686 (typecheck) | done | `e2e-phase2686.sh` **OK** |
| Local E2E phase2687 (e2e-all + gaps) | done | `e2e-phase2687.sh` **OK** |
| Local E2E phase2688 (STATUS soft-complete) | done | `e2e-phase2688.sh` **OK** |
| Local E2E phase2689 (milestone 6500) | done | `e2e-phase2689.sh` **OK** |
| Local E2E phase2690 (milestone 6500 endpoints) | done | `e2e-phase2690.sh` **OK** |
| Local E2E phase2691 (milestone 6500 UI) | done | `e2e-phase2691.sh` **OK** |
| Local E2E phase2692 (STATUS milestone 6500) | done | `e2e-phase2692.sh` **OK** |
| Local E2E phase2693 (marker 2696) | done | `e2e-phase2693.sh` **OK** |
| Local E2E phase2694 (typecheck) | done | `e2e-phase2694.sh` **OK** |
| Local E2E phase2695 (e2e-all + gaps) | done | `e2e-phase2695.sh` **OK** |
| Local E2E phase2696 (STATUS soft-complete) | done | `e2e-phase2696.sh` **OK** |
| Local E2E phase2697 (surface roster) | done | `e2e-phase2697.sh` **OK** |
| Local E2E phase2698 (UI surface roster) | done | `e2e-phase2698.sh` **OK** |
| Local E2E phase2699 (client surface roster) | done | `e2e-phase2699.sh` **OK** |
| Local E2E phase2700 (STATUS surface roster) | done | `e2e-phase2700.sh` **OK** |
| Local E2E phase2701 (marker 2704) | done | `e2e-phase2701.sh` **OK** |
| Local E2E phase2702 (typecheck) | done | `e2e-phase2702.sh` **OK** |
| Local E2E phase2703 (e2e-all + gaps) | done | `e2e-phase2703.sh` **OK** |
| Local E2E phase2704 (STATUS soft-complete) | done | `e2e-phase2704.sh` **OK** |
| Local E2E phase2705 (milestone 6550) | done | `e2e-phase2705.sh` **OK** |
| Local E2E phase2706 (milestone 6550 endpoints) | done | `e2e-phase2706.sh` **OK** |
| Local E2E phase2707 (milestone 6550 UI) | done | `e2e-phase2707.sh` **OK** |
| Local E2E phase2708 (STATUS milestone 6550) | done | `e2e-phase2708.sh` **OK** |
| Local E2E phase2709 (marker 2712) | done | `e2e-phase2709.sh` **OK** |
| Local E2E phase2710 (typecheck) | done | `e2e-phase2710.sh` **OK** |
| Local E2E phase2711 (e2e-all + gaps) | done | `e2e-phase2711.sh` **OK** |
| Local E2E phase2712 (STATUS soft-complete) | done | `e2e-phase2712.sh` **OK** |
| Local E2E phase2713 (surface_roster export) | done | `e2e-phase2713.sh` **OK** |
| Local E2E phase2714 (UI surface_roster bundle) | done | `e2e-phase2714.sh` **OK** |
| Local E2E phase2715 (export titles/notes) | done | `e2e-phase2715.sh` **OK** |
| Local E2E phase2716 (STATUS surface_roster export) | done | `e2e-phase2716.sh` **OK** |
| Local E2E phase2717 (marker 2720) | done | `e2e-phase2717.sh` **OK** |
| Local E2E phase2718 (typecheck) | done | `e2e-phase2718.sh` **OK** |
| Local E2E phase2719 (e2e-all + gaps) | done | `e2e-phase2719.sh` **OK** |
| Local E2E phase2720 (STATUS soft-complete) | done | `e2e-phase2720.sh` **OK** |
| Local E2E phase2721 (milestone 6600) | done | `e2e-phase2721.sh` **OK** |
| Local E2E phase2722 (milestone 6600 endpoints) | done | `e2e-phase2722.sh` **OK** |
| Local E2E phase2723 (milestone 6600 UI) | done | `e2e-phase2723.sh` **OK** |
| Local E2E phase2724 (STATUS milestone 6600) | done | `e2e-phase2724.sh` **OK** |
| Local E2E phase2725 (marker 2728) | done | `e2e-phase2725.sh` **OK** |
| Local E2E phase2726 (typecheck) | done | `e2e-phase2726.sh` **OK** |
| Local E2E phase2727 (e2e-all + gaps) | done | `e2e-phase2727.sh` **OK** |
| Local E2E phase2728 (STATUS soft-complete) | done | `e2e-phase2728.sh` **OK** |
| Local E2E phase2729 (schema 2.4) | done | `e2e-phase2729.sh` **OK** |
| Local E2E phase2730 (UI schema 2.4) | done | `e2e-phase2730.sh` **OK** |
| Local E2E phase2731 (client schema) | done | `e2e-phase2731.sh` **OK** |
| Local E2E phase2732 (STATUS schema 2.4) | done | `e2e-phase2732.sh` **OK** |
| Local E2E phase2733 (marker 2736) | done | `e2e-phase2733.sh` **OK** |
| Local E2E phase2734 (typecheck) | done | `e2e-phase2734.sh` **OK** |
| Local E2E phase2735 (e2e-all + gaps) | done | `e2e-phase2735.sh` **OK** |
| Local E2E phase2736 (STATUS soft-complete) | done | `e2e-phase2736.sh` **OK** |
| Local E2E phase2737 (milestone 6650) | done | `e2e-phase2737.sh` **OK** |
| Local E2E phase2738 (milestone 6650 endpoints) | done | `e2e-phase2738.sh` **OK** |
| Local E2E phase2739 (milestone 6650 UI) | done | `e2e-phase2739.sh` **OK** |
| Local E2E phase2740 (STATUS milestone 6650) | done | `e2e-phase2740.sh` **OK** |
| Local E2E phase2741 (marker 2744) | done | `e2e-phase2741.sh` **OK** |
| Local E2E phase2742 (typecheck) | done | `e2e-phase2742.sh` **OK** |
| Local E2E phase2743 (e2e-all + gaps) | done | `e2e-phase2743.sh` **OK** |
| Local E2E phase2744 (STATUS soft-complete) | done | `e2e-phase2744.sh` **OK** |
| Local E2E phase2745 (surface_roster session) | done | `e2e-phase2745.sh` **OK** |
| Local E2E phase2746 (UI session persist) | done | `e2e-phase2746.sh` **OK** |
| Local E2E phase2747 (clear title) | done | `e2e-phase2747.sh` **OK** |
| Local E2E phase2748 (STATUS session) | done | `e2e-phase2748.sh` **OK** |
| Local E2E phase2749 (marker 2752) | done | `e2e-phase2749.sh` **OK** |
| Local E2E phase2750 (typecheck) | done | `e2e-phase2750.sh` **OK** |
| Local E2E phase2751 (e2e-all + gaps) | done | `e2e-phase2751.sh` **OK** |
| Local E2E phase2752 (STATUS soft-complete) | done | `e2e-phase2752.sh` **OK** |
| Local E2E phase2753 (milestone 6700) | done | `e2e-phase2753.sh` **OK** |
| Local E2E phase2754 (milestone 6700 endpoints) | done | `e2e-phase2754.sh` **OK** |
| Local E2E phase2755 (milestone 6700 UI) | done | `e2e-phase2755.sh` **OK** |
| Local E2E phase2756 (STATUS milestone 6700) | done | `e2e-phase2756.sh` **OK** |
| Local E2E phase2757 (marker 2760) | done | `e2e-phase2757.sh` **OK** |
| Local E2E phase2758 (typecheck) | done | `e2e-phase2758.sh` **OK** |
| Local E2E phase2759 (e2e-all + gaps) | done | `e2e-phase2759.sh` **OK** |
| Local E2E phase2760 (STATUS soft-complete) | done | `e2e-phase2760.sh` **OK** |
| Local E2E phase2761 (Soft 2760+ checkpoint) | done | `e2e-phase2761.sh` **OK** |
| Local E2E phase2762 (UI Soft 2760+) | done | `e2e-phase2762.sh` **OK** |
| Local E2E phase2763 (client Soft 2760+) | done | `e2e-phase2763.sh` **OK** |
| Local E2E phase2764 (STATUS Soft 2760+) | done | `e2e-phase2764.sh` **OK** |
| Local E2E phase2765 (marker 2768) | done | `e2e-phase2765.sh` **OK** |
| Local E2E phase2766 (typecheck) | done | `e2e-phase2766.sh` **OK** |
| Local E2E phase2767 (e2e-all + gaps) | done | `e2e-phase2767.sh` **OK** |
| Local E2E phase2768 (STATUS soft-complete) | done | `e2e-phase2768.sh` **OK** |
| Local E2E phase2769 (milestone 6750) | done | `e2e-phase2769.sh` **OK** |
| Local E2E phase2770 (milestone 6750 endpoints) | done | `e2e-phase2770.sh` **OK** |
| Local E2E phase2771 (milestone 6750 UI) | done | `e2e-phase2771.sh` **OK** |
| Local E2E phase2772 (STATUS milestone 6750) | done | `e2e-phase2772.sh` **OK** |
| Local E2E phase2773 (marker 2776) | done | `e2e-phase2773.sh` **OK** |
| Local E2E phase2774 (typecheck) | done | `e2e-phase2774.sh` **OK** |
| Local E2E phase2775 (e2e-all + gaps) | done | `e2e-phase2775.sh` **OK** |
| Local E2E phase2776 (STATUS soft-complete) | done | `e2e-phase2776.sh` **OK** |
| Local E2E phase2777 (changelog roster) | done | `e2e-phase2777.sh` **OK** |
| Local E2E phase2778 (UI changelog roster) | done | `e2e-phase2778.sh` **OK** |
| Local E2E phase2779 (client changelog roster) | done | `e2e-phase2779.sh` **OK** |
| Local E2E phase2780 (STATUS changelog roster) | done | `e2e-phase2780.sh` **OK** |
| Local E2E phase2781 (marker 2784) | done | `e2e-phase2781.sh` **OK** |
| Local E2E phase2782 (typecheck) | done | `e2e-phase2782.sh` **OK** |
| Local E2E phase2783 (e2e-all + gaps) | done | `e2e-phase2783.sh` **OK** |
| Local E2E phase2784 (STATUS soft-complete) | done | `e2e-phase2784.sh` **OK** |
| Local E2E phase2785 (milestone 6800) | done | `e2e-phase2785.sh` **OK** |
| Local E2E phase2786 (milestone 6800 endpoints) | done | `e2e-phase2786.sh` **OK** |
| Local E2E phase2787 (milestone 6800 UI) | done | `e2e-phase2787.sh` **OK** |
| Local E2E phase2788 (STATUS milestone 6800) | done | `e2e-phase2788.sh` **OK** |
| Local E2E phase2789 (marker 2792) | done | `e2e-phase2789.sh` **OK** |
| Local E2E phase2790 (typecheck) | done | `e2e-phase2790.sh` **OK** |
| Local E2E phase2791 (e2e-all + gaps) | done | `e2e-phase2791.sh` **OK** |
| Local E2E phase2792 (STATUS soft-complete) | done | `e2e-phase2792.sh` **OK** |
| Local E2E phase2793 (changelog_roster export) | done | `e2e-phase2793.sh` **OK** |
| Local E2E phase2794 (UI changelog_roster bundle) | done | `e2e-phase2794.sh` **OK** |
| Local E2E phase2795 (export titles/notes) | done | `e2e-phase2795.sh` **OK** |
| Local E2E phase2796 (STATUS changelog_roster export) | done | `e2e-phase2796.sh` **OK** |
| Local E2E phase2797 (marker 2800) | done | `e2e-phase2797.sh` **OK** |
| Local E2E phase2798 (typecheck) | done | `e2e-phase2798.sh` **OK** |
| Local E2E phase2799 (e2e-all + gaps) | done | `e2e-phase2799.sh` **OK** |
| Local E2E phase2800 (STATUS soft-complete) | done | `e2e-phase2800.sh` **OK** |
| Local E2E phase2801 (milestone 6850) | done | `e2e-phase2801.sh` **OK** |
| Local E2E phase2802 (milestone 6850 endpoints) | done | `e2e-phase2802.sh` **OK** |
| Local E2E phase2803 (milestone 6850 UI) | done | `e2e-phase2803.sh` **OK** |
| Local E2E phase2804 (STATUS milestone 6850) | done | `e2e-phase2804.sh` **OK** |
| Local E2E phase2805 (marker 2808) | done | `e2e-phase2805.sh` **OK** |
| Local E2E phase2806 (typecheck) | done | `e2e-phase2806.sh` **OK** |
| Local E2E phase2807 (e2e-all + gaps) | done | `e2e-phase2807.sh` **OK** |
| Local E2E phase2808 (STATUS soft-complete) | done | `e2e-phase2808.sh` **OK** |
| Local E2E phase2809 (schema 2.5) | done | `e2e-phase2809.sh` **OK** |
| Local E2E phase2810 (UI schema 2.5) | done | `e2e-phase2810.sh` **OK** |
| Local E2E phase2811 (client schema) | done | `e2e-phase2811.sh` **OK** |
| Local E2E phase2812 (STATUS schema 2.5) | done | `e2e-phase2812.sh` **OK** |
| Local E2E phase2813 (marker 2816) | done | `e2e-phase2813.sh` **OK** |
| Local E2E phase2814 (typecheck) | done | `e2e-phase2814.sh` **OK** |
| Local E2E phase2815 (e2e-all + gaps) | done | `e2e-phase2815.sh` **OK** |
| Local E2E phase2816 (STATUS soft-complete) | done | `e2e-phase2816.sh` **OK** |
| Local E2E phase2817 (milestone 6900) | done | `e2e-phase2817.sh` **OK** |
| Local E2E phase2818 (milestone 6900 endpoints) | done | `e2e-phase2818.sh` **OK** |
| Local E2E phase2819 (milestone 6900 UI) | done | `e2e-phase2819.sh` **OK** |
| Local E2E phase2820 (STATUS milestone 6900) | done | `e2e-phase2820.sh` **OK** |
| Local E2E phase2821 (marker 2824) | done | `e2e-phase2821.sh` **OK** |
| Local E2E phase2822 (typecheck) | done | `e2e-phase2822.sh` **OK** |
| Local E2E phase2823 (e2e-all + gaps) | done | `e2e-phase2823.sh` **OK** |
| Local E2E phase2824 (STATUS soft-complete) | done | `e2e-phase2824.sh` **OK** |
| Local E2E phase2825 (changelog_roster session) | done | `e2e-phase2825.sh` **OK** |
| Local E2E phase2826 (UI session persist) | done | `e2e-phase2826.sh` **OK** |
| Local E2E phase2827 (clear title) | done | `e2e-phase2827.sh` **OK** |
| Local E2E phase2828 (STATUS session) | done | `e2e-phase2828.sh` **OK** |
| Local E2E phase2829 (marker 2832) | done | `e2e-phase2829.sh` **OK** |
| Local E2E phase2830 (typecheck) | done | `e2e-phase2830.sh` **OK** |
| Local E2E phase2831 (e2e-all + gaps) | done | `e2e-phase2831.sh` **OK** |
| Local E2E phase2832 (STATUS soft-complete) | done | `e2e-phase2832.sh` **OK** |
| Local E2E phase2833 (milestone 6950) | done | `e2e-phase2833.sh` **OK** |
| Local E2E phase2834 (milestone 6950 endpoints) | done | `e2e-phase2834.sh` **OK** |
| Local E2E phase2835 (milestone 6950 UI) | done | `e2e-phase2835.sh` **OK** |
| Local E2E phase2836 (STATUS milestone 6950) | done | `e2e-phase2836.sh` **OK** |
| Local E2E phase2837 (marker 2840) | done | `e2e-phase2837.sh` **OK** |
| Local E2E phase2838 (typecheck) | done | `e2e-phase2838.sh` **OK** |
| Local E2E phase2839 (e2e-all + gaps) | done | `e2e-phase2839.sh` **OK** |
| Local E2E phase2840 (STATUS soft-complete) | done | `e2e-phase2840.sh` **OK** |
| Local E2E phase2841 (Soft 2840+ checkpoint) | done | `e2e-phase2841.sh` **OK** |
| Local E2E phase2842 (UI Soft 2840+) | done | `e2e-phase2842.sh` **OK** |
| Local E2E phase2843 (client Soft 2840+) | done | `e2e-phase2843.sh` **OK** |
| Local E2E phase2844 (STATUS Soft 2840+) | done | `e2e-phase2844.sh` **OK** |
| Local E2E phase2845 (marker 2848) | done | `e2e-phase2845.sh` **OK** |
| Local E2E phase2846 (typecheck) | done | `e2e-phase2846.sh` **OK** |
| Local E2E phase2847 (e2e-all + gaps) | done | `e2e-phase2847.sh` **OK** |
| Local E2E phase2848 (STATUS soft-complete) | done | `e2e-phase2848.sh` **OK** |
| Local E2E phase2849 (milestone 7000) | done | `e2e-phase2849.sh` **OK** |
| Local E2E phase2850 (milestone 7000 endpoints) | done | `e2e-phase2850.sh` **OK** |
| Local E2E phase2851 (milestone 7000 UI) | done | `e2e-phase2851.sh` **OK** |
| Local E2E phase2852 (STATUS milestone 7000) | done | `e2e-phase2852.sh` **OK** |
| Local E2E phase2853 (marker 2856) | done | `e2e-phase2853.sh` **OK** |
| Local E2E phase2854 (typecheck) | done | `e2e-phase2854.sh` **OK** |
| Local E2E phase2855 (e2e-all + gaps) | done | `e2e-phase2855.sh` **OK** |
| Local E2E phase2856 (STATUS soft-complete) | done | `e2e-phase2856.sh` **OK** |
| Local E2E phase2857 (expect step roster) | done | `e2e-phase2857.sh` **OK** |
| Local E2E phase2858 (UI expect step roster) | done | `e2e-phase2858.sh` **OK** |
| Local E2E phase2859 (client expect step roster) | done | `e2e-phase2859.sh` **OK** |
| Local E2E phase2860 (STATUS expect step roster) | done | `e2e-phase2860.sh` **OK** |
| Local E2E phase2861 (marker 2864) | done | `e2e-phase2861.sh` **OK** |
| Local E2E phase2862 (typecheck) | done | `e2e-phase2862.sh` **OK** |
| Local E2E phase2863 (e2e-all + gaps) | done | `e2e-phase2863.sh` **OK** |
| Local E2E phase2864 (STATUS soft-complete) | done | `e2e-phase2864.sh` **OK** |
| Local E2E phase2865 (milestone 7050) | done | `e2e-phase2865.sh` **OK** |
| Local E2E phase2866 (milestone 7050 endpoints) | done | `e2e-phase2866.sh` **OK** |
| Local E2E phase2867 (milestone 7050 UI) | done | `e2e-phase2867.sh` **OK** |
| Local E2E phase2868 (STATUS milestone 7050) | done | `e2e-phase2868.sh` **OK** |
| Local E2E phase2869 (marker 2872) | done | `e2e-phase2869.sh` **OK** |
| Local E2E phase2870 (typecheck) | done | `e2e-phase2870.sh` **OK** |
| Local E2E phase2871 (e2e-all + gaps) | done | `e2e-phase2871.sh` **OK** |
| Local E2E phase2872 (STATUS soft-complete) | done | `e2e-phase2872.sh` **OK** |
| Local E2E phase2873 (expect_step export/bundle) | done | `e2e-phase2873.sh` **OK** |
| Local E2E phase2874 (UI expect_step bundle) | done | `e2e-phase2874.sh` **OK** |
| Local E2E phase2875 (expect_step titles/notes) | done | `e2e-phase2875.sh` **OK** |
| Local E2E phase2876 (STATUS expect_step export) | done | `e2e-phase2876.sh` **OK** |
| Local E2E phase2877 (marker 2880) | done | `e2e-phase2877.sh` **OK** |
| Local E2E phase2878 (typecheck) | done | `e2e-phase2878.sh` **OK** |
| Local E2E phase2879 (e2e-all + gaps) | done | `e2e-phase2879.sh` **OK** |
| Local E2E phase2880 (STATUS soft-complete) | done | `e2e-phase2880.sh` **OK** |
| Local E2E phase2881 (milestone 7100) | done | `e2e-phase2881.sh` **OK** |
| Local E2E phase2882 (milestone 7100 endpoints) | done | `e2e-phase2882.sh` **OK** |
| Local E2E phase2883 (milestone 7100 UI) | done | `e2e-phase2883.sh` **OK** |
| Local E2E phase2884 (STATUS milestone 7100) | done | `e2e-phase2884.sh` **OK** |
| Local E2E phase2885 (marker 2888) | done | `e2e-phase2885.sh` **OK** |
| Local E2E phase2886 (typecheck) | done | `e2e-phase2886.sh` **OK** |
| Local E2E phase2887 (e2e-all + gaps) | done | `e2e-phase2887.sh` **OK** |
| Local E2E phase2888 (STATUS soft-complete) | done | `e2e-phase2888.sh` **OK** |
| Local E2E phase2889 (schema 2.6) | done | `e2e-phase2889.sh` **OK** |
| Local E2E phase2890 (UI schema 2.6) | done | `e2e-phase2890.sh` **OK** |
| Local E2E phase2891 (client schema/expect_step) | done | `e2e-phase2891.sh` **OK** |
| Local E2E phase2892 (STATUS schema 2.6) | done | `e2e-phase2892.sh` **OK** |
| Local E2E phase2893 (marker 2896) | done | `e2e-phase2893.sh` **OK** |
| Local E2E phase2894 (typecheck) | done | `e2e-phase2894.sh` **OK** |
| Local E2E phase2895 (e2e-all + gaps) | done | `e2e-phase2895.sh` **OK** |
| Local E2E phase2896 (STATUS soft-complete) | done | `e2e-phase2896.sh` **OK** |
| Local E2E phase2897 (milestone 7150) | done | `e2e-phase2897.sh` **OK** |
| Local E2E phase2898 (milestone 7150 endpoints) | done | `e2e-phase2898.sh` **OK** |
| Local E2E phase2899 (milestone 7150 UI) | done | `e2e-phase2899.sh` **OK** |
| Local E2E phase2900 (STATUS milestone 7150) | done | `e2e-phase2900.sh` **OK** |
| Local E2E phase2901 (marker 2904) | done | `e2e-phase2901.sh` **OK** |
| Local E2E phase2902 (typecheck) | done | `e2e-phase2902.sh` **OK** |
| Local E2E phase2903 (e2e-all + gaps) | done | `e2e-phase2903.sh` **OK** |
| Local E2E phase2904 (STATUS soft-complete) | done | `e2e-phase2904.sh` **OK** |
| Local E2E phase2905 (expect_step sessionStorage) | done | `e2e-phase2905.sh` **OK** |
| Local E2E phase2906 (UI expect_step sessionStorage) | done | `e2e-phase2906.sh` **OK** |
| Local E2E phase2907 (clear expect_step) | done | `e2e-phase2907.sh` **OK** |
| Local E2E phase2908 (STATUS expect_step session) | done | `e2e-phase2908.sh` **OK** |
| Local E2E phase2909 (marker 2912) | done | `e2e-phase2909.sh` **OK** |
| Local E2E phase2910 (typecheck) | done | `e2e-phase2910.sh` **OK** |
| Local E2E phase2911 (e2e-all + gaps) | done | `e2e-phase2911.sh` **OK** |
| Local E2E phase2912 (STATUS soft-complete) | done | `e2e-phase2912.sh` **OK** |
| Local E2E phase2913 (milestone 7200) | done | `e2e-phase2913.sh` **OK** |
| Local E2E phase2914 (milestone 7200 endpoints) | done | `e2e-phase2914.sh` **OK** |
| Local E2E phase2915 (milestone 7200 UI) | done | `e2e-phase2915.sh` **OK** |
| Local E2E phase2916 (STATUS milestone 7200) | done | `e2e-phase2916.sh` **OK** |
| Local E2E phase2917 (marker 2920) | done | `e2e-phase2917.sh` **OK** |
| Local E2E phase2918 (typecheck) | done | `e2e-phase2918.sh` **OK** |
| Local E2E phase2919 (e2e-all + gaps) | done | `e2e-phase2919.sh` **OK** |
| Local E2E phase2920 (STATUS soft-complete) | done | `e2e-phase2920.sh` **OK** |
| Local E2E phase2921 (Soft 2920+ surface) | done | `e2e-phase2921.sh` **OK** |
| Local E2E phase2922 (UI Soft 2920+) | done | `e2e-phase2922.sh` **OK** |
| Local E2E phase2923 (client Soft 2920+) | done | `e2e-phase2923.sh` **OK** |
| Local E2E phase2924 (STATUS Soft 2920+) | done | `e2e-phase2924.sh` **OK** |
| Local E2E phase2925 (marker 2928) | done | `e2e-phase2925.sh` **OK** |
| Local E2E phase2926 (typecheck) | done | `e2e-phase2926.sh` **OK** |
| Local E2E phase2927 (e2e-all + gaps) | done | `e2e-phase2927.sh` **OK** |
| Local E2E phase2928 (STATUS soft-complete) | done | `e2e-phase2928.sh` **OK** |
| Local E2E phase2929 (milestone 7250) | done | `e2e-phase2929.sh` **OK** |
| Local E2E phase2930 (milestone 7250 endpoints) | done | `e2e-phase2930.sh` **OK** |
| Local E2E phase2931 (milestone 7250 UI) | done | `e2e-phase2931.sh` **OK** |
| Local E2E phase2932 (STATUS milestone 7250) | done | `e2e-phase2932.sh` **OK** |
| Local E2E phase2933 (marker 2936) | done | `e2e-phase2933.sh` **OK** |
| Local E2E phase2934 (typecheck) | done | `e2e-phase2934.sh` **OK** |
| Local E2E phase2935 (e2e-all + gaps) | done | `e2e-phase2935.sh` **OK** |
| Local E2E phase2936 (STATUS soft-complete) | done | `e2e-phase2936.sh` **OK** |
| Local E2E phase2937 (SSH honesty roster) | done | `e2e-phase2937.sh` **OK** |
| Local E2E phase2938 (UI SSH honesty roster) | done | `e2e-phase2938.sh` **OK** |
| Local E2E phase2939 (client SSH honesty roster) | done | `e2e-phase2939.sh` **OK** |
| Local E2E phase2940 (STATUS SSH honesty roster) | done | `e2e-phase2940.sh` **OK** |
| Local E2E phase2941 (marker 2944) | done | `e2e-phase2941.sh` **OK** |
| Local E2E phase2942 (typecheck) | done | `e2e-phase2942.sh` **OK** |
| Local E2E phase2943 (e2e-all + gaps) | done | `e2e-phase2943.sh` **OK** |
| Local E2E phase2944 (STATUS soft-complete) | done | `e2e-phase2944.sh` **OK** |
| Local E2E phase2945 (milestone 7300) | done | `e2e-phase2945.sh` **OK** |
| Local E2E phase2946 (milestone 7300 endpoints) | done | `e2e-phase2946.sh` **OK** |
| Local E2E phase2947 (milestone 7300 UI) | done | `e2e-phase2947.sh` **OK** |
| Local E2E phase2948 (STATUS milestone 7300) | done | `e2e-phase2948.sh` **OK** |
| Local E2E phase2949 (marker 2952) | done | `e2e-phase2949.sh` **OK** |
| Local E2E phase2950 (typecheck) | done | `e2e-phase2950.sh` **OK** |
| Local E2E phase2951 (e2e-all + gaps) | done | `e2e-phase2951.sh` **OK** |
| Local E2E phase2952 (STATUS soft-complete) | done | `e2e-phase2952.sh` **OK** |
| Local E2E phase2953 (ssh_honesty export/bundle) | done | `e2e-phase2953.sh` **OK** |
| Local E2E phase2954 (UI ssh_honesty bundle) | done | `e2e-phase2954.sh` **OK** |
| Local E2E phase2955 (ssh_honesty titles/notes) | done | `e2e-phase2955.sh` **OK** |
| Local E2E phase2956 (STATUS ssh_honesty export) | done | `e2e-phase2956.sh` **OK** |
| Local E2E phase2957 (marker 2960) | done | `e2e-phase2957.sh` **OK** |
| Local E2E phase2958 (typecheck) | done | `e2e-phase2958.sh` **OK** |
| Local E2E phase2959 (e2e-all + gaps) | done | `e2e-phase2959.sh` **OK** |
| Local E2E phase2960 (STATUS soft-complete) | done | `e2e-phase2960.sh` **OK** |
| Local E2E phase2961 (milestone 7350) | done | `e2e-phase2961.sh` **OK** |
| Local E2E phase2962 (milestone 7350 endpoints) | done | `e2e-phase2962.sh` **OK** |
| Local E2E phase2963 (milestone 7350 UI) | done | `e2e-phase2963.sh` **OK** |
| Local E2E phase2964 (STATUS milestone 7350) | done | `e2e-phase2964.sh` **OK** |
| Local E2E phase2965 (marker 2968) | done | `e2e-phase2965.sh` **OK** |
| Local E2E phase2966 (typecheck) | done | `e2e-phase2966.sh` **OK** |
| Local E2E phase2967 (e2e-all + gaps) | done | `e2e-phase2967.sh` **OK** |
| Local E2E phase2968 (STATUS soft-complete) | done | `e2e-phase2968.sh` **OK** |
| Local E2E phase2969 (schema 2.7) | done | `e2e-phase2969.sh` **OK** |
| Local E2E phase2970 (UI schema 2.7) | done | `e2e-phase2970.sh` **OK** |
| Local E2E phase2971 (client schema/ssh_honesty) | done | `e2e-phase2971.sh` **OK** |
| Local E2E phase2972 (STATUS schema 2.7) | done | `e2e-phase2972.sh` **OK** |
| Local E2E phase2973 (marker 2976) | done | `e2e-phase2973.sh` **OK** |
| Local E2E phase2974 (typecheck) | done | `e2e-phase2974.sh` **OK** |
| Local E2E phase2975 (e2e-all + gaps) | done | `e2e-phase2975.sh` **OK** |
| Local E2E phase2976 (STATUS soft-complete) | done | `e2e-phase2976.sh` **OK** |
| Local E2E phase2977 (milestone 7400) | done | `e2e-phase2977.sh` **OK** |
| Local E2E phase2978 (milestone 7400 endpoints) | done | `e2e-phase2978.sh` **OK** |
| Local E2E phase2979 (milestone 7400 UI) | done | `e2e-phase2979.sh` **OK** |
| Local E2E phase2980 (STATUS milestone 7400) | done | `e2e-phase2980.sh` **OK** |
| Local E2E phase2981 (marker 2984) | done | `e2e-phase2981.sh` **OK** |
| Local E2E phase2982 (typecheck) | done | `e2e-phase2982.sh` **OK** |
| Local E2E phase2983 (e2e-all + gaps) | done | `e2e-phase2983.sh` **OK** |
| Local E2E phase2984 (STATUS soft-complete) | done | `e2e-phase2984.sh` **OK** |
| Local E2E phase2985 (ssh_honesty sessionStorage) | done | `e2e-phase2985.sh` **OK** |
| Local E2E phase2986 (UI ssh_honesty sessionStorage) | done | `e2e-phase2986.sh` **OK** |
| Local E2E phase2987 (clear ssh_honesty) | done | `e2e-phase2987.sh` **OK** |
| Local E2E phase2988 (STATUS ssh_honesty session) | done | `e2e-phase2988.sh` **OK** |
| Local E2E phase2989 (marker 2992) | done | `e2e-phase2989.sh` **OK** |
| Local E2E phase2990 (typecheck) | done | `e2e-phase2990.sh` **OK** |
| Local E2E phase2991 (e2e-all + gaps) | done | `e2e-phase2991.sh` **OK** |
| Local E2E phase2992 (STATUS soft-complete) | done | `e2e-phase2992.sh` **OK** |
| Local E2E phase2993 (milestone 7450) | done | `e2e-phase2993.sh` **OK** |
| Local E2E phase2994 (milestone 7450 endpoints) | done | `e2e-phase2994.sh` **OK** |
| Local E2E phase2995 (milestone 7450 UI) | done | `e2e-phase2995.sh` **OK** |
| Local E2E phase2996 (STATUS milestone 7450) | done | `e2e-phase2996.sh` **OK** |
| Local E2E phase2997 (marker 3000) | done | `e2e-phase2997.sh` **OK** |
| Local E2E phase2998 (typecheck) | done | `e2e-phase2998.sh` **OK** |
| Local E2E phase2999 (e2e-all + gaps) | done | `e2e-phase2999.sh` **OK** |
| Local E2E phase3000 (STATUS soft-complete) | done | `e2e-phase3000.sh` **OK** |
| Local E2E phase3001 (Soft 3000+ surface) | done | `e2e-phase3001.sh` **OK** |
| Local E2E phase3002 (UI Soft 3000+) | done | `e2e-phase3002.sh` **OK** |
| Local E2E phase3003 (client Soft 3000+) | done | `e2e-phase3003.sh` **OK** |
| Local E2E phase3004 (STATUS Soft 3000+) | done | `e2e-phase3004.sh` **OK** |
| Local E2E phase3005 (marker 3008) | done | `e2e-phase3005.sh` **OK** |
| Local E2E phase3006 (typecheck) | done | `e2e-phase3006.sh` **OK** |
| Local E2E phase3007 (e2e-all + gaps) | done | `e2e-phase3007.sh` **OK** |
| Local E2E phase3008 (STATUS soft-complete) | done | `e2e-phase3008.sh` **OK** |
| Local E2E phase3009 (milestone 7500) | done | `e2e-phase3009.sh` **OK** |
| Local E2E phase3010 (milestone 7500 endpoints) | done | `e2e-phase3010.sh` **OK** |
| Local E2E phase3011 (milestone 7500 UI) | done | `e2e-phase3011.sh` **OK** |
| Local E2E phase3012 (STATUS milestone 7500) | done | `e2e-phase3012.sh` **OK** |
| Local E2E phase3013 (marker 3016) | done | `e2e-phase3013.sh` **OK** |
| Local E2E phase3014 (typecheck) | done | `e2e-phase3014.sh` **OK** |
| Local E2E phase3015 (e2e-all + gaps) | done | `e2e-phase3015.sh` **OK** |
| Local E2E phase3016 (STATUS soft-complete) | done | `e2e-phase3016.sh` **OK** |
| Local E2E phase3017 (layout fidelity signal roster) | done | `e2e-phase3017.sh` **OK** |
| Local E2E phase3018 (UI layout fidelity signal) | done | `e2e-phase3018.sh` **OK** |
| Local E2E phase3019 (client layout fidelity signal) | done | `e2e-phase3019.sh` **OK** |
| Local E2E phase3020 (STATUS layout fidelity signal) | done | `e2e-phase3020.sh` **OK** |
| Local E2E phase3021 (marker 3024) | done | `e2e-phase3021.sh` **OK** |
| Local E2E phase3022 (typecheck) | done | `e2e-phase3022.sh` **OK** |
| Local E2E phase3023 (e2e-all + gaps) | done | `e2e-phase3023.sh` **OK** |
| Local E2E phase3024 (STATUS soft-complete) | done | `e2e-phase3024.sh` **OK** |
| Local E2E phase3025 (milestone 7550) | done | `e2e-phase3025.sh` **OK** |
| Local E2E phase3026 (milestone 7550 endpoints) | done | `e2e-phase3026.sh` **OK** |
| Local E2E phase3027 (milestone 7550 UI) | done | `e2e-phase3027.sh` **OK** |
| Local E2E phase3028 (STATUS milestone 7550) | done | `e2e-phase3028.sh` **OK** |
| Local E2E phase3029 (marker 3032) | done | `e2e-phase3029.sh` **OK** |
| Local E2E phase3030 (typecheck) | done | `e2e-phase3030.sh` **OK** |
| Local E2E phase3031 (e2e-all + gaps) | done | `e2e-phase3031.sh` **OK** |
| Local E2E phase3032 (STATUS soft-complete) | done | `e2e-phase3032.sh` **OK** |
| Local E2E phase3033 (layout signal export/bundle) | done | `e2e-phase3033.sh` **OK** |
| Local E2E phase3034 (UI layout signal bundle) | done | `e2e-phase3034.sh` **OK** |
| Local E2E phase3035 (layout signal titles/notes) | done | `e2e-phase3035.sh` **OK** |
| Local E2E phase3036 (STATUS layout signal export) | done | `e2e-phase3036.sh` **OK** |
| Local E2E phase3037 (marker 3040) | done | `e2e-phase3037.sh` **OK** |
| Local E2E phase3038 (typecheck) | done | `e2e-phase3038.sh` **OK** |
| Local E2E phase3039 (e2e-all + gaps) | done | `e2e-phase3039.sh` **OK** |
| Local E2E phase3040 (STATUS soft-complete) | done | `e2e-phase3040.sh` **OK** |
| Local E2E phase3041 (milestone 7600) | done | `e2e-phase3041.sh` **OK** |
| Local E2E phase3042 (milestone 7600 endpoints) | done | `e2e-phase3042.sh` **OK** |
| Local E2E phase3043 (milestone 7600 UI) | done | `e2e-phase3043.sh` **OK** |
| Local E2E phase3044 (STATUS milestone 7600) | done | `e2e-phase3044.sh` **OK** |
| Local E2E phase3045 (marker 3048) | done | `e2e-phase3045.sh` **OK** |
| Local E2E phase3046 (typecheck) | done | `e2e-phase3046.sh` **OK** |
| Local E2E phase3047 (e2e-all + gaps) | done | `e2e-phase3047.sh` **OK** |
| Local E2E phase3048 (STATUS soft-complete) | done | `e2e-phase3048.sh` **OK** |
| Local E2E phase3049 (schema 2.8) | done | `e2e-phase3049.sh` **OK** |
| Local E2E phase3050 (UI schema 2.8) | done | `e2e-phase3050.sh` **OK** |
| Local E2E phase3051 (client schema/layout_fidelity_signal) | done | `e2e-phase3051.sh` **OK** |
| Local E2E phase3052 (STATUS schema 2.8) | done | `e2e-phase3052.sh` **OK** |
| Local E2E phase3053 (marker 3056) | done | `e2e-phase3053.sh` **OK** |
| Local E2E phase3054 (typecheck) | done | `e2e-phase3054.sh` **OK** |
| Local E2E phase3055 (e2e-all + gaps) | done | `e2e-phase3055.sh` **OK** |
| Local E2E phase3056 (STATUS soft-complete) | done | `e2e-phase3056.sh` **OK** |
| Local E2E phase3057 (milestone 7650) | done | `e2e-phase3057.sh` **OK** |
| Local E2E phase3058 (milestone 7650 endpoints) | done | `e2e-phase3058.sh` **OK** |
| Local E2E phase3059 (milestone 7650 UI) | done | `e2e-phase3059.sh` **OK** |
| Local E2E phase3060 (STATUS milestone 7650) | done | `e2e-phase3060.sh` **OK** |
| Local E2E phase3061 (marker 3064) | done | `e2e-phase3061.sh` **OK** |
| Local E2E phase3062 (typecheck) | done | `e2e-phase3062.sh` **OK** |
| Local E2E phase3063 (e2e-all + gaps) | done | `e2e-phase3063.sh` **OK** |
| Local E2E phase3064 (STATUS soft-complete) | done | `e2e-phase3064.sh` **OK** |
| Local E2E phase3065 (layout_fidelity_signal sessionStorage) | done | `e2e-phase3065.sh` **OK** |
| Local E2E phase3066 (UI layout_fidelity_signal sessionStorage) | done | `e2e-phase3066.sh` **OK** |
| Local E2E phase3067 (clear layout_fidelity_signal) | done | `e2e-phase3067.sh` **OK** |
| Local E2E phase3068 (STATUS layout_fidelity_signal session) | done | `e2e-phase3068.sh` **OK** |
| Local E2E phase3069 (marker 3072) | done | `e2e-phase3069.sh` **OK** |
| Local E2E phase3070 (typecheck) | done | `e2e-phase3070.sh` **OK** |
| Local E2E phase3071 (e2e-all + gaps) | done | `e2e-phase3071.sh` **OK** |
| Local E2E phase3072 (STATUS soft-complete) | done | `e2e-phase3072.sh` **OK** |
| Local E2E phase3073 (milestone 7700) | done | `e2e-phase3073.sh` **OK** |
| Local E2E phase3074 (milestone 7700 endpoints) | done | `e2e-phase3074.sh` **OK** |
| Local E2E phase3075 (milestone 7700 UI) | done | `e2e-phase3075.sh` **OK** |
| Local E2E phase3076 (STATUS milestone 7700) | done | `e2e-phase3076.sh` **OK** |
| Local E2E phase3077 (marker 3080) | done | `e2e-phase3077.sh` **OK** |
| Local E2E phase3078 (typecheck) | done | `e2e-phase3078.sh` **OK** |
| Local E2E phase3079 (e2e-all + gaps) | done | `e2e-phase3079.sh` **OK** |
| Local E2E phase3080 (STATUS soft-complete) | done | `e2e-phase3080.sh` **OK** |
| Local E2E phase3081 (Soft 3080+ surface) | done | `e2e-phase3081.sh` **OK** |
| Local E2E phase3082 (UI Soft 3080+) | done | `e2e-phase3082.sh` **OK** |
| Local E2E phase3083 (client Soft 3080+) | done | `e2e-phase3083.sh` **OK** |
| Local E2E phase3084 (STATUS Soft 3080+) | done | `e2e-phase3084.sh` **OK** |
| Local E2E phase3085 (marker 3088) | done | `e2e-phase3085.sh` **OK** |
| Local E2E phase3086 (typecheck) | done | `e2e-phase3086.sh` **OK** |
| Local E2E phase3087 (e2e-all + gaps) | done | `e2e-phase3087.sh` **OK** |
| Local E2E phase3088 (STATUS soft-complete) | done | `e2e-phase3088.sh` **OK** |
| Local E2E phase3089 (milestone 7750) | done | `e2e-phase3089.sh` **OK** |
| Local E2E phase3090 (milestone 7750 endpoints) | done | `e2e-phase3090.sh` **OK** |
| Local E2E phase3091 (milestone 7750 UI) | done | `e2e-phase3091.sh` **OK** |
| Local E2E phase3092 (STATUS milestone 7750) | done | `e2e-phase3092.sh` **OK** |
| Local E2E phase3093 (marker 3096) | done | `e2e-phase3093.sh` **OK** |
| Local E2E phase3094 (typecheck) | done | `e2e-phase3094.sh` **OK** |
| Local E2E phase3095 (e2e-all + gaps) | done | `e2e-phase3095.sh` **OK** |
| Local E2E phase3096 (STATUS soft-complete) | done | `e2e-phase3096.sh` **OK** |
| Local E2E phase3097 (layout fidelity sample roster) | done | `e2e-phase3097.sh` **OK** |
| Local E2E phase3098 (UI layout fidelity sample) | done | `e2e-phase3098.sh` **OK** |
| Local E2E phase3099 (client layout fidelity sample) | done | `e2e-phase3099.sh` **OK** |
| Local E2E phase3100 (STATUS layout fidelity sample) | done | `e2e-phase3100.sh` **OK** |
| Local E2E phase3101 (marker 3104) | done | `e2e-phase3101.sh` **OK** |
| Local E2E phase3102 (typecheck) | done | `e2e-phase3102.sh` **OK** |
| Local E2E phase3103 (e2e-all + gaps) | done | `e2e-phase3103.sh` **OK** |
| Local E2E phase3104 (STATUS soft-complete) | done | `e2e-phase3104.sh` **OK** |
| Local E2E phase3105 (milestone 7800) | done | `e2e-phase3105.sh` **OK** |
| Local E2E phase3106 (milestone 7800 endpoints) | done | `e2e-phase3106.sh` **OK** |
| Local E2E phase3107 (milestone 7800 UI) | done | `e2e-phase3107.sh` **OK** |
| Local E2E phase3108 (STATUS milestone 7800) | done | `e2e-phase3108.sh` **OK** |
| Local E2E phase3109 (marker 3112) | done | `e2e-phase3109.sh` **OK** |
| Local E2E phase3110 (typecheck) | done | `e2e-phase3110.sh` **OK** |
| Local E2E phase3111 (e2e-all + gaps) | done | `e2e-phase3111.sh` **OK** |
| Local E2E phase3112 (STATUS soft-complete) | done | `e2e-phase3112.sh` **OK** |
| Local E2E phase3113 (layout sample export/bundle) | done | `e2e-phase3113.sh` **OK** |
| Local E2E phase3114 (UI layout sample bundle) | done | `e2e-phase3114.sh` **OK** |
| Local E2E phase3115 (layout sample titles/notes) | done | `e2e-phase3115.sh` **OK** |
| Local E2E phase3116 (STATUS layout sample export) | done | `e2e-phase3116.sh` **OK** |
| Local E2E phase3117 (marker 3120) | done | `e2e-phase3117.sh` **OK** |
| Local E2E phase3118 (typecheck) | done | `e2e-phase3118.sh` **OK** |
| Local E2E phase3119 (e2e-all + gaps) | done | `e2e-phase3119.sh` **OK** |
| Local E2E phase3120 (STATUS soft-complete) | done | `e2e-phase3120.sh` **OK** |
| Local E2E phase3121 (milestone 7850) | done | `e2e-phase3121.sh` **OK** |
| Local E2E phase3122 (milestone 7850 endpoints) | done | `e2e-phase3122.sh` **OK** |
| Local E2E phase3123 (milestone 7850 UI) | done | `e2e-phase3123.sh` **OK** |
| Local E2E phase3124 (STATUS milestone 7850) | done | `e2e-phase3124.sh` **OK** |
| Local E2E phase3125 (marker 3128) | done | `e2e-phase3125.sh` **OK** |
| Local E2E phase3126 (typecheck) | done | `e2e-phase3126.sh` **OK** |
| Local E2E phase3127 (e2e-all + gaps) | done | `e2e-phase3127.sh` **OK** |
| Local E2E phase3128 (STATUS soft-complete) | done | `e2e-phase3128.sh` **OK** |
| Local E2E phase3129 (schema 2.9) | done | `e2e-phase3129.sh` **OK** |
| Local E2E phase3130 (UI schema 2.9) | done | `e2e-phase3130.sh` **OK** |
| Local E2E phase3131 (client schema/layout_fidelity_sample) | done | `e2e-phase3131.sh` **OK** |
| Local E2E phase3132 (STATUS schema 2.9) | done | `e2e-phase3132.sh` **OK** |
| Local E2E phase3133 (marker 3136) | done | `e2e-phase3133.sh` **OK** |
| Local E2E phase3134 (typecheck) | done | `e2e-phase3134.sh` **OK** |
| Local E2E phase3135 (e2e-all + gaps) | done | `e2e-phase3135.sh` **OK** |
| Local E2E phase3136 (STATUS soft-complete) | done | `e2e-phase3136.sh` **OK** |
| Local E2E phase3137 (milestone 7900) | done | `e2e-phase3137.sh` **OK** |
| Local E2E phase3138 (milestone 7900 endpoints) | done | `e2e-phase3138.sh` **OK** |
| Local E2E phase3139 (milestone 7900 UI) | done | `e2e-phase3139.sh` **OK** |
| Local E2E phase3140 (STATUS milestone 7900) | done | `e2e-phase3140.sh` **OK** |
| Local E2E phase3141 (marker 3144) | done | `e2e-phase3141.sh` **OK** |
| Local E2E phase3142 (typecheck) | done | `e2e-phase3142.sh` **OK** |
| Local E2E phase3143 (e2e-all + gaps) | done | `e2e-phase3143.sh` **OK** |
| Local E2E phase3144 (STATUS soft-complete) | done | `e2e-phase3144.sh` **OK** |
| Local E2E phase3145 (layout_fidelity_sample sessionStorage) | done | `e2e-phase3145.sh` **OK** |
| Local E2E phase3146 (UI layout_fidelity_sample sessionStorage) | done | `e2e-phase3146.sh` **OK** |
| Local E2E phase3147 (clear layout_fidelity_sample) | done | `e2e-phase3147.sh` **OK** |
| Local E2E phase3148 (STATUS layout_fidelity_sample session) | done | `e2e-phase3148.sh` **OK** |
| Local E2E phase3149 (marker 3152) | done | `e2e-phase3149.sh` **OK** |
| Local E2E phase3150 (typecheck) | done | `e2e-phase3150.sh` **OK** |
| Local E2E phase3151 (e2e-all + gaps) | done | `e2e-phase3151.sh` **OK** |
| Local E2E phase3152 (STATUS soft-complete) | done | `e2e-phase3152.sh` **OK** |
| Local E2E phase3153 (milestone 7950) | done | `e2e-phase3153.sh` **OK** |
| Local E2E phase3154 (milestone 7950 endpoints) | done | `e2e-phase3154.sh` **OK** |
| Local E2E phase3155 (milestone 7950 UI) | done | `e2e-phase3155.sh` **OK** |
| Local E2E phase3156 (STATUS milestone 7950) | done | `e2e-phase3156.sh` **OK** |
| Local E2E phase3157 (marker 3160) | done | `e2e-phase3157.sh` **OK** |
| Local E2E phase3158 (typecheck) | done | `e2e-phase3158.sh` **OK** |
| Local E2E phase3159 (e2e-all + gaps) | done | `e2e-phase3159.sh` **OK** |
| Local E2E phase3160 (STATUS soft-complete) | done | `e2e-phase3160.sh` **OK** |
| Local E2E phase3161 (Soft 3160+ surface) | done | `e2e-phase3161.sh` **OK** |
| Local E2E phase3162 (UI Soft 3160+) | done | `e2e-phase3162.sh` **OK** |
| Local E2E phase3163 (client Soft 3160+) | done | `e2e-phase3163.sh` **OK** |
| Local E2E phase3164 (STATUS Soft 3160+) | done | `e2e-phase3164.sh` **OK** |
| Local E2E phase3165 (marker 3168) | done | `e2e-phase3165.sh` **OK** |
| Local E2E phase3166 (typecheck) | done | `e2e-phase3166.sh` **OK** |
| Local E2E phase3167 (e2e-all + gaps) | done | `e2e-phase3167.sh` **OK** |
| Local E2E phase3168 (STATUS soft-complete) | done | `e2e-phase3168.sh` **OK** |
| Local E2E phase3169 (milestone 8000) | done | `e2e-phase3169.sh` **OK** |
| Local E2E phase3170 (milestone 8000 endpoints) | done | `e2e-phase3170.sh` **OK** |
| Local E2E phase3171 (milestone 8000 UI) | done | `e2e-phase3171.sh` **OK** |
| Local E2E phase3172 (STATUS milestone 8000) | done | `e2e-phase3172.sh` **OK** |
| Local E2E phase3173 (marker 3176) | done | `e2e-phase3173.sh` **OK** |
| Local E2E phase3174 (typecheck) | done | `e2e-phase3174.sh` **OK** |
| Local E2E phase3175 (e2e-all + gaps) | done | `e2e-phase3175.sh` **OK** |
| Local E2E phase3176 (STATUS soft-complete) | done | `e2e-phase3176.sh` **OK** |
| Local E2E phase3177 (layout fidelity sample field roster) | done | `e2e-phase3177.sh` **OK** |
| Local E2E phase3178 (UI layout fidelity sample field) | done | `e2e-phase3178.sh` **OK** |
| Local E2E phase3179 (client layout fidelity sample field) | done | `e2e-phase3179.sh` **OK** |
| Local E2E phase3180 (STATUS layout fidelity sample field) | done | `e2e-phase3180.sh` **OK** |
| Local E2E phase3181 (marker 3184) | done | `e2e-phase3181.sh` **OK** |
| Local E2E phase3182 (typecheck) | done | `e2e-phase3182.sh` **OK** |
| Local E2E phase3183 (e2e-all + gaps) | done | `e2e-phase3183.sh` **OK** |
| Local E2E phase3184 (STATUS soft-complete) | done | `e2e-phase3184.sh` **OK** |
| Local E2E phase3185 (milestone 8050) | done | `e2e-phase3185.sh` **OK** |
| Local E2E phase3186 (milestone 8050 endpoints) | done | `e2e-phase3186.sh` **OK** |
| Local E2E phase3187 (milestone 8050 UI) | done | `e2e-phase3187.sh` **OK** |
| Local E2E phase3188 (STATUS milestone 8050) | done | `e2e-phase3188.sh` **OK** |
| Local E2E phase3189 (marker 3192) | done | `e2e-phase3189.sh` **OK** |
| Local E2E phase3190 (typecheck) | done | `e2e-phase3190.sh` **OK** |
| Local E2E phase3191 (e2e-all + gaps) | done | `e2e-phase3191.sh` **OK** |
| Local E2E phase3192 (STATUS soft-complete) | done | `e2e-phase3192.sh` **OK** |
| Local E2E phase3193 (layout sample field export/bundle) | done | `e2e-phase3193.sh` **OK** |
| Local E2E phase3194 (UI layout sample field bundle) | done | `e2e-phase3194.sh` **OK** |
| Local E2E phase3195 (layout sample field titles/notes) | done | `e2e-phase3195.sh` **OK** |
| Local E2E phase3196 (STATUS layout sample field export) | done | `e2e-phase3196.sh` **OK** |
| Local E2E phase3197 (marker 3200) | done | `e2e-phase3197.sh` **OK** |
| Local E2E phase3198 (typecheck) | done | `e2e-phase3198.sh` **OK** |
| Local E2E phase3199 (e2e-all + gaps) | done | `e2e-phase3199.sh` **OK** |
| Local E2E phase3200 (STATUS soft-complete) | done | `e2e-phase3200.sh` **OK** |
| Local E2E phase3201 (milestone 8100) | done | `e2e-phase3201.sh` **OK** |
| Local E2E phase3202 (milestone 8100 endpoints) | done | `e2e-phase3202.sh` **OK** |
| Local E2E phase3203 (milestone 8100 UI) | done | `e2e-phase3203.sh` **OK** |
| Local E2E phase3204 (STATUS milestone 8100) | done | `e2e-phase3204.sh` **OK** |
| Local E2E phase3205 (marker 3208) | done | `e2e-phase3205.sh` **OK** |
| Local E2E phase3206 (typecheck) | done | `e2e-phase3206.sh` **OK** |
| Local E2E phase3207 (e2e-all + gaps) | done | `e2e-phase3207.sh` **OK** |
| Local E2E phase3208 (STATUS soft-complete) | done | `e2e-phase3208.sh` **OK** |
| Local E2E phase3209 (schema 3.0) | done | `e2e-phase3209.sh` **OK** |
| Local E2E phase3210 (UI schema 3.0) | done | `e2e-phase3210.sh` **OK** |
| Local E2E phase3211 (client schema/layout_fidelity_sample_field) | done | `e2e-phase3211.sh` **OK** |
| Local E2E phase3212 (STATUS schema 3.0) | done | `e2e-phase3212.sh` **OK** |
| Local E2E phase3213 (marker 3216) | done | `e2e-phase3213.sh` **OK** |
| Local E2E phase3214 (typecheck) | done | `e2e-phase3214.sh` **OK** |
| Local E2E phase3215 (e2e-all + gaps) | done | `e2e-phase3215.sh` **OK** |
| Local E2E phase3216 (STATUS soft-complete) | done | `e2e-phase3216.sh` **OK** |
| Local E2E phase3217 (milestone 8150) | done | `e2e-phase3217.sh` **OK** |
| Local E2E phase3218 (milestone 8150 endpoints) | done | `e2e-phase3218.sh` **OK** |
| Local E2E phase3219 (milestone 8150 UI) | done | `e2e-phase3219.sh` **OK** |
| Local E2E phase3220 (STATUS milestone 8150) | done | `e2e-phase3220.sh` **OK** |
| Local E2E phase3221 (marker 3224) | done | `e2e-phase3221.sh` **OK** |
| Local E2E phase3222 (typecheck) | done | `e2e-phase3222.sh` **OK** |
| Local E2E phase3223 (e2e-all + gaps) | done | `e2e-phase3223.sh` **OK** |
| Local E2E phase3224 (STATUS soft-complete) | done | `e2e-phase3224.sh` **OK** |
| Local E2E phase3225 (sample_field sessionStorage) | done | `e2e-phase3225.sh` **OK** |
| Local E2E phase3226 (UI sample_field session) | done | `e2e-phase3226.sh` **OK** |
| Local E2E phase3227 (clear sample_field) | done | `e2e-phase3227.sh` **OK** |
| Local E2E phase3228 (STATUS sample_field session) | done | `e2e-phase3228.sh` **OK** |
| Local E2E phase3229 (marker 3232) | done | `e2e-phase3229.sh` **OK** |
| Local E2E phase3230 (typecheck) | done | `e2e-phase3230.sh` **OK** |
| Local E2E phase3231 (e2e-all + gaps) | done | `e2e-phase3231.sh` **OK** |
| Local E2E phase3232 (STATUS soft-complete) | done | `e2e-phase3232.sh` **OK** |
| Local E2E phase3233 (milestone 8200) | done | `e2e-phase3233.sh` **OK** |
| Local E2E phase3234 (milestone 8200 endpoints) | done | `e2e-phase3234.sh` **OK** |
| Local E2E phase3235 (milestone 8200 UI) | done | `e2e-phase3235.sh` **OK** |
| Local E2E phase3236 (STATUS milestone 8200) | done | `e2e-phase3236.sh` **OK** |
| Local E2E phase3237 (marker 3240) | done | `e2e-phase3237.sh` **OK** |
| Local E2E phase3238 (typecheck) | done | `e2e-phase3238.sh` **OK** |
| Local E2E phase3239 (e2e-all + gaps) | done | `e2e-phase3239.sh` **OK** |
| Local E2E phase3240 (STATUS soft-complete) | done | `e2e-phase3240.sh` **OK** |
| Local E2E phase3241 (Soft 3240+ surface) | done | `e2e-phase3241.sh` **OK** |
| Local E2E phase3242 (UI Soft 3240+) | done | `e2e-phase3242.sh` **OK** |
| Local E2E phase3243 (client Soft 3240+) | done | `e2e-phase3243.sh` **OK** |
| Local E2E phase3244 (STATUS Soft 3240+) | done | `e2e-phase3244.sh` **OK** |
| Local E2E phase3245 (marker 3248) | done | `e2e-phase3245.sh` **OK** |
| Local E2E phase3246 (typecheck) | done | `e2e-phase3246.sh` **OK** |
| Local E2E phase3247 (e2e-all + gaps) | done | `e2e-phase3247.sh` **OK** |
| Local E2E phase3248 (STATUS soft-complete) | done | `e2e-phase3248.sh` **OK** |
| Local E2E phase3249 (milestone 8250) | done | `e2e-phase3249.sh` **OK** |
| Local E2E phase3250 (milestone 8250 endpoints) | done | `e2e-phase3250.sh` **OK** |
| Local E2E phase3251 (milestone 8250 UI) | done | `e2e-phase3251.sh` **OK** |
| Local E2E phase3252 (STATUS milestone 8250) | done | `e2e-phase3252.sh` **OK** |
| Local E2E phase3253 (marker 3256) | done | `e2e-phase3253.sh` **OK** |
| Local E2E phase3254 (typecheck) | done | `e2e-phase3254.sh` **OK** |
| Local E2E phase3255 (e2e-all + gaps) | done | `e2e-phase3255.sh` **OK** |
| Local E2E phase3256 (STATUS soft-complete) | done | `e2e-phase3256.sh` **OK** |
| Local E2E phase3257 (catalog_summary_roster API) | done | `e2e-phase3257.sh` **OK** |
| Local E2E phase3258 (UI catalog_summary_roster) | done | `e2e-phase3258.sh` **OK** |
| Local E2E phase3259 (client catalog_summary_roster) | done | `e2e-phase3259.sh` **OK** |
| Local E2E phase3260 (STATUS catalog_summary_roster) | done | `e2e-phase3260.sh` **OK** |
| Local E2E phase3261 (marker 3264) | done | `e2e-phase3261.sh` **OK** |
| Local E2E phase3262 (typecheck) | done | `e2e-phase3262.sh` **OK** |
| Local E2E phase3263 (e2e-all + gaps) | done | `e2e-phase3263.sh` **OK** |
| Local E2E phase3264 (STATUS soft-complete) | done | `e2e-phase3264.sh` **OK** |
| Local E2E phase3265 (milestone 8300) | done | `e2e-phase3265.sh` **OK** |
| Local E2E phase3266 (milestone 8300 endpoints) | done | `e2e-phase3266.sh` **OK** |
| Local E2E phase3267 (milestone 8300 UI) | done | `e2e-phase3267.sh` **OK** |
| Local E2E phase3268 (STATUS milestone 8300) | done | `e2e-phase3268.sh` **OK** |
| Local E2E phase3269 (marker 3272) | done | `e2e-phase3269.sh` **OK** |
| Local E2E phase3270 (typecheck) | done | `e2e-phase3270.sh` **OK** |
| Local E2E phase3271 (e2e-all + gaps) | done | `e2e-phase3271.sh` **OK** |
| Local E2E phase3272 (STATUS soft-complete) | done | `e2e-phase3272.sh` **OK** |
| Local E2E phase3273 (catalog_summary_roster export) | done | `e2e-phase3273.sh` **OK** |
| Local E2E phase3274 (UI catalog_summary_roster bundle) | done | `e2e-phase3274.sh` **OK** |
| Local E2E phase3275 (export titles/notes) | done | `e2e-phase3275.sh` **OK** |
| Local E2E phase3276 (STATUS export) | done | `e2e-phase3276.sh` **OK** |
| Local E2E phase3277 (marker 3280) | done | `e2e-phase3277.sh` **OK** |
| Local E2E phase3278 (typecheck) | done | `e2e-phase3278.sh` **OK** |
| Local E2E phase3279 (e2e-all + gaps) | done | `e2e-phase3279.sh` **OK** |
| Local E2E phase3280 (STATUS soft-complete) | done | `e2e-phase3280.sh` **OK** |
| Local E2E phase3281 (milestone 8350) | done | `e2e-phase3281.sh` **OK** |
| Local E2E phase3282 (milestone 8350 endpoints) | done | `e2e-phase3282.sh` **OK** |
| Local E2E phase3283 (milestone 8350 UI) | done | `e2e-phase3283.sh` **OK** |
| Local E2E phase3284 (STATUS milestone 8350) | done | `e2e-phase3284.sh` **OK** |
| Local E2E phase3285 (marker 3288) | done | `e2e-phase3285.sh` **OK** |
| Local E2E phase3286 (typecheck) | done | `e2e-phase3286.sh` **OK** |
| Local E2E phase3287 (e2e-all + gaps) | done | `e2e-phase3287.sh` **OK** |
| Local E2E phase3288 (STATUS soft-complete) | done | `e2e-phase3288.sh` **OK** |
| Local E2E phase3289 (schema 3.1) | done | `e2e-phase3289.sh` **OK** |
| Local E2E phase3290 (UI schema 3.1) | done | `e2e-phase3290.sh` **OK** |
| Local E2E phase3291 (client schema/catalog_summary) | done | `e2e-phase3291.sh` **OK** |
| Local E2E phase3292 (STATUS schema 3.1) | done | `e2e-phase3292.sh` **OK** |
| Local E2E phase3293 (marker 3296) | done | `e2e-phase3293.sh` **OK** |
| Local E2E phase3294 (typecheck) | done | `e2e-phase3294.sh` **OK** |
| Local E2E phase3295 (e2e-all + gaps) | done | `e2e-phase3295.sh` **OK** |
| Local E2E phase3296 (STATUS soft-complete) | done | `e2e-phase3296.sh` **OK** |
| Local E2E phase3297 (milestone 8400) | done | `e2e-phase3297.sh` **OK** |
| Local E2E phase3298 (milestone 8400 endpoints) | done | `e2e-phase3298.sh` **OK** |
| Local E2E phase3299 (milestone 8400 UI) | done | `e2e-phase3299.sh` **OK** |
| Local E2E phase3300 (STATUS milestone 8400) | done | `e2e-phase3300.sh` **OK** |
| Local E2E phase3301 (marker 3304) | done | `e2e-phase3301.sh` **OK** |
| Local E2E phase3302 (typecheck) | done | `e2e-phase3302.sh` **OK** |
| Local E2E phase3303 (e2e-all + gaps) | done | `e2e-phase3303.sh` **OK** |
| Local E2E phase3304 (STATUS soft-complete) | done | `e2e-phase3304.sh` **OK** |
| Local E2E phase3305 (catalog_summary sessionStorage) | done | `e2e-phase3305.sh` **OK** |
| Local E2E phase3306 (UI catalog_summary session) | done | `e2e-phase3306.sh` **OK** |
| Local E2E phase3307 (clear catalog_summary) | done | `e2e-phase3307.sh` **OK** |
| Local E2E phase3308 (STATUS catalog_summary session) | done | `e2e-phase3308.sh` **OK** |
| Local E2E phase3309 (marker 3312) | done | `e2e-phase3309.sh` **OK** |
| Local E2E phase3310 (typecheck) | done | `e2e-phase3310.sh` **OK** |
| Local E2E phase3311 (e2e-all + gaps) | done | `e2e-phase3311.sh` **OK** |
| Local E2E phase3312 (STATUS soft-complete) | done | `e2e-phase3312.sh` **OK** |
| Local E2E phase3313 (milestone 8450) | done | `e2e-phase3313.sh` **OK** |
| Local E2E phase3314 (milestone 8450 endpoints) | done | `e2e-phase3314.sh` **OK** |
| Local E2E phase3315 (milestone 8450 UI) | done | `e2e-phase3315.sh` **OK** |
| Local E2E phase3316 (STATUS milestone 8450) | done | `e2e-phase3316.sh` **OK** |
| Local E2E phase3317 (marker 3320) | done | `e2e-phase3317.sh` **OK** |
| Local E2E phase3318 (typecheck) | done | `e2e-phase3318.sh` **OK** |
| Local E2E phase3319 (e2e-all + gaps) | done | `e2e-phase3319.sh` **OK** |
| Local E2E phase3320 (STATUS soft-complete) | done | `e2e-phase3320.sh` **OK** |
| Local E2E phase3321 (Soft 3320+ surface) | done | `e2e-phase3321.sh` **OK** |
| Local E2E phase3322 (UI Soft 3320+) | done | `e2e-phase3322.sh` **OK** |
| Local E2E phase3323 (client Soft 3320+) | done | `e2e-phase3323.sh` **OK** |
| Local E2E phase3324 (STATUS Soft 3320+) | done | `e2e-phase3324.sh` **OK** |
| Local E2E phase3325 (marker 3328) | done | `e2e-phase3325.sh` **OK** |
| Local E2E phase3326 (typecheck) | done | `e2e-phase3326.sh` **OK** |
| Local E2E phase3327 (e2e-all + gaps) | done | `e2e-phase3327.sh` **OK** |
| Local E2E phase3328 (STATUS soft-complete) | done | `e2e-phase3328.sh` **OK** |
| Local E2E phase3329 (milestone 8500) | done | `e2e-phase3329.sh` **OK** |
| Local E2E phase3330 (milestone 8500 endpoints) | done | `e2e-phase3330.sh` **OK** |
| Local E2E phase3331 (milestone 8500 UI) | done | `e2e-phase3331.sh` **OK** |
| Local E2E phase3332 (STATUS milestone 8500) | done | `e2e-phase3332.sh` **OK** |
| Local E2E phase3333 (marker 3336) | done | `e2e-phase3333.sh` **OK** |
| Local E2E phase3334 (typecheck) | done | `e2e-phase3334.sh` **OK** |
| Local E2E phase3335 (e2e-all + gaps) | done | `e2e-phase3335.sh` **OK** |
| Local E2E phase3336 (STATUS soft-complete) | done | `e2e-phase3336.sh` **OK** |
| Local E2E phase3337 (honesty_readiness_roster API) | done | `e2e-phase3337.sh` **OK** |
| Local E2E phase3338 (UI honesty_readiness_roster) | done | `e2e-phase3338.sh` **OK** |
| Local E2E phase3339 (client honesty_readiness_roster) | done | `e2e-phase3339.sh` **OK** |
| Local E2E phase3340 (STATUS honesty_readiness_roster) | done | `e2e-phase3340.sh` **OK** |
| Local E2E phase3341 (marker 3344) | done | `e2e-phase3341.sh` **OK** |
| Local E2E phase3342 (typecheck) | done | `e2e-phase3342.sh` **OK** |
| Local E2E phase3343 (e2e-all + gaps) | done | `e2e-phase3343.sh` **OK** |
| Local E2E phase3344 (STATUS soft-complete) | done | `e2e-phase3344.sh` **OK** |
| Local E2E phase3345 (milestone 8550) | done | `e2e-phase3345.sh` **OK** |
| Local E2E phase3346 (milestone 8550 endpoints) | done | `e2e-phase3346.sh` **OK** |
| Local E2E phase3347 (milestone 8550 UI) | done | `e2e-phase3347.sh` **OK** |
| Local E2E phase3348 (STATUS milestone 8550) | done | `e2e-phase3348.sh` **OK** |
| Local E2E phase3349 (marker 3352) | done | `e2e-phase3349.sh` **OK** |
| Local E2E phase3350 (typecheck) | done | `e2e-phase3350.sh` **OK** |
| Local E2E phase3351 (e2e-all + gaps) | done | `e2e-phase3351.sh` **OK** |
| Local E2E phase3352 (STATUS soft-complete) | done | `e2e-phase3352.sh` **OK** |
| Local E2E phase3353 (honesty_readiness export) | done | `e2e-phase3353.sh` **OK** |
| Local E2E phase3354 (UI honesty_readiness bundle) | done | `e2e-phase3354.sh` **OK** |
| Local E2E phase3355 (export titles/notes) | done | `e2e-phase3355.sh` **OK** |
| Local E2E phase3356 (STATUS export) | done | `e2e-phase3356.sh` **OK** |
| Local E2E phase3357 (marker 3360) | done | `e2e-phase3357.sh` **OK** |
| Local E2E phase3358 (typecheck) | done | `e2e-phase3358.sh` **OK** |
| Local E2E phase3359 (e2e-all + gaps) | done | `e2e-phase3359.sh` **OK** |
| Local E2E phase3360 (STATUS soft-complete) | done | `e2e-phase3360.sh` **OK** |
| Local E2E phase3361 (milestone 8600) | done | `e2e-phase3361.sh` **OK** |
| Local E2E phase3362 (milestone 8600 endpoints) | done | `e2e-phase3362.sh` **OK** |
| Local E2E phase3363 (milestone 8600 UI) | done | `e2e-phase3363.sh` **OK** |
| Local E2E phase3364 (STATUS milestone 8600) | done | `e2e-phase3364.sh` **OK** |
| Local E2E phase3365 (marker 3368) | done | `e2e-phase3365.sh` **OK** |
| Local E2E phase3366 (typecheck) | done | `e2e-phase3366.sh` **OK** |
| Local E2E phase3367 (e2e-all + gaps) | done | `e2e-phase3367.sh` **OK** |
| Local E2E phase3368 (STATUS soft-complete) | done | `e2e-phase3368.sh` **OK** |
| Local E2E phase3369 (schema 3.2) | done | `e2e-phase3369.sh` **OK** |
| Local E2E phase3370 (UI schema 3.2) | done | `e2e-phase3370.sh` **OK** |
| Local E2E phase3371 (client schema/readiness) | done | `e2e-phase3371.sh` **OK** |
| Local E2E phase3372 (STATUS schema 3.2) | done | `e2e-phase3372.sh` **OK** |
| Local E2E phase3373 (marker 3376) | done | `e2e-phase3373.sh` **OK** |
| Local E2E phase3374 (typecheck) | done | `e2e-phase3374.sh` **OK** |
| Local E2E phase3375 (e2e-all + gaps) | done | `e2e-phase3375.sh` **OK** |
| Local E2E phase3376 (STATUS soft-complete) | done | `e2e-phase3376.sh` **OK** |
| Local E2E phase3377 (milestone 8650) | done | `e2e-phase3377.sh` **OK** |
| Local E2E phase3378 (milestone 8650 endpoints) | done | `e2e-phase3378.sh` **OK** |
| Local E2E phase3379 (milestone 8650 UI) | done | `e2e-phase3379.sh` **OK** |
| Local E2E phase3380 (STATUS milestone 8650) | done | `e2e-phase3380.sh` **OK** |
| Local E2E phase3381 (marker 3384) | done | `e2e-phase3381.sh` **OK** |
| Local E2E phase3382 (typecheck) | done | `e2e-phase3382.sh` **OK** |
| Local E2E phase3383 (e2e-all + gaps) | done | `e2e-phase3383.sh` **OK** |
| Local E2E phase3384 (STATUS soft-complete) | done | `e2e-phase3384.sh` **OK** |
| Local E2E phase3385 (honesty_readiness sessionStorage) | done | `e2e-phase3385.sh` **OK** |
| Local E2E phase3386 (UI honesty_readiness session) | done | `e2e-phase3386.sh` **OK** |
| Local E2E phase3387 (clear honesty_readiness) | done | `e2e-phase3387.sh` **OK** |
| Local E2E phase3388 (STATUS honesty_readiness session) | done | `e2e-phase3388.sh` **OK** |
| Local E2E phase3389 (marker 3392) | done | `e2e-phase3389.sh` **OK** |
| Local E2E phase3390 (typecheck) | done | `e2e-phase3390.sh` **OK** |
| Local E2E phase3391 (e2e-all + gaps) | done | `e2e-phase3391.sh` **OK** |
| Local E2E phase3392 (STATUS soft-complete) | done | `e2e-phase3392.sh` **OK** |
| Local E2E phase3393 (milestone 8700) | done | `e2e-phase3393.sh` **OK** |
| Local E2E phase3394 (milestone 8700 endpoints) | done | `e2e-phase3394.sh` **OK** |
| Local E2E phase3395 (milestone 8700 UI) | done | `e2e-phase3395.sh` **OK** |
| Local E2E phase3396 (STATUS milestone 8700) | done | `e2e-phase3396.sh` **OK** |
| Local E2E phase3397 (marker 3400) | done | `e2e-phase3397.sh` **OK** |
| Local E2E phase3398 (typecheck) | done | `e2e-phase3398.sh` **OK** |
| Local E2E phase3399 (e2e-all + gaps) | done | `e2e-phase3399.sh` **OK** |
| Local E2E phase3400 (STATUS soft-complete) | done | `e2e-phase3400.sh` **OK** |
| Local E2E phase3401 (Soft 3400+ surface) | done | `e2e-phase3401.sh` **OK** |
| Local E2E phase3402 (UI Soft 3400+) | done | `e2e-phase3402.sh` **OK** |
| Local E2E phase3403 (client Soft 3400+) | done | `e2e-phase3403.sh` **OK** |
| Local E2E phase3404 (STATUS Soft 3400+) | done | `e2e-phase3404.sh` **OK** |
| Local E2E phase3405 (marker 3408) | done | `e2e-phase3405.sh` **OK** |
| Local E2E phase3406 (typecheck) | done | `e2e-phase3406.sh` **OK** |
| Local E2E phase3407 (e2e-all + gaps) | done | `e2e-phase3407.sh` **OK** |
| Local E2E phase3408 (STATUS soft-complete) | done | `e2e-phase3408.sh` **OK** |
| Local E2E phase3409 (milestone 8750) | done | `e2e-phase3409.sh` **OK** |
| Local E2E phase3410 (milestone 8750 endpoints) | done | `e2e-phase3410.sh` **OK** |
| Local E2E phase3411 (milestone 8750 UI) | done | `e2e-phase3411.sh` **OK** |
| Local E2E phase3412 (STATUS milestone 8750) | done | `e2e-phase3412.sh` **OK** |
| Local E2E phase3413 (marker 3416) | done | `e2e-phase3413.sh` **OK** |
| Local E2E phase3414 (typecheck) | done | `e2e-phase3414.sh` **OK** |
| Local E2E phase3415 (e2e-all + gaps) | done | `e2e-phase3415.sh` **OK** |
| Local E2E phase3416 (STATUS soft-complete) | done | `e2e-phase3416.sh` **OK** |
| Local E2E phase3417 (session_storage_clear_roster API) | done | `e2e-phase3417.sh` **OK** |
| Local E2E phase3418 (UI session_storage_clear_roster) | done | `e2e-phase3418.sh` **OK** |
| Local E2E phase3419 (client session_storage_clear_roster) | done | `e2e-phase3419.sh` **OK** |
| Local E2E phase3420 (STATUS session_storage_clear_roster) | done | `e2e-phase3420.sh` **OK** |
| Local E2E phase3421 (marker 3424) | done | `e2e-phase3421.sh` **OK** |
| Local E2E phase3422 (typecheck) | done | `e2e-phase3422.sh` **OK** |
| Local E2E phase3423 (e2e-all + gaps) | done | `e2e-phase3423.sh` **OK** |
| Local E2E phase3424 (STATUS soft-complete) | done | `e2e-phase3424.sh` **OK** |
| Local E2E phase3425 (milestone 8800) | done | `e2e-phase3425.sh` **OK** |
| Local E2E phase3426 (milestone 8800 endpoints) | done | `e2e-phase3426.sh` **OK** |
| Local E2E phase3427 (milestone 8800 UI) | done | `e2e-phase3427.sh` **OK** |
| Local E2E phase3428 (STATUS milestone 8800) | done | `e2e-phase3428.sh` **OK** |
| Local E2E phase3429 (marker 3432) | done | `e2e-phase3429.sh` **OK** |
| Local E2E phase3430 (typecheck) | done | `e2e-phase3430.sh` **OK** |
| Local E2E phase3431 (e2e-all + gaps) | done | `e2e-phase3431.sh` **OK** |
| Local E2E phase3432 (STATUS soft-complete) | done | `e2e-phase3432.sh` **OK** |
| Local E2E phase3433 (session_storage_clear export) | done | `e2e-phase3433.sh` **OK** |
| Local E2E phase3434 (UI session_storage_clear bundle) | done | `e2e-phase3434.sh` **OK** |
| Local E2E phase3435 (session_storage_clear titles/notes) | done | `e2e-phase3435.sh` **OK** |
| Local E2E phase3436 (STATUS session_storage_clear export) | done | `e2e-phase3436.sh` **OK** |
| Local E2E phase3437 (marker 3440) | done | `e2e-phase3437.sh` **OK** |
| Local E2E phase3438 (typecheck) | done | `e2e-phase3438.sh` **OK** |
| Local E2E phase3439 (e2e-all + gaps) | done | `e2e-phase3439.sh` **OK** |
| Local E2E phase3440 (STATUS soft-complete) | done | `e2e-phase3440.sh` **OK** |
| Local E2E phase3441 (milestone 8850) | done | `e2e-phase3441.sh` **OK** |
| Local E2E phase3442 (milestone 8850 endpoints) | done | `e2e-phase3442.sh` **OK** |
| Local E2E phase3443 (milestone 8850 UI) | done | `e2e-phase3443.sh` **OK** |
| Local E2E phase3444 (STATUS milestone 8850) | done | `e2e-phase3444.sh` **OK** |
| Local E2E phase3445 (marker 3448) | done | `e2e-phase3445.sh` **OK** |
| Local E2E phase3446 (typecheck) | done | `e2e-phase3446.sh` **OK** |
| Local E2E phase3447 (e2e-all + gaps) | done | `e2e-phase3447.sh` **OK** |
| Local E2E phase3448 (STATUS soft-complete) | done | `e2e-phase3448.sh` **OK** |
| Local E2E phase3449 (schema 3.3) | done | `e2e-phase3449.sh` **OK** |
| Local E2E phase3450 (UI schema 3.3) | done | `e2e-phase3450.sh` **OK** |
| Local E2E phase3451 (client schema 3.3) | done | `e2e-phase3451.sh` **OK** |
| Local E2E phase3452 (STATUS schema 3.3) | done | `e2e-phase3452.sh` **OK** |
| Local E2E phase3453 (marker 3456) | done | `e2e-phase3453.sh` **OK** |
| Local E2E phase3454 (typecheck) | done | `e2e-phase3454.sh` **OK** |
| Local E2E phase3455 (e2e-all + gaps) | done | `e2e-phase3455.sh` **OK** |
| Local E2E phase3456 (STATUS soft-complete) | done | `e2e-phase3456.sh` **OK** |
| Local E2E phase3457 (milestone 8900) | done | `e2e-phase3457.sh` **OK** |
| Local E2E phase3458 (milestone 8900 endpoints) | done | `e2e-phase3458.sh` **OK** |
| Local E2E phase3459 (milestone 8900 UI) | done | `e2e-phase3459.sh` **OK** |
| Local E2E phase3460 (STATUS milestone 8900) | done | `e2e-phase3460.sh` **OK** |
| Local E2E phase3461 (marker 3464) | done | `e2e-phase3461.sh` **OK** |
| Local E2E phase3462 (typecheck) | done | `e2e-phase3462.sh` **OK** |
| Local E2E phase3463 (e2e-all + gaps) | done | `e2e-phase3463.sh` **OK** |
| Local E2E phase3464 (STATUS soft-complete) | done | `e2e-phase3464.sh` **OK** |
| Local E2E phase3465 (session_storage_clear sessionStorage) | done | `e2e-phase3465.sh` **OK** |
| Local E2E phase3466 (UI session_storage_clear session) | done | `e2e-phase3466.sh` **OK** |
| Local E2E phase3467 (clear session_storage_clear) | done | `e2e-phase3467.sh` **OK** |
| Local E2E phase3468 (STATUS session_storage_clear session) | done | `e2e-phase3468.sh` **OK** |
| Local E2E phase3469 (marker 3472) | done | `e2e-phase3469.sh` **OK** |
| Local E2E phase3470 (typecheck) | done | `e2e-phase3470.sh` **OK** |
| Local E2E phase3471 (e2e-all + gaps) | done | `e2e-phase3471.sh` **OK** |
| Local E2E phase3472 (STATUS soft-complete) | done | `e2e-phase3472.sh` **OK** |
| Local E2E phase3473 (milestone 8950) | done | `e2e-phase3473.sh` **OK** |
| Local E2E phase3474 (milestone 8950 endpoints) | done | `e2e-phase3474.sh` **OK** |
| Local E2E phase3475 (milestone 8950 UI) | done | `e2e-phase3475.sh` **OK** |
| Local E2E phase3476 (STATUS milestone 8950) | done | `e2e-phase3476.sh` **OK** |
| Local E2E phase3477 (marker 3480) | done | `e2e-phase3477.sh` **OK** |
| Local E2E phase3478 (typecheck) | done | `e2e-phase3478.sh` **OK** |
| Local E2E phase3479 (e2e-all + gaps) | done | `e2e-phase3479.sh` **OK** |
| Local E2E phase3480 (STATUS soft-complete) | done | `e2e-phase3480.sh` **OK** |
| Local E2E phase3481 (Soft 3480+ surface) | done | `e2e-phase3481.sh` **OK** |
| Local E2E phase3482 (UI Soft 3480+) | done | `e2e-phase3482.sh` **OK** |
| Local E2E phase3483 (client Soft 3480+) | done | `e2e-phase3483.sh` **OK** |
| Local E2E phase3484 (STATUS Soft 3480+) | done | `e2e-phase3484.sh` **OK** |
| Local E2E phase3485 (marker 3488) | done | `e2e-phase3485.sh` **OK** |
| Local E2E phase3486 (typecheck) | done | `e2e-phase3486.sh` **OK** |
| Local E2E phase3487 (e2e-all + gaps) | done | `e2e-phase3487.sh` **OK** |
| Local E2E phase3488 (STATUS soft-complete) | done | `e2e-phase3488.sh` **OK** |
| Local E2E phase3489 (milestone 9000) | done | `e2e-phase3489.sh` **OK** |
| Local E2E phase3490 (milestone 9000 endpoints) | done | `e2e-phase3490.sh` **OK** |
| Local E2E phase3491 (milestone 9000 UI) | done | `e2e-phase3491.sh` **OK** |
| Local E2E phase3492 (STATUS milestone 9000) | done | `e2e-phase3492.sh` **OK** |
| Local E2E phase3493 (marker 3496) | done | `e2e-phase3493.sh` **OK** |
| Local E2E phase3494 (typecheck) | done | `e2e-phase3494.sh` **OK** |
| Local E2E phase3495 (e2e-all + gaps) | done | `e2e-phase3495.sh` **OK** |
| Local E2E phase3496 (STATUS soft-complete) | done | `e2e-phase3496.sh` **OK** |
| Local E2E phase3497 (honesty_operator_brief_roster API) | done | `e2e-phase3497.sh` **OK** |
| Local E2E phase3498 (UI honesty_operator_brief_roster) | done | `e2e-phase3498.sh` **OK** |
| Local E2E phase3499 (client honesty_operator_brief_roster) | done | `e2e-phase3499.sh` **OK** |
| Local E2E phase3500 (STATUS honesty_operator_brief_roster) | done | `e2e-phase3500.sh` **OK** |
| Local E2E phase3501 (marker 3504) | done | `e2e-phase3501.sh` **OK** |
| Local E2E phase3502 (typecheck) | done | `e2e-phase3502.sh` **OK** |
| Local E2E phase3503 (e2e-all + gaps) | done | `e2e-phase3503.sh` **OK** |
| Local E2E phase3504 (STATUS soft-complete) | done | `e2e-phase3504.sh` **OK** |
| Local E2E phase3505 (milestone 9050) | done | `e2e-phase3505.sh` **OK** |
| Local E2E phase3506 (milestone 9050 endpoints) | done | `e2e-phase3506.sh` **OK** |
| Local E2E phase3507 (milestone 9050 UI) | done | `e2e-phase3507.sh` **OK** |
| Local E2E phase3508 (STATUS milestone 9050) | done | `e2e-phase3508.sh` **OK** |
| Local E2E phase3509 (marker 3512) | done | `e2e-phase3509.sh` **OK** |
| Local E2E phase3510 (typecheck) | done | `e2e-phase3510.sh` **OK** |
| Local E2E phase3511 (e2e-all + gaps) | done | `e2e-phase3511.sh` **OK** |
| Local E2E phase3512 (STATUS soft-complete) | done | `e2e-phase3512.sh` **OK** |
| Local E2E phase3513 (honesty_operator_brief export) | done | `e2e-phase3513.sh` **OK** |
| Local E2E phase3514 (UI honesty_operator_brief bundle) | done | `e2e-phase3514.sh` **OK** |
| Local E2E phase3515 (honesty_operator_brief titles/notes) | done | `e2e-phase3515.sh` **OK** |
| Local E2E phase3516 (STATUS honesty_operator_brief export) | done | `e2e-phase3516.sh` **OK** |
| Local E2E phase3517 (marker 3520) | done | `e2e-phase3517.sh` **OK** |
| Local E2E phase3518 (typecheck) | done | `e2e-phase3518.sh` **OK** |
| Local E2E phase3519 (e2e-all + gaps) | done | `e2e-phase3519.sh` **OK** |
| Local E2E phase3520 (STATUS soft-complete) | done | `e2e-phase3520.sh` **OK** |
| Local E2E phase3521 (milestone 9100) | done | `e2e-phase3521.sh` **OK** |
| Local E2E phase3522 (milestone 9100 endpoints) | done | `e2e-phase3522.sh` **OK** |
| Local E2E phase3523 (milestone 9100 UI) | done | `e2e-phase3523.sh` **OK** |
| Local E2E phase3524 (STATUS milestone 9100) | done | `e2e-phase3524.sh` **OK** |
| Local E2E phase3525 (marker 3528) | done | `e2e-phase3525.sh` **OK** |
| Local E2E phase3526 (typecheck) | done | `e2e-phase3526.sh` **OK** |
| Local E2E phase3527 (e2e-all + gaps) | done | `e2e-phase3527.sh` **OK** |
| Local E2E phase3528 (STATUS soft-complete) | done | `e2e-phase3528.sh` **OK** |
| Local E2E phase3529 (schema 3.4) | done | `e2e-phase3529.sh` **OK** |
| Local E2E phase3530 (UI schema 3.4) | done | `e2e-phase3530.sh` **OK** |
| Local E2E phase3531 (client schema 3.4) | done | `e2e-phase3531.sh` **OK** |
| Local E2E phase3532 (STATUS schema 3.4) | done | `e2e-phase3532.sh` **OK** |
| Local E2E phase3533 (marker 3536) | done | `e2e-phase3533.sh` **OK** |
| Local E2E phase3534 (typecheck) | done | `e2e-phase3534.sh` **OK** |
| Local E2E phase3535 (e2e-all + gaps) | done | `e2e-phase3535.sh` **OK** |
| Local E2E phase3536 (STATUS soft-complete) | done | `e2e-phase3536.sh` **OK** |
| Local E2E phase3537 (milestone 9150) | done | `e2e-phase3537.sh` **OK** |
| Local E2E phase3538 (milestone 9150 endpoints) | done | `e2e-phase3538.sh` **OK** |
| Local E2E phase3539 (milestone 9150 UI) | done | `e2e-phase3539.sh` **OK** |
| Local E2E phase3540 (STATUS milestone 9150) | done | `e2e-phase3540.sh` **OK** |
| Local E2E phase3541 (marker 3544) | done | `e2e-phase3541.sh` **OK** |
| Local E2E phase3542 (typecheck) | done | `e2e-phase3542.sh` **OK** |
| Local E2E phase3543 (e2e-all + gaps) | done | `e2e-phase3543.sh` **OK** |
| Local E2E phase3544 (STATUS soft-complete) | done | `e2e-phase3544.sh` **OK** |
| Local E2E phase3545 (honesty_operator_brief sessionStorage) | done | `e2e-phase3545.sh` **OK** |
| Local E2E phase3546 (UI honesty_operator_brief session) | done | `e2e-phase3546.sh` **OK** |
| Local E2E phase3547 (clear honesty_operator_brief) | done | `e2e-phase3547.sh` **OK** |
| Local E2E phase3548 (STATUS honesty_operator_brief session) | done | `e2e-phase3548.sh` **OK** |
| Local E2E phase3549 (marker 3552) | done | `e2e-phase3549.sh` **OK** |
| Local E2E phase3550 (typecheck) | done | `e2e-phase3550.sh` **OK** |
| Local E2E phase3551 (e2e-all + gaps) | done | `e2e-phase3551.sh` **OK** |
| Local E2E phase3552 (STATUS soft-complete) | done | `e2e-phase3552.sh` **OK** |
| Local E2E phase3553 (milestone 9200) | done | `e2e-phase3553.sh` **OK** |
| Local E2E phase3554 (milestone 9200 endpoints) | done | `e2e-phase3554.sh` **OK** |
| Local E2E phase3555 (milestone 9200 UI) | done | `e2e-phase3555.sh` **OK** |
| Local E2E phase3556 (STATUS milestone 9200) | done | `e2e-phase3556.sh` **OK** |
| Local E2E phase3557 (marker 3560) | done | `e2e-phase3557.sh` **OK** |
| Local E2E phase3558 (typecheck) | done | `e2e-phase3558.sh` **OK** |
| Local E2E phase3559 (e2e-all + gaps) | done | `e2e-phase3559.sh` **OK** |
| Local E2E phase3560 (STATUS soft-complete) | done | `e2e-phase3560.sh` **OK** |
| Local E2E phase3561 (Soft 3560+ surface) | done | `e2e-phase3561.sh` **OK** |
| Local E2E phase3562 (UI Soft 3560+) | done | `e2e-phase3562.sh` **OK** |
| Local E2E phase3563 (client Soft 3560+) | done | `e2e-phase3563.sh` **OK** |
| Local E2E phase3564 (STATUS Soft 3560+) | done | `e2e-phase3564.sh` **OK** |
| Local E2E phase3565 (marker 3568) | done | `e2e-phase3565.sh` **OK** |
| Local E2E phase3566 (typecheck) | done | `e2e-phase3566.sh` **OK** |
| Local E2E phase3567 (e2e-all + gaps) | done | `e2e-phase3567.sh` **OK** |
| Local E2E phase3568 (STATUS soft-complete) | done | `e2e-phase3568.sh` **OK** |
| Local E2E phase3569 (milestone 9250) | done | `e2e-phase3569.sh` **OK** |
| Local E2E phase3570 (milestone 9250 endpoints) | done | `e2e-phase3570.sh` **OK** |
| Local E2E phase3571 (milestone 9250 UI) | done | `e2e-phase3571.sh` **OK** |
| Local E2E phase3572 (STATUS milestone 9250) | done | `e2e-phase3572.sh` **OK** |
| Local E2E phase3573 (marker 3576) | done | `e2e-phase3573.sh` **OK** |
| Local E2E phase3574 (typecheck) | done | `e2e-phase3574.sh` **OK** |
| Local E2E phase3575 (e2e-all + gaps) | done | `e2e-phase3575.sh` **OK** |
| Local E2E phase3576 (STATUS soft-complete) | done | `e2e-phase3576.sh` **OK** |
| Local E2E phase3577 (surface_changelog_meta_roster API) | done | `e2e-phase3577.sh` **OK** |
| Local E2E phase3578 (UI surface_changelog_meta_roster) | done | `e2e-phase3578.sh` **OK** |
| Local E2E phase3579 (client surface_changelog_meta_roster) | done | `e2e-phase3579.sh` **OK** |
| Local E2E phase3580 (STATUS surface_changelog_meta_roster) | done | `e2e-phase3580.sh` **OK** |
| Local E2E phase3581 (marker 3584) | done | `e2e-phase3581.sh` **OK** |
| Local E2E phase3582 (typecheck) | done | `e2e-phase3582.sh` **OK** |
| Local E2E phase3583 (e2e-all + gaps) | done | `e2e-phase3583.sh` **OK** |
| Local E2E phase3584 (STATUS soft-complete) | done | `e2e-phase3584.sh` **OK** |
| Local E2E phase3585 (milestone 9300) | done | `e2e-phase3585.sh` **OK** |
| Local E2E phase3586 (milestone 9300 endpoints) | done | `e2e-phase3586.sh` **OK** |
| Local E2E phase3587 (milestone 9300 UI) | done | `e2e-phase3587.sh` **OK** |
| Local E2E phase3588 (STATUS milestone 9300) | done | `e2e-phase3588.sh` **OK** |
| Local E2E phase3589 (marker 3592) | done | `e2e-phase3589.sh` **OK** |
| Local E2E phase3590 (typecheck) | done | `e2e-phase3590.sh` **OK** |
| Local E2E phase3591 (e2e-all + gaps) | done | `e2e-phase3591.sh` **OK** |
| Local E2E phase3592 (STATUS soft-complete) | done | `e2e-phase3592.sh` **OK** |
| Local E2E phase3593 (surface_changelog_meta export) | done | `e2e-phase3593.sh` **OK** |
| Local E2E phase3594 (UI surface_changelog_meta bundle) | done | `e2e-phase3594.sh` **OK** |
| Local E2E phase3595 (surface_changelog_meta titles/notes) | done | `e2e-phase3595.sh` **OK** |
| Local E2E phase3596 (STATUS surface_changelog_meta export) | done | `e2e-phase3596.sh` **OK** |
| Local E2E phase3597 (marker 3600) | done | `e2e-phase3597.sh` **OK** |
| Local E2E phase3598 (typecheck) | done | `e2e-phase3598.sh` **OK** |
| Local E2E phase3599 (e2e-all + gaps) | done | `e2e-phase3599.sh` **OK** |
| Local E2E phase3600 (STATUS soft-complete) | done | `e2e-phase3600.sh` **OK** |
| Local E2E phase3601 (milestone 9350) | done | `e2e-phase3601.sh` **OK** |
| Local E2E phase3602 (milestone 9350 endpoints) | done | `e2e-phase3602.sh` **OK** |
| Local E2E phase3603 (milestone 9350 UI) | done | `e2e-phase3603.sh` **OK** |
| Local E2E phase3604 (STATUS milestone 9350) | done | `e2e-phase3604.sh` **OK** |
| Local E2E phase3605 (marker 3608) | done | `e2e-phase3605.sh` **OK** |
| Local E2E phase3606 (typecheck) | done | `e2e-phase3606.sh` **OK** |
| Local E2E phase3607 (e2e-all + gaps) | done | `e2e-phase3607.sh` **OK** |
| Local E2E phase3608 (STATUS soft-complete) | done | `e2e-phase3608.sh` **OK** |
| Local E2E phase3609 (schema 3.5) | done | `e2e-phase3609.sh` **OK** |
| Local E2E phase3610 (UI schema 3.5) | done | `e2e-phase3610.sh` **OK** |
| Local E2E phase3611 (client schema 3.5) | done | `e2e-phase3611.sh` **OK** |
| Local E2E phase3612 (STATUS schema 3.5) | done | `e2e-phase3612.sh` **OK** |
| Local E2E phase3613 (marker 3616) | done | `e2e-phase3613.sh` **OK** |
| Local E2E phase3614 (typecheck) | done | `e2e-phase3614.sh` **OK** |
| Local E2E phase3615 (e2e-all + gaps) | done | `e2e-phase3615.sh` **OK** |
| Local E2E phase3616 (STATUS soft-complete) | done | `e2e-phase3616.sh` **OK** |
| Local E2E phase3617 (milestone 9400) | done | `e2e-phase3617.sh` **OK** |
| Local E2E phase3618 (milestone 9400 endpoints) | done | `e2e-phase3618.sh` **OK** |
| Local E2E phase3619 (milestone 9400 UI) | done | `e2e-phase3619.sh` **OK** |
| Local E2E phase3620 (STATUS milestone 9400) | done | `e2e-phase3620.sh` **OK** |
| Local E2E phase3621 (marker 3624) | done | `e2e-phase3621.sh` **OK** |
| Local E2E phase3622 (typecheck) | done | `e2e-phase3622.sh` **OK** |
| Local E2E phase3623 (e2e-all + gaps) | done | `e2e-phase3623.sh` **OK** |
| Local E2E phase3624 (STATUS soft-complete) | done | `e2e-phase3624.sh` **OK** |
| Local E2E phase3625 (surface_changelog_meta sessionStorage) | done | `e2e-phase3625.sh` **OK** |
| Local E2E phase3626 (UI surface_changelog_meta session) | done | `e2e-phase3626.sh` **OK** |
| Local E2E phase3627 (clear surface_changelog_meta) | done | `e2e-phase3627.sh` **OK** |
| Local E2E phase3628 (STATUS surface_changelog_meta session) | done | `e2e-phase3628.sh` **OK** |
| Local E2E phase3629 (marker 3632) | done | `e2e-phase3629.sh` **OK** |
| Local E2E phase3630 (typecheck) | done | `e2e-phase3630.sh` **OK** |
| Local E2E phase3631 (e2e-all + gaps) | done | `e2e-phase3631.sh` **OK** |
| Local E2E phase3632 (STATUS soft-complete) | done | `e2e-phase3632.sh` **OK** |
| Local E2E phase3633 (milestone 9450) | done | `e2e-phase3633.sh` **OK** |
| Local E2E phase3634 (milestone 9450 endpoints) | done | `e2e-phase3634.sh` **OK** |
| Local E2E phase3635 (milestone 9450 UI) | done | `e2e-phase3635.sh` **OK** |
| Local E2E phase3636 (STATUS milestone 9450) | done | `e2e-phase3636.sh` **OK** |
| Local E2E phase3637 (marker 3640) | done | `e2e-phase3637.sh` **OK** |
| Local E2E phase3638 (typecheck) | done | `e2e-phase3638.sh` **OK** |
| Local E2E phase3639 (e2e-all + gaps) | done | `e2e-phase3639.sh` **OK** |
| Local E2E phase3640 (STATUS soft-complete) | done | `e2e-phase3640.sh` **OK** |
| Local E2E phase3641 (Soft 3640+ surface) | done | `e2e-phase3641.sh` **OK** |
| Local E2E phase3642 (UI Soft 3640+) | done | `e2e-phase3642.sh` **OK** |
| Local E2E phase3643 (client Soft 3640+) | done | `e2e-phase3643.sh` **OK** |
| Local E2E phase3644 (STATUS Soft 3640+) | done | `e2e-phase3644.sh` **OK** |
| Local E2E phase3645 (marker 3648) | done | `e2e-phase3645.sh` **OK** |
| Local E2E phase3646 (typecheck) | done | `e2e-phase3646.sh` **OK** |
| Local E2E phase3647 (e2e-all + gaps) | done | `e2e-phase3647.sh` **OK** |
| Local E2E phase3648 (STATUS soft-complete) | done | `e2e-phase3648.sh` **OK** |
| Local E2E phase3649 (milestone 9500) | done | `e2e-phase3649.sh` **OK** |
| Local E2E phase3650 (milestone 9500 endpoints) | done | `e2e-phase3650.sh` **OK** |
| Local E2E phase3651 (milestone 9500 UI) | done | `e2e-phase3651.sh` **OK** |
| Local E2E phase3652 (STATUS milestone 9500) | done | `e2e-phase3652.sh` **OK** |
| Local E2E phase3653 (marker 3656) | done | `e2e-phase3653.sh` **OK** |
| Local E2E phase3654 (typecheck) | done | `e2e-phase3654.sh` **OK** |
| Local E2E phase3655 (e2e-all + gaps) | done | `e2e-phase3655.sh` **OK** |
| Local E2E phase3656 (STATUS soft-complete) | done | `e2e-phase3656.sh` **OK** |
| Local E2E phase3657 (hard_gaps_summary_roster API) | done | `e2e-phase3657.sh` **OK** |
| Local E2E phase3658 (UI hard_gaps_summary_roster) | done | `e2e-phase3658.sh` **OK** |
| Local E2E phase3659 (client hard_gaps_summary_roster) | done | `e2e-phase3659.sh` **OK** |
| Local E2E phase3660 (STATUS hard_gaps_summary_roster) | done | `e2e-phase3660.sh` **OK** |
| Local E2E phase3661 (marker 3664) | done | `e2e-phase3661.sh` **OK** |
| Local E2E phase3662 (typecheck) | done | `e2e-phase3662.sh` **OK** |
| Local E2E phase3663 (e2e-all + gaps) | done | `e2e-phase3663.sh` **OK** |
| Local E2E phase3664 (STATUS soft-complete) | done | `e2e-phase3664.sh` **OK** |
| Local E2E phase3665 (milestone 9550) | done | `e2e-phase3665.sh` **OK** |
| Local E2E phase3666 (milestone 9550 endpoints) | done | `e2e-phase3666.sh` **OK** |
| Local E2E phase3667 (milestone 9550 UI) | done | `e2e-phase3667.sh` **OK** |
| Local E2E phase3668 (STATUS milestone 9550) | done | `e2e-phase3668.sh` **OK** |
| Local E2E phase3669 (marker 3672) | done | `e2e-phase3669.sh` **OK** |
| Local E2E phase3670 (typecheck) | done | `e2e-phase3670.sh` **OK** |
| Local E2E phase3671 (e2e-all + gaps) | done | `e2e-phase3671.sh` **OK** |
| Local E2E phase3672 (STATUS soft-complete) | done | `e2e-phase3672.sh` **OK** |
| Local E2E phase3673 (hard_gaps_summary export) | done | `e2e-phase3673.sh` **OK** |
| Local E2E phase3674 (UI hard_gaps_summary bundle) | done | `e2e-phase3674.sh` **OK** |
| Local E2E phase3675 (hard_gaps_summary titles/notes) | done | `e2e-phase3675.sh` **OK** |
| Local E2E phase3676 (STATUS hard_gaps_summary export) | done | `e2e-phase3676.sh` **OK** |
| Local E2E phase3677 (marker 3680) | done | `e2e-phase3677.sh` **OK** |
| Local E2E phase3678 (typecheck) | done | `e2e-phase3678.sh` **OK** |
| Local E2E phase3679 (e2e-all + gaps) | done | `e2e-phase3679.sh` **OK** |
| Local E2E phase3680 (STATUS soft-complete) | done | `e2e-phase3680.sh` **OK** |
| Local E2E phase3681 (milestone 9600) | done | `e2e-phase3681.sh` **OK** |
| Local E2E phase3682 (milestone 9600 endpoints) | done | `e2e-phase3682.sh` **OK** |
| Local E2E phase3683 (milestone 9600 UI) | done | `e2e-phase3683.sh` **OK** |
| Local E2E phase3684 (STATUS milestone 9600) | done | `e2e-phase3684.sh` **OK** |
| Local E2E phase3685 (marker 3688) | done | `e2e-phase3685.sh` **OK** |
| Local E2E phase3686 (typecheck) | done | `e2e-phase3686.sh` **OK** |
| Local E2E phase3687 (e2e-all + gaps) | done | `e2e-phase3687.sh` **OK** |
| Local E2E phase3688 (STATUS soft-complete) | done | `e2e-phase3688.sh` **OK** |
| Local E2E phase3689 (schema 3.6) | done | `e2e-phase3689.sh` **OK** |
| Local E2E phase3690 (UI surface schema 3.6) | done | `e2e-phase3690.sh` **OK** |
| Local E2E phase3691 (client surface types) | done | `e2e-phase3691.sh` **OK** |
| Local E2E phase3692 (STATUS schema 3.6) | done | `e2e-phase3692.sh` **OK** |
| Local E2E phase3693 (marker 3696) | done | `e2e-phase3693.sh` **OK** |
| Local E2E phase3694 (typecheck) | done | `e2e-phase3694.sh` **OK** |
| Local E2E phase3695 (e2e-all + gaps) | done | `e2e-phase3695.sh` **OK** |
| Local E2E phase3696 (STATUS soft-complete) | done | `e2e-phase3696.sh` **OK** |
| Local E2E phase3697 (milestone 9650) | done | `e2e-phase3697.sh` **OK** |
| Local E2E phase3698 (milestone 9650 endpoints) | done | `e2e-phase3698.sh` **OK** |
| Local E2E phase3699 (milestone 9650 UI) | done | `e2e-phase3699.sh` **OK** |
| Local E2E phase3700 (STATUS milestone 9650) | done | `e2e-phase3700.sh` **OK** |
| Local E2E phase3701 (marker 3704) | done | `e2e-phase3701.sh` **OK** |
| Local E2E phase3702 (typecheck) | done | `e2e-phase3702.sh` **OK** |
| Local E2E phase3703 (e2e-all + gaps) | done | `e2e-phase3703.sh` **OK** |
| Local E2E phase3704 (STATUS soft-complete) | done | `e2e-phase3704.sh` **OK** |
| Local E2E phase3705 (hard_gaps_summary session) | done | `e2e-phase3705.sh` **OK** |
| Local E2E phase3706 (UI hard_gaps_summary session) | done | `e2e-phase3706.sh` **OK** |
| Local E2E phase3707 (clear hard_gaps_summary) | done | `e2e-phase3707.sh` **OK** |
| Local E2E phase3708 (STATUS hard_gaps_summary session) | done | `e2e-phase3708.sh` **OK** |
| Local E2E phase3709 (marker 3712) | done | `e2e-phase3709.sh` **OK** |
| Local E2E phase3710 (typecheck) | done | `e2e-phase3710.sh` **OK** |
| Local E2E phase3711 (e2e-all + gaps) | done | `e2e-phase3711.sh` **OK** |
| Local E2E phase3712 (STATUS soft-complete) | done | `e2e-phase3712.sh` **OK** |
| Local E2E phase3713 (milestone 9700) | done | `e2e-phase3713.sh` **OK** |
| Local E2E phase3714 (milestone 9700 endpoints) | done | `e2e-phase3714.sh` **OK** |
| Local E2E phase3715 (milestone 9700 UI) | done | `e2e-phase3715.sh` **OK** |
| Local E2E phase3716 (STATUS milestone 9700) | done | `e2e-phase3716.sh` **OK** |
| Local E2E phase3717 (marker 3720) | done | `e2e-phase3717.sh` **OK** |
| Local E2E phase3718 (typecheck) | done | `e2e-phase3718.sh` **OK** |
| Local E2E phase3719 (e2e-all + gaps) | done | `e2e-phase3719.sh` **OK** |
| Local E2E phase3720 (STATUS soft-complete) | done | `e2e-phase3720.sh` **OK** |
| Local E2E phase3721 (Soft 3720+ surface) | done | `e2e-phase3721.sh` **OK** |
| Local E2E phase3722 (UI Soft 3720+) | done | `e2e-phase3722.sh` **OK** |
| Local E2E phase3723 (client Soft 3720+) | done | `e2e-phase3723.sh` **OK** |
| Local E2E phase3724 (STATUS Soft 3720+) | done | `e2e-phase3724.sh` **OK** |
| Local E2E phase3725 (marker 3728) | done | `e2e-phase3725.sh` **OK** |
| Local E2E phase3726 (typecheck) | done | `e2e-phase3726.sh` **OK** |
| Local E2E phase3727 (e2e-all + gaps) | done | `e2e-phase3727.sh` **OK** |
| Local E2E phase3728 (STATUS soft-complete) | done | `e2e-phase3728.sh` **OK** |
| Local E2E phase3729 (milestone 9750) | done | `e2e-phase3729.sh` **OK** |
| Local E2E phase3730 (milestone 9750 endpoints) | done | `e2e-phase3730.sh` **OK** |
| Local E2E phase3731 (milestone 9750 UI) | done | `e2e-phase3731.sh` **OK** |
| Local E2E phase3732 (STATUS milestone 9750) | done | `e2e-phase3732.sh` **OK** |
| Local E2E phase3733 (marker 3736) | done | `e2e-phase3733.sh` **OK** |
| Local E2E phase3734 (typecheck) | done | `e2e-phase3734.sh` **OK** |
| Local E2E phase3735 (e2e-all + gaps) | done | `e2e-phase3735.sh` **OK** |
| Local E2E phase3736 (STATUS soft-complete) | done | `e2e-phase3736.sh` **OK** |
| Local E2E phase3737 (hard_gaps_closure_roster API) | done | `e2e-phase3737.sh` **OK** |
| Local E2E phase3738 (UI hard_gaps_closure_roster) | done | `e2e-phase3738.sh` **OK** |
| Local E2E phase3739 (client hard_gaps_closure_roster) | done | `e2e-phase3739.sh` **OK** |
| Local E2E phase3740 (STATUS hard_gaps_closure_roster) | done | `e2e-phase3740.sh` **OK** |
| Local E2E phase3741 (marker 3744) | done | `e2e-phase3741.sh` **OK** |
| Local E2E phase3742 (typecheck) | done | `e2e-phase3742.sh` **OK** |
| Local E2E phase3743 (e2e-all + gaps) | done | `e2e-phase3743.sh` **OK** |
| Local E2E phase3744 (STATUS soft-complete) | done | `e2e-phase3744.sh` **OK** |
| Local E2E phase3745 (milestone 9800) | done | `e2e-phase3745.sh` **OK** |
| Local E2E phase3746 (milestone 9800 endpoints) | done | `e2e-phase3746.sh` **OK** |
| Local E2E phase3747 (milestone 9800 UI) | done | `e2e-phase3747.sh` **OK** |
| Local E2E phase3748 (STATUS milestone 9800) | done | `e2e-phase3748.sh` **OK** |
| Local E2E phase3749 (marker 3752) | done | `e2e-phase3749.sh` **OK** |
| Local E2E phase3750 (typecheck) | done | `e2e-phase3750.sh` **OK** |
| Local E2E phase3751 (e2e-all + gaps) | done | `e2e-phase3751.sh` **OK** |
| Local E2E phase3752 (STATUS soft-complete) | done | `e2e-phase3752.sh` **OK** |
| Local E2E phase3753 (hard_gaps_closure export) | done | `e2e-phase3753.sh` **OK** |
| Local E2E phase3754 (UI hard_gaps_closure bundle) | done | `e2e-phase3754.sh` **OK** |
| Local E2E phase3755 (hard_gaps_closure titles/notes) | done | `e2e-phase3755.sh` **OK** |
| Local E2E phase3756 (STATUS hard_gaps_closure export) | done | `e2e-phase3756.sh` **OK** |
| Local E2E phase3757 (marker 3760) | done | `e2e-phase3757.sh` **OK** |
| Local E2E phase3758 (typecheck) | done | `e2e-phase3758.sh` **OK** |
| Local E2E phase3759 (e2e-all + gaps) | done | `e2e-phase3759.sh` **OK** |
| Local E2E phase3760 (STATUS soft-complete) | done | `e2e-phase3760.sh` **OK** |
| Local E2E phase3761 (milestone 9850) | done | `e2e-phase3761.sh` **OK** |
| Local E2E phase3762 (milestone 9850 endpoints) | done | `e2e-phase3762.sh` **OK** |
| Local E2E phase3763 (milestone 9850 UI) | done | `e2e-phase3763.sh` **OK** |
| Local E2E phase3764 (STATUS milestone 9850) | done | `e2e-phase3764.sh` **OK** |
| Local E2E phase3765 (marker 3768) | done | `e2e-phase3765.sh` **OK** |
| Local E2E phase3766 (typecheck) | done | `e2e-phase3766.sh` **OK** |
| Local E2E phase3767 (e2e-all + gaps) | done | `e2e-phase3767.sh` **OK** |
| Local E2E phase3768 (STATUS soft-complete) | done | `e2e-phase3768.sh` **OK** |

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
bash webui/scripts/e2e-phase158.sh
bash webui/scripts/e2e-phase159.sh
bash webui/scripts/e2e-phase160.sh
bash webui/scripts/e2e-phase161.sh
bash webui/scripts/e2e-phase162.sh
bash webui/scripts/e2e-phase163.sh
bash webui/scripts/e2e-phase164.sh
bash webui/scripts/e2e-phase165.sh
bash webui/scripts/e2e-phase166.sh
bash webui/scripts/e2e-phase167.sh
bash webui/scripts/e2e-phase168.sh
bash webui/scripts/e2e-phase169.sh
bash webui/scripts/e2e-phase170.sh
bash webui/scripts/e2e-phase171.sh
bash webui/scripts/e2e-phase172.sh
bash webui/scripts/e2e-phase173.sh
bash webui/scripts/e2e-phase174.sh
bash webui/scripts/e2e-phase175.sh
bash webui/scripts/e2e-phase176.sh
bash webui/scripts/e2e-phase177.sh
bash webui/scripts/e2e-phase178.sh
bash webui/scripts/e2e-phase179.sh
bash webui/scripts/e2e-phase180.sh
bash webui/scripts/e2e-phase181.sh
bash webui/scripts/e2e-phase182.sh
bash webui/scripts/e2e-phase183.sh
bash webui/scripts/e2e-phase184.sh
bash webui/scripts/e2e-phase185.sh
bash webui/scripts/e2e-phase186.sh
bash webui/scripts/e2e-phase187.sh
bash webui/scripts/e2e-phase188.sh
bash webui/scripts/e2e-phase189.sh
bash webui/scripts/e2e-phase190.sh
bash webui/scripts/e2e-phase191.sh
bash webui/scripts/e2e-phase192.sh
bash webui/scripts/e2e-phase193.sh
bash webui/scripts/e2e-phase194.sh
bash webui/scripts/e2e-phase195.sh
bash webui/scripts/e2e-phase196.sh
bash webui/scripts/e2e-phase197.sh
bash webui/scripts/e2e-phase198.sh
bash webui/scripts/e2e-phase199.sh
bash webui/scripts/e2e-phase200.sh
bash webui/scripts/e2e-phase201.sh
bash webui/scripts/e2e-phase202.sh
bash webui/scripts/e2e-phase203.sh
bash webui/scripts/e2e-phase204.sh
bash webui/scripts/e2e-phase205.sh
bash webui/scripts/e2e-phase206.sh
bash webui/scripts/e2e-phase207.sh
bash webui/scripts/e2e-phase208.sh
bash webui/scripts/e2e-phase209.sh
bash webui/scripts/e2e-phase210.sh
bash webui/scripts/e2e-phase211.sh
bash webui/scripts/e2e-phase212.sh
bash webui/scripts/e2e-phase213.sh
bash webui/scripts/e2e-phase214.sh
bash webui/scripts/e2e-phase215.sh
bash webui/scripts/e2e-phase216.sh
bash webui/scripts/e2e-phase217.sh
bash webui/scripts/e2e-phase218.sh
bash webui/scripts/e2e-phase219.sh
bash webui/scripts/e2e-phase220.sh
bash webui/scripts/e2e-phase221.sh
bash webui/scripts/e2e-phase222.sh
bash webui/scripts/e2e-phase223.sh
bash webui/scripts/e2e-phase224.sh
bash webui/scripts/e2e-phase225.sh
bash webui/scripts/e2e-phase226.sh
bash webui/scripts/e2e-phase227.sh
bash webui/scripts/e2e-phase228.sh
bash webui/scripts/e2e-phase229.sh
bash webui/scripts/e2e-phase230.sh
bash webui/scripts/e2e-phase231.sh
bash webui/scripts/e2e-phase232.sh
bash webui/scripts/e2e-phase233.sh
bash webui/scripts/e2e-phase234.sh
bash webui/scripts/e2e-phase235.sh
bash webui/scripts/e2e-phase236.sh
bash webui/scripts/e2e-phase237.sh
bash webui/scripts/e2e-phase238.sh
bash webui/scripts/e2e-phase239.sh
bash webui/scripts/e2e-phase240.sh
bash webui/scripts/e2e-phase241.sh
bash webui/scripts/e2e-phase242.sh
bash webui/scripts/e2e-phase243.sh
bash webui/scripts/e2e-phase244.sh
bash webui/scripts/e2e-phase245.sh
bash webui/scripts/e2e-phase246.sh
bash webui/scripts/e2e-phase247.sh
bash webui/scripts/e2e-phase248.sh
bash webui/scripts/e2e-phase249.sh
bash webui/scripts/e2e-phase250.sh
bash webui/scripts/e2e-phase251.sh
bash webui/scripts/e2e-phase252.sh
bash webui/scripts/e2e-phase253.sh
bash webui/scripts/e2e-phase254.sh
bash webui/scripts/e2e-phase255.sh
bash webui/scripts/e2e-phase256.sh
bash webui/scripts/e2e-phase257.sh
bash webui/scripts/e2e-phase258.sh
bash webui/scripts/e2e-phase259.sh
bash webui/scripts/e2e-phase260.sh
bash webui/scripts/e2e-phase261.sh
bash webui/scripts/e2e-phase262.sh
bash webui/scripts/e2e-phase263.sh
bash webui/scripts/e2e-phase264.sh
bash webui/scripts/e2e-phase265.sh
bash webui/scripts/e2e-phase266.sh
bash webui/scripts/e2e-phase267.sh
bash webui/scripts/e2e-phase268.sh
bash webui/scripts/e2e-phase269.sh
bash webui/scripts/e2e-phase270.sh
bash webui/scripts/e2e-phase271.sh
bash webui/scripts/e2e-phase272.sh
bash webui/scripts/e2e-phase273.sh
bash webui/scripts/e2e-phase274.sh
bash webui/scripts/e2e-phase275.sh
bash webui/scripts/e2e-phase276.sh
bash webui/scripts/e2e-phase277.sh
bash webui/scripts/e2e-phase278.sh
bash webui/scripts/e2e-phase279.sh
bash webui/scripts/e2e-phase280.sh
bash webui/scripts/e2e-phase281.sh
bash webui/scripts/e2e-phase282.sh
bash webui/scripts/e2e-phase283.sh
bash webui/scripts/e2e-phase284.sh
bash webui/scripts/e2e-phase285.sh
bash webui/scripts/e2e-phase286.sh
bash webui/scripts/e2e-phase287.sh
bash webui/scripts/e2e-phase288.sh
bash webui/scripts/e2e-phase289.sh
bash webui/scripts/e2e-phase290.sh
bash webui/scripts/e2e-phase291.sh
bash webui/scripts/e2e-phase292.sh
bash webui/scripts/e2e-phase293.sh
bash webui/scripts/e2e-phase294.sh
bash webui/scripts/e2e-phase295.sh
bash webui/scripts/e2e-phase296.sh
bash webui/scripts/e2e-phase297.sh
bash webui/scripts/e2e-phase298.sh
bash webui/scripts/e2e-phase299.sh
bash webui/scripts/e2e-phase300.sh
bash webui/scripts/e2e-phase301.sh
bash webui/scripts/e2e-phase302.sh
bash webui/scripts/e2e-phase303.sh
bash webui/scripts/e2e-phase304.sh
bash webui/scripts/e2e-phase305.sh
bash webui/scripts/e2e-phase306.sh
bash webui/scripts/e2e-phase307.sh
bash webui/scripts/e2e-phase308.sh
bash webui/scripts/e2e-phase309.sh
bash webui/scripts/e2e-phase310.sh
bash webui/scripts/e2e-phase311.sh
bash webui/scripts/e2e-phase312.sh
bash webui/scripts/e2e-phase313.sh
bash webui/scripts/e2e-phase314.sh
bash webui/scripts/e2e-phase315.sh
bash webui/scripts/e2e-phase316.sh
bash webui/scripts/e2e-phase317.sh
bash webui/scripts/e2e-phase318.sh
bash webui/scripts/e2e-phase319.sh
bash webui/scripts/e2e-phase320.sh
bash webui/scripts/e2e-phase321.sh
bash webui/scripts/e2e-phase322.sh
bash webui/scripts/e2e-phase323.sh
bash webui/scripts/e2e-phase324.sh
bash webui/scripts/e2e-phase325.sh
bash webui/scripts/e2e-phase326.sh
bash webui/scripts/e2e-phase327.sh
bash webui/scripts/e2e-phase328.sh
bash webui/scripts/e2e-phase329.sh
bash webui/scripts/e2e-phase330.sh
bash webui/scripts/e2e-phase331.sh
bash webui/scripts/e2e-phase332.sh
bash webui/scripts/e2e-phase333.sh
bash webui/scripts/e2e-phase334.sh
bash webui/scripts/e2e-phase335.sh
bash webui/scripts/e2e-phase336.sh
bash webui/scripts/e2e-phase337.sh
bash webui/scripts/e2e-phase338.sh
bash webui/scripts/e2e-phase339.sh
bash webui/scripts/e2e-phase340.sh
bash webui/scripts/e2e-phase341.sh
bash webui/scripts/e2e-phase342.sh
bash webui/scripts/e2e-phase343.sh
bash webui/scripts/e2e-phase344.sh
bash webui/scripts/e2e-phase345.sh
bash webui/scripts/e2e-phase346.sh
bash webui/scripts/e2e-phase347.sh
bash webui/scripts/e2e-phase348.sh
bash webui/scripts/e2e-phase349.sh
bash webui/scripts/e2e-phase350.sh
bash webui/scripts/e2e-phase351.sh
bash webui/scripts/e2e-phase352.sh
bash webui/scripts/e2e-phase353.sh
bash webui/scripts/e2e-phase354.sh
bash webui/scripts/e2e-phase355.sh
bash webui/scripts/e2e-phase356.sh
bash webui/scripts/e2e-phase357.sh
bash webui/scripts/e2e-phase358.sh
bash webui/scripts/e2e-phase359.sh
bash webui/scripts/e2e-phase360.sh
bash webui/scripts/e2e-phase361.sh
bash webui/scripts/e2e-phase362.sh
bash webui/scripts/e2e-phase363.sh
bash webui/scripts/e2e-phase364.sh
bash webui/scripts/e2e-phase365.sh
bash webui/scripts/e2e-phase366.sh
bash webui/scripts/e2e-phase367.sh
bash webui/scripts/e2e-phase368.sh
bash webui/scripts/e2e-phase369.sh
bash webui/scripts/e2e-phase370.sh
bash webui/scripts/e2e-phase371.sh
bash webui/scripts/e2e-phase372.sh
bash webui/scripts/e2e-phase373.sh
bash webui/scripts/e2e-phase374.sh
bash webui/scripts/e2e-phase375.sh
bash webui/scripts/e2e-phase376.sh
bash webui/scripts/e2e-phase377.sh
bash webui/scripts/e2e-phase378.sh
bash webui/scripts/e2e-phase379.sh
bash webui/scripts/e2e-phase380.sh
bash webui/scripts/e2e-phase381.sh
bash webui/scripts/e2e-phase382.sh
bash webui/scripts/e2e-phase383.sh
bash webui/scripts/e2e-phase384.sh
bash webui/scripts/e2e-phase385.sh
bash webui/scripts/e2e-phase386.sh
bash webui/scripts/e2e-phase387.sh
bash webui/scripts/e2e-phase388.sh
bash webui/scripts/e2e-phase389.sh
bash webui/scripts/e2e-phase390.sh
bash webui/scripts/e2e-phase391.sh
bash webui/scripts/e2e-phase392.sh
bash webui/scripts/e2e-phase393.sh
bash webui/scripts/e2e-phase394.sh
bash webui/scripts/e2e-phase395.sh
bash webui/scripts/e2e-phase396.sh
bash webui/scripts/e2e-phase397.sh
bash webui/scripts/e2e-phase398.sh
bash webui/scripts/e2e-phase399.sh
bash webui/scripts/e2e-phase400.sh
bash webui/scripts/e2e-phase401.sh
bash webui/scripts/e2e-phase402.sh
bash webui/scripts/e2e-phase403.sh
bash webui/scripts/e2e-phase404.sh
bash webui/scripts/e2e-phase405.sh
bash webui/scripts/e2e-phase406.sh
bash webui/scripts/e2e-phase407.sh
bash webui/scripts/e2e-phase408.sh
bash webui/scripts/e2e-phase409.sh
bash webui/scripts/e2e-phase410.sh
bash webui/scripts/e2e-phase411.sh
bash webui/scripts/e2e-phase412.sh
bash webui/scripts/e2e-phase413.sh
bash webui/scripts/e2e-phase414.sh
bash webui/scripts/e2e-phase415.sh
bash webui/scripts/e2e-phase416.sh
bash webui/scripts/e2e-phase417.sh
bash webui/scripts/e2e-phase418.sh
bash webui/scripts/e2e-phase419.sh
bash webui/scripts/e2e-phase420.sh
bash webui/scripts/e2e-phase421.sh
bash webui/scripts/e2e-phase422.sh
bash webui/scripts/e2e-phase423.sh
bash webui/scripts/e2e-phase424.sh
bash webui/scripts/e2e-phase425.sh
bash webui/scripts/e2e-phase426.sh
bash webui/scripts/e2e-phase427.sh
bash webui/scripts/e2e-phase428.sh
bash webui/scripts/e2e-phase429.sh
bash webui/scripts/e2e-phase430.sh
bash webui/scripts/e2e-phase431.sh
bash webui/scripts/e2e-phase432.sh
bash webui/scripts/e2e-phase433.sh
bash webui/scripts/e2e-phase434.sh
bash webui/scripts/e2e-phase435.sh
bash webui/scripts/e2e-phase436.sh
bash webui/scripts/e2e-phase437.sh
bash webui/scripts/e2e-phase438.sh
bash webui/scripts/e2e-phase439.sh
bash webui/scripts/e2e-phase440.sh
bash webui/scripts/e2e-phase441.sh
bash webui/scripts/e2e-phase442.sh
bash webui/scripts/e2e-phase443.sh
bash webui/scripts/e2e-phase444.sh
bash webui/scripts/e2e-phase445.sh
bash webui/scripts/e2e-phase446.sh
bash webui/scripts/e2e-phase447.sh
bash webui/scripts/e2e-phase448.sh
bash webui/scripts/e2e-phase449.sh
bash webui/scripts/e2e-phase450.sh
bash webui/scripts/e2e-phase451.sh
bash webui/scripts/e2e-phase452.sh
bash webui/scripts/e2e-phase453.sh
bash webui/scripts/e2e-phase454.sh
bash webui/scripts/e2e-phase455.sh
bash webui/scripts/e2e-phase456.sh
bash webui/scripts/e2e-phase457.sh
bash webui/scripts/e2e-phase458.sh
bash webui/scripts/e2e-phase459.sh
bash webui/scripts/e2e-phase460.sh
bash webui/scripts/e2e-phase461.sh
bash webui/scripts/e2e-phase462.sh
bash webui/scripts/e2e-phase463.sh
bash webui/scripts/e2e-phase464.sh
bash webui/scripts/e2e-phase465.sh
bash webui/scripts/e2e-phase466.sh
bash webui/scripts/e2e-phase467.sh
bash webui/scripts/e2e-phase468.sh
bash webui/scripts/e2e-phase469.sh
bash webui/scripts/e2e-phase470.sh
bash webui/scripts/e2e-phase471.sh
bash webui/scripts/e2e-phase472.sh
bash webui/scripts/e2e-phase473.sh
bash webui/scripts/e2e-phase474.sh
bash webui/scripts/e2e-phase475.sh
bash webui/scripts/e2e-phase476.sh
bash webui/scripts/e2e-phase477.sh
bash webui/scripts/e2e-phase478.sh
bash webui/scripts/e2e-phase479.sh
bash webui/scripts/e2e-phase480.sh
bash webui/scripts/e2e-phase481.sh
bash webui/scripts/e2e-phase482.sh
bash webui/scripts/e2e-phase483.sh
bash webui/scripts/e2e-phase484.sh
bash webui/scripts/e2e-phase485.sh
bash webui/scripts/e2e-phase486.sh
bash webui/scripts/e2e-phase487.sh
bash webui/scripts/e2e-phase488.sh
bash webui/scripts/e2e-phase489.sh
bash webui/scripts/e2e-phase490.sh
bash webui/scripts/e2e-phase491.sh
bash webui/scripts/e2e-phase492.sh
bash webui/scripts/e2e-phase493.sh
bash webui/scripts/e2e-phase494.sh
bash webui/scripts/e2e-phase495.sh
bash webui/scripts/e2e-phase496.sh
bash webui/scripts/e2e-phase497.sh
bash webui/scripts/e2e-phase498.sh
bash webui/scripts/e2e-phase499.sh
bash webui/scripts/e2e-phase500.sh
bash webui/scripts/e2e-phase501.sh
bash webui/scripts/e2e-phase502.sh
bash webui/scripts/e2e-phase503.sh
bash webui/scripts/e2e-phase504.sh
bash webui/scripts/e2e-phase505.sh
bash webui/scripts/e2e-phase506.sh
bash webui/scripts/e2e-phase507.sh
bash webui/scripts/e2e-phase508.sh
bash webui/scripts/e2e-phase509.sh
bash webui/scripts/e2e-phase510.sh
bash webui/scripts/e2e-phase511.sh
bash webui/scripts/e2e-phase512.sh
bash webui/scripts/e2e-phase513.sh
bash webui/scripts/e2e-phase514.sh
bash webui/scripts/e2e-phase515.sh
bash webui/scripts/e2e-phase516.sh
bash webui/scripts/e2e-phase517.sh
bash webui/scripts/e2e-phase518.sh
bash webui/scripts/e2e-phase519.sh
bash webui/scripts/e2e-phase520.sh
bash webui/scripts/e2e-phase521.sh
bash webui/scripts/e2e-phase522.sh
bash webui/scripts/e2e-phase523.sh
bash webui/scripts/e2e-phase524.sh
bash webui/scripts/e2e-phase525.sh
bash webui/scripts/e2e-phase526.sh
bash webui/scripts/e2e-phase527.sh
bash webui/scripts/e2e-phase528.sh
bash webui/scripts/e2e-phase529.sh
bash webui/scripts/e2e-phase530.sh
bash webui/scripts/e2e-phase531.sh
bash webui/scripts/e2e-phase532.sh
bash webui/scripts/e2e-phase533.sh
bash webui/scripts/e2e-phase534.sh
bash webui/scripts/e2e-phase535.sh
bash webui/scripts/e2e-phase536.sh
bash webui/scripts/e2e-phase537.sh
bash webui/scripts/e2e-phase538.sh
bash webui/scripts/e2e-phase539.sh
bash webui/scripts/e2e-phase540.sh
bash webui/scripts/e2e-phase541.sh
bash webui/scripts/e2e-phase542.sh
bash webui/scripts/e2e-phase543.sh
bash webui/scripts/e2e-phase544.sh
bash webui/scripts/e2e-phase545.sh
bash webui/scripts/e2e-phase546.sh
bash webui/scripts/e2e-phase547.sh
bash webui/scripts/e2e-phase548.sh
bash webui/scripts/e2e-phase549.sh
bash webui/scripts/e2e-phase550.sh
bash webui/scripts/e2e-phase551.sh
bash webui/scripts/e2e-phase552.sh
bash webui/scripts/e2e-phase553.sh
bash webui/scripts/e2e-phase554.sh
bash webui/scripts/e2e-phase555.sh
bash webui/scripts/e2e-phase556.sh
bash webui/scripts/e2e-phase557.sh
bash webui/scripts/e2e-phase558.sh
bash webui/scripts/e2e-phase559.sh
bash webui/scripts/e2e-phase560.sh
bash webui/scripts/e2e-phase561.sh
bash webui/scripts/e2e-phase562.sh
bash webui/scripts/e2e-phase563.sh
bash webui/scripts/e2e-phase564.sh
bash webui/scripts/e2e-phase565.sh
bash webui/scripts/e2e-phase566.sh
bash webui/scripts/e2e-phase567.sh
bash webui/scripts/e2e-phase568.sh
bash webui/scripts/e2e-phase569.sh
bash webui/scripts/e2e-phase570.sh
bash webui/scripts/e2e-phase571.sh
bash webui/scripts/e2e-phase572.sh
bash webui/scripts/e2e-phase573.sh
bash webui/scripts/e2e-phase574.sh
bash webui/scripts/e2e-phase575.sh
bash webui/scripts/e2e-phase576.sh
bash webui/scripts/e2e-phase577.sh
bash webui/scripts/e2e-phase578.sh
bash webui/scripts/e2e-phase579.sh
bash webui/scripts/e2e-phase580.sh
bash webui/scripts/e2e-phase581.sh
bash webui/scripts/e2e-phase582.sh
bash webui/scripts/e2e-phase583.sh
bash webui/scripts/e2e-phase584.sh
bash webui/scripts/e2e-phase585.sh
bash webui/scripts/e2e-phase586.sh
bash webui/scripts/e2e-phase587.sh
bash webui/scripts/e2e-phase588.sh
bash webui/scripts/e2e-phase589.sh
bash webui/scripts/e2e-phase590.sh
bash webui/scripts/e2e-phase591.sh
bash webui/scripts/e2e-phase592.sh
bash webui/scripts/e2e-phase593.sh
bash webui/scripts/e2e-phase594.sh
bash webui/scripts/e2e-phase595.sh
bash webui/scripts/e2e-phase596.sh
bash webui/scripts/e2e-phase597.sh
bash webui/scripts/e2e-phase598.sh
bash webui/scripts/e2e-phase599.sh
bash webui/scripts/e2e-phase600.sh
bash webui/scripts/e2e-phase601.sh
bash webui/scripts/e2e-phase602.sh
bash webui/scripts/e2e-phase603.sh
bash webui/scripts/e2e-phase604.sh
bash webui/scripts/e2e-phase605.sh
bash webui/scripts/e2e-phase606.sh
bash webui/scripts/e2e-phase607.sh
bash webui/scripts/e2e-phase608.sh
bash webui/scripts/e2e-phase609.sh
bash webui/scripts/e2e-phase610.sh
bash webui/scripts/e2e-phase611.sh
bash webui/scripts/e2e-phase612.sh
bash webui/scripts/e2e-phase613.sh
bash webui/scripts/e2e-phase614.sh
bash webui/scripts/e2e-phase615.sh
bash webui/scripts/e2e-phase616.sh
bash webui/scripts/e2e-phase617.sh
bash webui/scripts/e2e-phase618.sh
bash webui/scripts/e2e-phase619.sh
bash webui/scripts/e2e-phase620.sh
bash webui/scripts/e2e-phase621.sh
bash webui/scripts/e2e-phase622.sh
bash webui/scripts/e2e-phase623.sh
bash webui/scripts/e2e-phase624.sh
bash webui/scripts/e2e-phase625.sh
bash webui/scripts/e2e-phase626.sh
bash webui/scripts/e2e-phase627.sh
bash webui/scripts/e2e-phase628.sh
bash webui/scripts/e2e-phase629.sh
bash webui/scripts/e2e-phase630.sh
bash webui/scripts/e2e-phase631.sh
bash webui/scripts/e2e-phase632.sh
bash webui/scripts/e2e-phase633.sh
bash webui/scripts/e2e-phase634.sh
bash webui/scripts/e2e-phase635.sh
bash webui/scripts/e2e-phase636.sh
bash webui/scripts/e2e-phase637.sh
bash webui/scripts/e2e-phase638.sh
bash webui/scripts/e2e-phase639.sh
bash webui/scripts/e2e-phase640.sh
bash webui/scripts/e2e-phase641.sh
bash webui/scripts/e2e-phase642.sh
bash webui/scripts/e2e-phase643.sh
bash webui/scripts/e2e-phase644.sh
bash webui/scripts/e2e-phase645.sh
bash webui/scripts/e2e-phase646.sh
bash webui/scripts/e2e-phase647.sh
bash webui/scripts/e2e-phase648.sh
bash webui/scripts/e2e-phase649.sh
bash webui/scripts/e2e-phase650.sh
bash webui/scripts/e2e-phase651.sh
bash webui/scripts/e2e-phase652.sh
bash webui/scripts/e2e-phase653.sh
bash webui/scripts/e2e-phase654.sh
bash webui/scripts/e2e-phase655.sh
bash webui/scripts/e2e-phase656.sh
bash webui/scripts/e2e-phase657.sh
bash webui/scripts/e2e-phase658.sh
bash webui/scripts/e2e-phase659.sh
bash webui/scripts/e2e-phase660.sh
bash webui/scripts/e2e-phase661.sh
bash webui/scripts/e2e-phase662.sh
bash webui/scripts/e2e-phase663.sh
bash webui/scripts/e2e-phase664.sh
bash webui/scripts/e2e-phase665.sh
bash webui/scripts/e2e-phase666.sh
bash webui/scripts/e2e-phase667.sh
bash webui/scripts/e2e-phase668.sh
bash webui/scripts/e2e-phase669.sh
bash webui/scripts/e2e-phase670.sh
bash webui/scripts/e2e-phase671.sh
bash webui/scripts/e2e-phase672.sh
bash webui/scripts/e2e-phase673.sh
bash webui/scripts/e2e-phase674.sh
bash webui/scripts/e2e-phase675.sh
bash webui/scripts/e2e-phase676.sh
bash webui/scripts/e2e-phase677.sh
bash webui/scripts/e2e-phase678.sh
bash webui/scripts/e2e-phase679.sh
bash webui/scripts/e2e-phase680.sh
bash webui/scripts/e2e-phase681.sh
bash webui/scripts/e2e-phase682.sh
bash webui/scripts/e2e-phase683.sh
bash webui/scripts/e2e-phase684.sh
bash webui/scripts/e2e-phase685.sh
bash webui/scripts/e2e-phase686.sh
bash webui/scripts/e2e-phase687.sh
bash webui/scripts/e2e-phase688.sh
bash webui/scripts/e2e-phase689.sh
bash webui/scripts/e2e-phase690.sh
bash webui/scripts/e2e-phase691.sh
bash webui/scripts/e2e-phase692.sh
bash webui/scripts/e2e-phase693.sh
bash webui/scripts/e2e-phase694.sh
bash webui/scripts/e2e-phase695.sh
bash webui/scripts/e2e-phase696.sh
bash webui/scripts/e2e-phase697.sh
bash webui/scripts/e2e-phase698.sh
bash webui/scripts/e2e-phase699.sh
bash webui/scripts/e2e-phase700.sh
bash webui/scripts/e2e-phase701.sh
bash webui/scripts/e2e-phase702.sh
bash webui/scripts/e2e-phase703.sh
bash webui/scripts/e2e-phase704.sh
bash webui/scripts/e2e-phase705.sh
bash webui/scripts/e2e-phase706.sh
bash webui/scripts/e2e-phase707.sh
bash webui/scripts/e2e-phase708.sh
bash webui/scripts/e2e-phase709.sh
bash webui/scripts/e2e-phase710.sh
bash webui/scripts/e2e-phase711.sh
bash webui/scripts/e2e-phase712.sh
bash webui/scripts/e2e-phase713.sh
bash webui/scripts/e2e-phase714.sh
bash webui/scripts/e2e-phase715.sh
bash webui/scripts/e2e-phase716.sh
bash webui/scripts/e2e-phase717.sh
bash webui/scripts/e2e-phase718.sh
bash webui/scripts/e2e-phase719.sh
bash webui/scripts/e2e-phase720.sh
bash webui/scripts/e2e-phase721.sh
bash webui/scripts/e2e-phase722.sh
bash webui/scripts/e2e-phase723.sh
bash webui/scripts/e2e-phase724.sh
bash webui/scripts/e2e-phase725.sh
bash webui/scripts/e2e-phase726.sh
bash webui/scripts/e2e-phase727.sh
bash webui/scripts/e2e-phase728.sh
bash webui/scripts/e2e-phase729.sh
bash webui/scripts/e2e-phase730.sh
bash webui/scripts/e2e-phase731.sh
bash webui/scripts/e2e-phase732.sh
bash webui/scripts/e2e-phase733.sh
bash webui/scripts/e2e-phase734.sh
bash webui/scripts/e2e-phase735.sh
bash webui/scripts/e2e-phase736.sh
bash webui/scripts/e2e-phase737.sh
bash webui/scripts/e2e-phase738.sh
bash webui/scripts/e2e-phase739.sh
bash webui/scripts/e2e-phase740.sh
bash webui/scripts/e2e-phase741.sh
bash webui/scripts/e2e-phase742.sh
bash webui/scripts/e2e-phase743.sh
bash webui/scripts/e2e-phase744.sh
bash webui/scripts/e2e-phase745.sh
bash webui/scripts/e2e-phase746.sh
bash webui/scripts/e2e-phase747.sh
bash webui/scripts/e2e-phase748.sh
bash webui/scripts/e2e-phase749.sh
bash webui/scripts/e2e-phase750.sh
bash webui/scripts/e2e-phase751.sh
bash webui/scripts/e2e-phase752.sh
bash webui/scripts/e2e-phase753.sh
bash webui/scripts/e2e-phase754.sh
bash webui/scripts/e2e-phase755.sh
bash webui/scripts/e2e-phase756.sh
bash webui/scripts/e2e-phase757.sh
bash webui/scripts/e2e-phase758.sh
bash webui/scripts/e2e-phase759.sh
bash webui/scripts/e2e-phase760.sh
bash webui/scripts/e2e-phase761.sh
bash webui/scripts/e2e-phase762.sh
bash webui/scripts/e2e-phase763.sh
bash webui/scripts/e2e-phase764.sh
bash webui/scripts/e2e-phase765.sh
bash webui/scripts/e2e-phase766.sh
bash webui/scripts/e2e-phase767.sh
bash webui/scripts/e2e-phase768.sh
bash webui/scripts/e2e-phase769.sh
bash webui/scripts/e2e-phase770.sh
bash webui/scripts/e2e-phase771.sh
bash webui/scripts/e2e-phase772.sh
bash webui/scripts/e2e-phase773.sh
bash webui/scripts/e2e-phase774.sh
bash webui/scripts/e2e-phase775.sh
bash webui/scripts/e2e-phase776.sh
bash webui/scripts/e2e-phase777.sh
bash webui/scripts/e2e-phase778.sh
bash webui/scripts/e2e-phase779.sh
bash webui/scripts/e2e-phase780.sh
bash webui/scripts/e2e-phase781.sh
bash webui/scripts/e2e-phase782.sh
bash webui/scripts/e2e-phase783.sh
bash webui/scripts/e2e-phase784.sh
bash webui/scripts/e2e-phase785.sh
bash webui/scripts/e2e-phase786.sh
bash webui/scripts/e2e-phase787.sh
bash webui/scripts/e2e-phase788.sh
bash webui/scripts/e2e-phase789.sh
bash webui/scripts/e2e-phase790.sh
bash webui/scripts/e2e-phase791.sh
bash webui/scripts/e2e-phase792.sh
bash webui/scripts/e2e-phase793.sh
bash webui/scripts/e2e-phase794.sh
bash webui/scripts/e2e-phase795.sh
bash webui/scripts/e2e-phase796.sh
bash webui/scripts/e2e-phase797.sh
bash webui/scripts/e2e-phase798.sh
bash webui/scripts/e2e-phase799.sh
bash webui/scripts/e2e-phase800.sh
bash webui/scripts/e2e-phase801.sh
bash webui/scripts/e2e-phase802.sh
bash webui/scripts/e2e-phase803.sh
bash webui/scripts/e2e-phase804.sh
bash webui/scripts/e2e-phase805.sh
bash webui/scripts/e2e-phase806.sh
bash webui/scripts/e2e-phase807.sh
bash webui/scripts/e2e-phase808.sh
bash webui/scripts/e2e-phase809.sh
bash webui/scripts/e2e-phase810.sh
bash webui/scripts/e2e-phase811.sh
bash webui/scripts/e2e-phase812.sh
bash webui/scripts/e2e-phase813.sh
bash webui/scripts/e2e-phase814.sh
bash webui/scripts/e2e-phase815.sh
bash webui/scripts/e2e-phase816.sh
bash webui/scripts/e2e-phase817.sh
bash webui/scripts/e2e-phase818.sh
bash webui/scripts/e2e-phase819.sh
bash webui/scripts/e2e-phase820.sh
bash webui/scripts/e2e-phase821.sh
bash webui/scripts/e2e-phase822.sh
bash webui/scripts/e2e-phase823.sh
bash webui/scripts/e2e-phase824.sh
bash webui/scripts/e2e-phase825.sh
bash webui/scripts/e2e-phase826.sh
bash webui/scripts/e2e-phase827.sh
bash webui/scripts/e2e-phase828.sh
bash webui/scripts/e2e-phase829.sh
bash webui/scripts/e2e-phase830.sh
bash webui/scripts/e2e-phase831.sh
bash webui/scripts/e2e-phase832.sh
bash webui/scripts/e2e-phase833.sh
bash webui/scripts/e2e-phase834.sh
bash webui/scripts/e2e-phase835.sh
bash webui/scripts/e2e-phase836.sh
bash webui/scripts/e2e-phase837.sh
bash webui/scripts/e2e-phase838.sh
bash webui/scripts/e2e-phase839.sh
bash webui/scripts/e2e-phase840.sh
bash webui/scripts/e2e-phase841.sh
bash webui/scripts/e2e-phase842.sh
bash webui/scripts/e2e-phase843.sh
bash webui/scripts/e2e-phase844.sh
bash webui/scripts/e2e-phase845.sh
bash webui/scripts/e2e-phase846.sh
bash webui/scripts/e2e-phase847.sh
bash webui/scripts/e2e-phase848.sh
bash webui/scripts/e2e-phase849.sh
bash webui/scripts/e2e-phase850.sh
bash webui/scripts/e2e-phase851.sh
bash webui/scripts/e2e-phase852.sh
bash webui/scripts/e2e-phase853.sh
bash webui/scripts/e2e-phase854.sh
bash webui/scripts/e2e-phase855.sh
bash webui/scripts/e2e-phase856.sh
bash webui/scripts/e2e-phase857.sh
bash webui/scripts/e2e-phase858.sh
bash webui/scripts/e2e-phase859.sh
bash webui/scripts/e2e-phase860.sh
bash webui/scripts/e2e-phase861.sh
bash webui/scripts/e2e-phase862.sh
bash webui/scripts/e2e-phase863.sh
bash webui/scripts/e2e-phase864.sh
bash webui/scripts/e2e-phase865.sh
bash webui/scripts/e2e-phase866.sh
bash webui/scripts/e2e-phase867.sh
bash webui/scripts/e2e-phase868.sh
bash webui/scripts/e2e-phase869.sh
bash webui/scripts/e2e-phase870.sh
bash webui/scripts/e2e-phase871.sh
bash webui/scripts/e2e-phase872.sh
bash webui/scripts/e2e-phase873.sh
bash webui/scripts/e2e-phase874.sh
bash webui/scripts/e2e-phase875.sh
bash webui/scripts/e2e-phase876.sh
bash webui/scripts/e2e-phase877.sh
bash webui/scripts/e2e-phase878.sh
bash webui/scripts/e2e-phase879.sh
bash webui/scripts/e2e-phase880.sh
bash webui/scripts/e2e-phase881.sh
bash webui/scripts/e2e-phase882.sh
bash webui/scripts/e2e-phase883.sh
bash webui/scripts/e2e-phase884.sh
bash webui/scripts/e2e-phase885.sh
bash webui/scripts/e2e-phase886.sh
bash webui/scripts/e2e-phase887.sh
bash webui/scripts/e2e-phase888.sh
bash webui/scripts/e2e-phase889.sh
bash webui/scripts/e2e-phase890.sh
bash webui/scripts/e2e-phase891.sh
bash webui/scripts/e2e-phase892.sh
bash webui/scripts/e2e-phase893.sh
bash webui/scripts/e2e-phase894.sh
bash webui/scripts/e2e-phase895.sh
bash webui/scripts/e2e-phase896.sh
bash webui/scripts/e2e-phase897.sh
bash webui/scripts/e2e-phase898.sh
bash webui/scripts/e2e-phase899.sh
bash webui/scripts/e2e-phase900.sh
bash webui/scripts/e2e-phase901.sh
bash webui/scripts/e2e-phase902.sh
bash webui/scripts/e2e-phase903.sh
bash webui/scripts/e2e-phase904.sh
bash webui/scripts/e2e-phase905.sh
bash webui/scripts/e2e-phase906.sh
bash webui/scripts/e2e-phase907.sh
bash webui/scripts/e2e-phase908.sh
bash webui/scripts/e2e-phase909.sh
bash webui/scripts/e2e-phase910.sh
bash webui/scripts/e2e-phase911.sh
bash webui/scripts/e2e-phase912.sh
bash webui/scripts/e2e-phase913.sh
bash webui/scripts/e2e-phase914.sh
bash webui/scripts/e2e-phase915.sh
bash webui/scripts/e2e-phase916.sh
bash webui/scripts/e2e-phase917.sh
bash webui/scripts/e2e-phase918.sh
bash webui/scripts/e2e-phase919.sh
bash webui/scripts/e2e-phase920.sh
bash webui/scripts/e2e-phase921.sh
bash webui/scripts/e2e-phase922.sh
bash webui/scripts/e2e-phase923.sh
bash webui/scripts/e2e-phase924.sh
bash webui/scripts/e2e-phase925.sh
bash webui/scripts/e2e-phase926.sh
bash webui/scripts/e2e-phase927.sh
bash webui/scripts/e2e-phase928.sh
bash webui/scripts/e2e-phase929.sh
bash webui/scripts/e2e-phase930.sh
bash webui/scripts/e2e-phase931.sh
bash webui/scripts/e2e-phase932.sh
bash webui/scripts/e2e-phase933.sh
bash webui/scripts/e2e-phase934.sh
bash webui/scripts/e2e-phase935.sh
bash webui/scripts/e2e-phase936.sh
bash webui/scripts/e2e-phase937.sh
bash webui/scripts/e2e-phase938.sh
bash webui/scripts/e2e-phase939.sh
bash webui/scripts/e2e-phase940.sh
bash webui/scripts/e2e-phase941.sh
bash webui/scripts/e2e-phase942.sh
bash webui/scripts/e2e-phase943.sh
bash webui/scripts/e2e-phase944.sh
bash webui/scripts/e2e-phase945.sh
bash webui/scripts/e2e-phase946.sh
bash webui/scripts/e2e-phase947.sh
bash webui/scripts/e2e-phase948.sh
bash webui/scripts/e2e-phase949.sh
bash webui/scripts/e2e-phase950.sh
bash webui/scripts/e2e-phase951.sh
bash webui/scripts/e2e-phase952.sh
bash webui/scripts/e2e-phase953.sh
bash webui/scripts/e2e-phase954.sh
bash webui/scripts/e2e-phase955.sh
bash webui/scripts/e2e-phase956.sh
bash webui/scripts/e2e-phase957.sh
bash webui/scripts/e2e-phase958.sh
bash webui/scripts/e2e-phase959.sh
bash webui/scripts/e2e-phase960.sh
bash webui/scripts/e2e-phase961.sh
bash webui/scripts/e2e-phase962.sh
bash webui/scripts/e2e-phase963.sh
bash webui/scripts/e2e-phase964.sh
bash webui/scripts/e2e-phase965.sh
bash webui/scripts/e2e-phase966.sh
bash webui/scripts/e2e-phase967.sh
bash webui/scripts/e2e-phase968.sh
bash webui/scripts/e2e-phase969.sh
bash webui/scripts/e2e-phase970.sh
bash webui/scripts/e2e-phase971.sh
bash webui/scripts/e2e-phase972.sh
bash webui/scripts/e2e-phase973.sh
bash webui/scripts/e2e-phase974.sh
bash webui/scripts/e2e-phase975.sh
bash webui/scripts/e2e-phase976.sh
bash webui/scripts/e2e-phase977.sh
bash webui/scripts/e2e-phase978.sh
bash webui/scripts/e2e-phase979.sh
bash webui/scripts/e2e-phase980.sh
bash webui/scripts/e2e-phase981.sh
bash webui/scripts/e2e-phase982.sh
bash webui/scripts/e2e-phase983.sh
bash webui/scripts/e2e-phase984.sh
bash webui/scripts/e2e-phase985.sh
bash webui/scripts/e2e-phase986.sh
bash webui/scripts/e2e-phase987.sh
bash webui/scripts/e2e-phase988.sh
bash webui/scripts/e2e-phase989.sh
bash webui/scripts/e2e-phase990.sh
bash webui/scripts/e2e-phase991.sh
bash webui/scripts/e2e-phase992.sh
bash webui/scripts/e2e-phase993.sh
bash webui/scripts/e2e-phase994.sh
bash webui/scripts/e2e-phase995.sh
bash webui/scripts/e2e-phase996.sh
bash webui/scripts/e2e-phase997.sh
bash webui/scripts/e2e-phase998.sh
bash webui/scripts/e2e-phase999.sh
bash webui/scripts/e2e-phase1000.sh
bash webui/scripts/e2e-phase1001.sh
bash webui/scripts/e2e-phase1002.sh
bash webui/scripts/e2e-phase1003.sh
bash webui/scripts/e2e-phase1004.sh
bash webui/scripts/e2e-phase1005.sh
bash webui/scripts/e2e-phase1006.sh
bash webui/scripts/e2e-phase1007.sh
bash webui/scripts/e2e-phase1008.sh
bash webui/scripts/e2e-phase1009.sh
bash webui/scripts/e2e-phase1010.sh
bash webui/scripts/e2e-phase1011.sh
bash webui/scripts/e2e-phase1012.sh
bash webui/scripts/e2e-phase1013.sh
bash webui/scripts/e2e-phase1014.sh
bash webui/scripts/e2e-phase1015.sh
bash webui/scripts/e2e-phase1016.sh
bash webui/scripts/e2e-phase1017.sh
bash webui/scripts/e2e-phase1018.sh
bash webui/scripts/e2e-phase1019.sh
bash webui/scripts/e2e-phase1020.sh
bash webui/scripts/e2e-phase1021.sh
bash webui/scripts/e2e-phase1022.sh
bash webui/scripts/e2e-phase1023.sh
bash webui/scripts/e2e-phase1024.sh
bash webui/scripts/e2e-phase1025.sh
bash webui/scripts/e2e-phase1026.sh
bash webui/scripts/e2e-phase1027.sh
bash webui/scripts/e2e-phase1028.sh
bash webui/scripts/e2e-phase1029.sh
bash webui/scripts/e2e-phase1030.sh
bash webui/scripts/e2e-phase1031.sh
bash webui/scripts/e2e-phase1032.sh
bash webui/scripts/e2e-phase1033.sh
bash webui/scripts/e2e-phase1034.sh
bash webui/scripts/e2e-phase1035.sh
bash webui/scripts/e2e-phase1036.sh
bash webui/scripts/e2e-phase1037.sh
bash webui/scripts/e2e-phase1038.sh
bash webui/scripts/e2e-phase1039.sh
bash webui/scripts/e2e-phase1040.sh
bash webui/scripts/e2e-phase1041.sh
bash webui/scripts/e2e-phase1042.sh
bash webui/scripts/e2e-phase1043.sh
bash webui/scripts/e2e-phase1044.sh
bash webui/scripts/e2e-phase1045.sh
bash webui/scripts/e2e-phase1046.sh
bash webui/scripts/e2e-phase1047.sh
bash webui/scripts/e2e-phase1048.sh
bash webui/scripts/e2e-phase1049.sh
bash webui/scripts/e2e-phase1050.sh
bash webui/scripts/e2e-phase1051.sh
bash webui/scripts/e2e-phase1052.sh
bash webui/scripts/e2e-phase1053.sh
bash webui/scripts/e2e-phase1054.sh
bash webui/scripts/e2e-phase1055.sh
bash webui/scripts/e2e-phase1056.sh
bash webui/scripts/e2e-phase1057.sh
bash webui/scripts/e2e-phase1058.sh
bash webui/scripts/e2e-phase1059.sh
bash webui/scripts/e2e-phase1060.sh
bash webui/scripts/e2e-phase1061.sh
bash webui/scripts/e2e-phase1062.sh
bash webui/scripts/e2e-phase1063.sh
bash webui/scripts/e2e-phase1064.sh
bash webui/scripts/e2e-phase1065.sh
bash webui/scripts/e2e-phase1066.sh
bash webui/scripts/e2e-phase1067.sh
bash webui/scripts/e2e-phase1068.sh
bash webui/scripts/e2e-phase1069.sh
bash webui/scripts/e2e-phase1070.sh
bash webui/scripts/e2e-phase1071.sh
bash webui/scripts/e2e-phase1072.sh
bash webui/scripts/e2e-phase1073.sh
bash webui/scripts/e2e-phase1074.sh
bash webui/scripts/e2e-phase1075.sh
bash webui/scripts/e2e-phase1076.sh
bash webui/scripts/e2e-phase1077.sh
bash webui/scripts/e2e-phase1078.sh
bash webui/scripts/e2e-phase1079.sh
bash webui/scripts/e2e-phase1080.sh
bash webui/scripts/e2e-phase1081.sh
bash webui/scripts/e2e-phase1082.sh
bash webui/scripts/e2e-phase1083.sh
bash webui/scripts/e2e-phase1084.sh
bash webui/scripts/e2e-phase1085.sh
bash webui/scripts/e2e-phase1086.sh
bash webui/scripts/e2e-phase1087.sh
bash webui/scripts/e2e-phase1088.sh
bash webui/scripts/e2e-phase1089.sh
bash webui/scripts/e2e-phase1090.sh
bash webui/scripts/e2e-phase1091.sh
bash webui/scripts/e2e-phase1092.sh
bash webui/scripts/e2e-phase1093.sh
bash webui/scripts/e2e-phase1094.sh
bash webui/scripts/e2e-phase1095.sh
bash webui/scripts/e2e-phase1096.sh
bash webui/scripts/e2e-phase1097.sh
bash webui/scripts/e2e-phase1098.sh
bash webui/scripts/e2e-phase1099.sh
bash webui/scripts/e2e-phase1100.sh
bash webui/scripts/e2e-phase1101.sh
bash webui/scripts/e2e-phase1102.sh
bash webui/scripts/e2e-phase1103.sh
bash webui/scripts/e2e-phase1104.sh
bash webui/scripts/e2e-phase1105.sh
bash webui/scripts/e2e-phase1106.sh
bash webui/scripts/e2e-phase1107.sh
bash webui/scripts/e2e-phase1108.sh
bash webui/scripts/e2e-phase1109.sh
bash webui/scripts/e2e-phase1110.sh
bash webui/scripts/e2e-phase1111.sh
bash webui/scripts/e2e-phase1112.sh
bash webui/scripts/e2e-phase1113.sh
bash webui/scripts/e2e-phase1114.sh
bash webui/scripts/e2e-phase1115.sh
bash webui/scripts/e2e-phase1116.sh
bash webui/scripts/e2e-phase1117.sh
bash webui/scripts/e2e-phase1118.sh
bash webui/scripts/e2e-phase1119.sh
bash webui/scripts/e2e-phase1120.sh
bash webui/scripts/e2e-phase1121.sh
bash webui/scripts/e2e-phase1122.sh
bash webui/scripts/e2e-phase1123.sh
bash webui/scripts/e2e-phase1124.sh
bash webui/scripts/e2e-phase1125.sh
bash webui/scripts/e2e-phase1126.sh
bash webui/scripts/e2e-phase1127.sh
bash webui/scripts/e2e-phase1128.sh
bash webui/scripts/e2e-phase1129.sh
bash webui/scripts/e2e-phase1130.sh
bash webui/scripts/e2e-phase1131.sh
bash webui/scripts/e2e-phase1132.sh
bash webui/scripts/e2e-phase1133.sh
bash webui/scripts/e2e-phase1134.sh
bash webui/scripts/e2e-phase1135.sh
bash webui/scripts/e2e-phase1136.sh
bash webui/scripts/e2e-phase1137.sh
bash webui/scripts/e2e-phase1138.sh
bash webui/scripts/e2e-phase1139.sh
bash webui/scripts/e2e-phase1140.sh
bash webui/scripts/e2e-phase1141.sh
bash webui/scripts/e2e-phase1142.sh
bash webui/scripts/e2e-phase1143.sh
bash webui/scripts/e2e-phase1144.sh
bash webui/scripts/e2e-phase1145.sh
bash webui/scripts/e2e-phase1146.sh
bash webui/scripts/e2e-phase1147.sh
bash webui/scripts/e2e-phase1148.sh
bash webui/scripts/e2e-phase1149.sh
bash webui/scripts/e2e-phase1150.sh
bash webui/scripts/e2e-phase1151.sh
bash webui/scripts/e2e-phase1152.sh
bash webui/scripts/e2e-phase1153.sh
bash webui/scripts/e2e-phase1154.sh
bash webui/scripts/e2e-phase1155.sh
bash webui/scripts/e2e-phase1156.sh
bash webui/scripts/e2e-phase1157.sh
bash webui/scripts/e2e-phase1158.sh
bash webui/scripts/e2e-phase1159.sh
bash webui/scripts/e2e-phase1160.sh
bash webui/scripts/e2e-phase1161.sh
bash webui/scripts/e2e-phase1162.sh
bash webui/scripts/e2e-phase1163.sh
bash webui/scripts/e2e-phase1164.sh
bash webui/scripts/e2e-phase1165.sh
bash webui/scripts/e2e-phase1166.sh
bash webui/scripts/e2e-phase1167.sh
bash webui/scripts/e2e-phase1168.sh
bash webui/scripts/e2e-phase1169.sh
bash webui/scripts/e2e-phase1170.sh
bash webui/scripts/e2e-phase1171.sh
bash webui/scripts/e2e-phase1172.sh
bash webui/scripts/e2e-phase1173.sh
bash webui/scripts/e2e-phase1174.sh
bash webui/scripts/e2e-phase1175.sh
bash webui/scripts/e2e-phase1176.sh
bash webui/scripts/e2e-phase1177.sh
bash webui/scripts/e2e-phase1178.sh
bash webui/scripts/e2e-phase1179.sh
bash webui/scripts/e2e-phase1180.sh
bash webui/scripts/e2e-phase1181.sh
bash webui/scripts/e2e-phase1182.sh
bash webui/scripts/e2e-phase1183.sh
bash webui/scripts/e2e-phase1184.sh
bash webui/scripts/e2e-phase1185.sh
bash webui/scripts/e2e-phase1186.sh
bash webui/scripts/e2e-phase1187.sh
bash webui/scripts/e2e-phase1188.sh
bash webui/scripts/e2e-phase1189.sh
bash webui/scripts/e2e-phase1190.sh
bash webui/scripts/e2e-phase1191.sh
bash webui/scripts/e2e-phase1192.sh
bash webui/scripts/e2e-phase1193.sh
bash webui/scripts/e2e-phase1194.sh
bash webui/scripts/e2e-phase1195.sh
bash webui/scripts/e2e-phase1196.sh
bash webui/scripts/e2e-phase1197.sh
bash webui/scripts/e2e-phase1198.sh
bash webui/scripts/e2e-phase1199.sh
bash webui/scripts/e2e-phase1200.sh
bash webui/scripts/e2e-phase1201.sh
bash webui/scripts/e2e-phase1202.sh
bash webui/scripts/e2e-phase1203.sh
bash webui/scripts/e2e-phase1204.sh
bash webui/scripts/e2e-phase1205.sh
bash webui/scripts/e2e-phase1206.sh
bash webui/scripts/e2e-phase1207.sh
bash webui/scripts/e2e-phase1208.sh
bash webui/scripts/e2e-phase1209.sh
bash webui/scripts/e2e-phase1210.sh
bash webui/scripts/e2e-phase1211.sh
bash webui/scripts/e2e-phase1212.sh
bash webui/scripts/e2e-phase1213.sh
bash webui/scripts/e2e-phase1214.sh
bash webui/scripts/e2e-phase1215.sh
bash webui/scripts/e2e-phase1216.sh
bash webui/scripts/e2e-phase1217.sh
bash webui/scripts/e2e-phase1218.sh
bash webui/scripts/e2e-phase1219.sh
bash webui/scripts/e2e-phase1220.sh
bash webui/scripts/e2e-phase1221.sh
bash webui/scripts/e2e-phase1222.sh
bash webui/scripts/e2e-phase1223.sh
bash webui/scripts/e2e-phase1224.sh
bash webui/scripts/e2e-phase1225.sh
bash webui/scripts/e2e-phase1226.sh
bash webui/scripts/e2e-phase1227.sh
bash webui/scripts/e2e-phase1228.sh
bash webui/scripts/e2e-phase1229.sh
bash webui/scripts/e2e-phase1230.sh
bash webui/scripts/e2e-phase1231.sh
bash webui/scripts/e2e-phase1232.sh
bash webui/scripts/e2e-phase1233.sh
bash webui/scripts/e2e-phase1234.sh
bash webui/scripts/e2e-phase1235.sh
bash webui/scripts/e2e-phase1236.sh
bash webui/scripts/e2e-phase1237.sh
bash webui/scripts/e2e-phase1238.sh
bash webui/scripts/e2e-phase1239.sh
bash webui/scripts/e2e-phase1240.sh
bash webui/scripts/e2e-phase1241.sh
bash webui/scripts/e2e-phase1242.sh
bash webui/scripts/e2e-phase1243.sh
bash webui/scripts/e2e-phase1244.sh
bash webui/scripts/e2e-phase1245.sh
bash webui/scripts/e2e-phase1246.sh
bash webui/scripts/e2e-phase1247.sh
bash webui/scripts/e2e-phase1248.sh
bash webui/scripts/e2e-phase1249.sh
bash webui/scripts/e2e-phase1250.sh
bash webui/scripts/e2e-phase1251.sh
bash webui/scripts/e2e-phase1252.sh
bash webui/scripts/e2e-phase1253.sh
bash webui/scripts/e2e-phase1254.sh
bash webui/scripts/e2e-phase1255.sh
bash webui/scripts/e2e-phase1256.sh
bash webui/scripts/e2e-phase1257.sh
bash webui/scripts/e2e-phase1258.sh
bash webui/scripts/e2e-phase1259.sh
bash webui/scripts/e2e-phase1260.sh
bash webui/scripts/e2e-phase1261.sh
bash webui/scripts/e2e-phase1262.sh
bash webui/scripts/e2e-phase1263.sh
bash webui/scripts/e2e-phase1264.sh
bash webui/scripts/e2e-phase1265.sh
bash webui/scripts/e2e-phase1266.sh
bash webui/scripts/e2e-phase1267.sh
bash webui/scripts/e2e-phase1268.sh
bash webui/scripts/e2e-phase1269.sh
bash webui/scripts/e2e-phase1270.sh
bash webui/scripts/e2e-phase1271.sh
bash webui/scripts/e2e-phase1272.sh
bash webui/scripts/e2e-phase1273.sh
bash webui/scripts/e2e-phase1274.sh
bash webui/scripts/e2e-phase1275.sh
bash webui/scripts/e2e-phase1276.sh
bash webui/scripts/e2e-phase1277.sh
bash webui/scripts/e2e-phase1278.sh
bash webui/scripts/e2e-phase1279.sh
bash webui/scripts/e2e-phase1280.sh
bash webui/scripts/e2e-phase1281.sh
bash webui/scripts/e2e-phase1282.sh
bash webui/scripts/e2e-phase1283.sh
bash webui/scripts/e2e-phase1284.sh
bash webui/scripts/e2e-phase1285.sh
bash webui/scripts/e2e-phase1286.sh
bash webui/scripts/e2e-phase1287.sh
bash webui/scripts/e2e-phase1288.sh
bash webui/scripts/e2e-phase1289.sh
bash webui/scripts/e2e-phase1290.sh
bash webui/scripts/e2e-phase1291.sh
bash webui/scripts/e2e-phase1292.sh
bash webui/scripts/e2e-phase1293.sh
bash webui/scripts/e2e-phase1294.sh
bash webui/scripts/e2e-phase1295.sh
bash webui/scripts/e2e-phase1296.sh
bash webui/scripts/e2e-phase1297.sh
bash webui/scripts/e2e-phase1298.sh
bash webui/scripts/e2e-phase1299.sh
bash webui/scripts/e2e-phase1300.sh
bash webui/scripts/e2e-phase1301.sh
bash webui/scripts/e2e-phase1302.sh
bash webui/scripts/e2e-phase1303.sh
bash webui/scripts/e2e-phase1304.sh
bash webui/scripts/e2e-phase1305.sh
bash webui/scripts/e2e-phase1306.sh
bash webui/scripts/e2e-phase1307.sh
bash webui/scripts/e2e-phase1308.sh
bash webui/scripts/e2e-phase1309.sh
bash webui/scripts/e2e-phase1310.sh
bash webui/scripts/e2e-phase1311.sh
bash webui/scripts/e2e-phase1312.sh
bash webui/scripts/e2e-phase1313.sh
bash webui/scripts/e2e-phase1314.sh
bash webui/scripts/e2e-phase1315.sh
bash webui/scripts/e2e-phase1316.sh
bash webui/scripts/e2e-phase1317.sh
bash webui/scripts/e2e-phase1318.sh
bash webui/scripts/e2e-phase1319.sh
bash webui/scripts/e2e-phase1320.sh
bash webui/scripts/e2e-phase1321.sh
bash webui/scripts/e2e-phase1322.sh
bash webui/scripts/e2e-phase1323.sh
bash webui/scripts/e2e-phase1324.sh
bash webui/scripts/e2e-phase1325.sh
bash webui/scripts/e2e-phase1326.sh
bash webui/scripts/e2e-phase1327.sh
bash webui/scripts/e2e-phase1328.sh
bash webui/scripts/e2e-phase1329.sh
bash webui/scripts/e2e-phase1330.sh
bash webui/scripts/e2e-phase1331.sh
bash webui/scripts/e2e-phase1332.sh
bash webui/scripts/e2e-phase1333.sh
bash webui/scripts/e2e-phase1334.sh
bash webui/scripts/e2e-phase1335.sh
bash webui/scripts/e2e-phase1336.sh
bash webui/scripts/e2e-phase1337.sh
bash webui/scripts/e2e-phase1338.sh
bash webui/scripts/e2e-phase1339.sh
bash webui/scripts/e2e-phase1340.sh
bash webui/scripts/e2e-phase1341.sh
bash webui/scripts/e2e-phase1342.sh
bash webui/scripts/e2e-phase1343.sh
bash webui/scripts/e2e-phase1344.sh
bash webui/scripts/e2e-phase1345.sh
bash webui/scripts/e2e-phase1346.sh
bash webui/scripts/e2e-phase1347.sh
bash webui/scripts/e2e-phase1348.sh
bash webui/scripts/e2e-phase1349.sh
bash webui/scripts/e2e-phase1350.sh
bash webui/scripts/e2e-phase1351.sh
bash webui/scripts/e2e-phase1352.sh
bash webui/scripts/e2e-phase1353.sh
bash webui/scripts/e2e-phase1354.sh
bash webui/scripts/e2e-phase1355.sh
bash webui/scripts/e2e-phase1356.sh
bash webui/scripts/e2e-phase1357.sh
bash webui/scripts/e2e-phase1358.sh
bash webui/scripts/e2e-phase1359.sh
bash webui/scripts/e2e-phase1360.sh
bash webui/scripts/e2e-phase1361.sh
bash webui/scripts/e2e-phase1362.sh
bash webui/scripts/e2e-phase1363.sh
bash webui/scripts/e2e-phase1364.sh
bash webui/scripts/e2e-phase1365.sh
bash webui/scripts/e2e-phase1366.sh
bash webui/scripts/e2e-phase1367.sh
bash webui/scripts/e2e-phase1368.sh
bash webui/scripts/e2e-phase1369.sh
bash webui/scripts/e2e-phase1370.sh
bash webui/scripts/e2e-phase1371.sh
bash webui/scripts/e2e-phase1372.sh
bash webui/scripts/e2e-phase1373.sh
bash webui/scripts/e2e-phase1374.sh
bash webui/scripts/e2e-phase1375.sh
bash webui/scripts/e2e-phase1376.sh
bash webui/scripts/e2e-phase1377.sh
bash webui/scripts/e2e-phase1378.sh
bash webui/scripts/e2e-phase1379.sh
bash webui/scripts/e2e-phase1380.sh
bash webui/scripts/e2e-phase1381.sh
bash webui/scripts/e2e-phase1382.sh
bash webui/scripts/e2e-phase1383.sh
bash webui/scripts/e2e-phase1384.sh
bash webui/scripts/e2e-phase1385.sh
bash webui/scripts/e2e-phase1386.sh
bash webui/scripts/e2e-phase1387.sh
bash webui/scripts/e2e-phase1388.sh
bash webui/scripts/e2e-phase1389.sh
bash webui/scripts/e2e-phase1390.sh
bash webui/scripts/e2e-phase1391.sh
bash webui/scripts/e2e-phase1392.sh
bash webui/scripts/e2e-phase1393.sh
bash webui/scripts/e2e-phase1394.sh
bash webui/scripts/e2e-phase1395.sh
bash webui/scripts/e2e-phase1396.sh
bash webui/scripts/e2e-phase1397.sh
bash webui/scripts/e2e-phase1398.sh
bash webui/scripts/e2e-phase1399.sh
bash webui/scripts/e2e-phase1400.sh
bash webui/scripts/e2e-phase1401.sh
bash webui/scripts/e2e-phase1402.sh
bash webui/scripts/e2e-phase1403.sh
bash webui/scripts/e2e-phase1404.sh
bash webui/scripts/e2e-phase1405.sh
bash webui/scripts/e2e-phase1406.sh
bash webui/scripts/e2e-phase1407.sh
bash webui/scripts/e2e-phase1408.sh
bash webui/scripts/e2e-phase1409.sh
bash webui/scripts/e2e-phase1410.sh
bash webui/scripts/e2e-phase1411.sh
bash webui/scripts/e2e-phase1412.sh
bash webui/scripts/e2e-phase1413.sh
bash webui/scripts/e2e-phase1414.sh
bash webui/scripts/e2e-phase1415.sh
bash webui/scripts/e2e-phase1416.sh
bash webui/scripts/e2e-phase1417.sh
bash webui/scripts/e2e-phase1418.sh
bash webui/scripts/e2e-phase1419.sh
bash webui/scripts/e2e-phase1420.sh
bash webui/scripts/e2e-phase1421.sh
bash webui/scripts/e2e-phase1422.sh
bash webui/scripts/e2e-phase1423.sh
bash webui/scripts/e2e-phase1424.sh
bash webui/scripts/e2e-phase1425.sh
bash webui/scripts/e2e-phase1426.sh
bash webui/scripts/e2e-phase1427.sh
bash webui/scripts/e2e-phase1428.sh
bash webui/scripts/e2e-phase1429.sh
bash webui/scripts/e2e-phase1430.sh
bash webui/scripts/e2e-phase1431.sh
bash webui/scripts/e2e-phase1432.sh
bash webui/scripts/e2e-phase1433.sh
bash webui/scripts/e2e-phase1434.sh
bash webui/scripts/e2e-phase1435.sh
bash webui/scripts/e2e-phase1436.sh
bash webui/scripts/e2e-phase1437.sh
bash webui/scripts/e2e-phase1438.sh
bash webui/scripts/e2e-phase1439.sh
bash webui/scripts/e2e-phase1440.sh
bash webui/scripts/e2e-phase1441.sh
bash webui/scripts/e2e-phase1442.sh
bash webui/scripts/e2e-phase1443.sh
bash webui/scripts/e2e-phase1444.sh
bash webui/scripts/e2e-phase1445.sh
bash webui/scripts/e2e-phase1446.sh
bash webui/scripts/e2e-phase1447.sh
bash webui/scripts/e2e-phase1448.sh
bash webui/scripts/e2e-phase1449.sh
bash webui/scripts/e2e-phase1450.sh
bash webui/scripts/e2e-phase1451.sh
bash webui/scripts/e2e-phase1452.sh
bash webui/scripts/e2e-phase1453.sh
bash webui/scripts/e2e-phase1454.sh
bash webui/scripts/e2e-phase1455.sh
bash webui/scripts/e2e-phase1456.sh
bash webui/scripts/e2e-phase1457.sh
bash webui/scripts/e2e-phase1458.sh
bash webui/scripts/e2e-phase1459.sh
bash webui/scripts/e2e-phase1460.sh
bash webui/scripts/e2e-phase1461.sh
bash webui/scripts/e2e-phase1462.sh
bash webui/scripts/e2e-phase1463.sh
bash webui/scripts/e2e-phase1464.sh
bash webui/scripts/e2e-phase1465.sh
bash webui/scripts/e2e-phase1466.sh
bash webui/scripts/e2e-phase1467.sh
bash webui/scripts/e2e-phase1468.sh
bash webui/scripts/e2e-phase1469.sh
bash webui/scripts/e2e-phase1470.sh
bash webui/scripts/e2e-phase1471.sh
bash webui/scripts/e2e-phase1472.sh
bash webui/scripts/e2e-phase1473.sh
bash webui/scripts/e2e-phase1474.sh
bash webui/scripts/e2e-phase1475.sh
bash webui/scripts/e2e-phase1476.sh
bash webui/scripts/e2e-phase1477.sh
bash webui/scripts/e2e-phase1478.sh
bash webui/scripts/e2e-phase1479.sh
bash webui/scripts/e2e-phase1480.sh
bash webui/scripts/e2e-phase1481.sh
bash webui/scripts/e2e-phase1482.sh
bash webui/scripts/e2e-phase1483.sh
bash webui/scripts/e2e-phase1484.sh
bash webui/scripts/e2e-phase1485.sh
bash webui/scripts/e2e-phase1486.sh
bash webui/scripts/e2e-phase1487.sh
bash webui/scripts/e2e-phase1488.sh
bash webui/scripts/e2e-phase1489.sh
bash webui/scripts/e2e-phase1490.sh
bash webui/scripts/e2e-phase1491.sh
bash webui/scripts/e2e-phase1492.sh
bash webui/scripts/e2e-phase1493.sh
bash webui/scripts/e2e-phase1494.sh
bash webui/scripts/e2e-phase1495.sh
bash webui/scripts/e2e-phase1496.sh
bash webui/scripts/e2e-phase1497.sh
bash webui/scripts/e2e-phase1498.sh
bash webui/scripts/e2e-phase1499.sh
bash webui/scripts/e2e-phase1500.sh
bash webui/scripts/e2e-phase1501.sh
bash webui/scripts/e2e-phase1502.sh
bash webui/scripts/e2e-phase1503.sh
bash webui/scripts/e2e-phase1504.sh
bash webui/scripts/e2e-phase1505.sh
bash webui/scripts/e2e-phase1506.sh
bash webui/scripts/e2e-phase1507.sh
bash webui/scripts/e2e-phase1508.sh
bash webui/scripts/e2e-phase1509.sh
bash webui/scripts/e2e-phase1510.sh
bash webui/scripts/e2e-phase1511.sh
bash webui/scripts/e2e-phase1512.sh
bash webui/scripts/e2e-phase1513.sh
bash webui/scripts/e2e-phase1514.sh
bash webui/scripts/e2e-phase1515.sh
bash webui/scripts/e2e-phase1516.sh
bash webui/scripts/e2e-phase1517.sh
bash webui/scripts/e2e-phase1518.sh
bash webui/scripts/e2e-phase1519.sh
bash webui/scripts/e2e-phase1520.sh
bash webui/scripts/e2e-phase1521.sh
bash webui/scripts/e2e-phase1522.sh
bash webui/scripts/e2e-phase1523.sh
bash webui/scripts/e2e-phase1524.sh
bash webui/scripts/e2e-phase1525.sh
bash webui/scripts/e2e-phase1526.sh
bash webui/scripts/e2e-phase1527.sh
bash webui/scripts/e2e-phase1528.sh
bash webui/scripts/e2e-phase1529.sh
bash webui/scripts/e2e-phase1530.sh
bash webui/scripts/e2e-phase1531.sh
bash webui/scripts/e2e-phase1532.sh
bash webui/scripts/e2e-phase1533.sh
bash webui/scripts/e2e-phase1534.sh
bash webui/scripts/e2e-phase1535.sh
bash webui/scripts/e2e-phase1536.sh
bash webui/scripts/e2e-phase1537.sh
bash webui/scripts/e2e-phase1538.sh
bash webui/scripts/e2e-phase1539.sh
bash webui/scripts/e2e-phase1540.sh
bash webui/scripts/e2e-phase1541.sh
bash webui/scripts/e2e-phase1542.sh
bash webui/scripts/e2e-phase1543.sh
bash webui/scripts/e2e-phase1544.sh
bash webui/scripts/e2e-phase1545.sh
bash webui/scripts/e2e-phase1546.sh
bash webui/scripts/e2e-phase1547.sh
bash webui/scripts/e2e-phase1548.sh
bash webui/scripts/e2e-phase1549.sh
bash webui/scripts/e2e-phase1550.sh
bash webui/scripts/e2e-phase1551.sh
bash webui/scripts/e2e-phase1552.sh
bash webui/scripts/e2e-phase1553.sh
bash webui/scripts/e2e-phase1554.sh
bash webui/scripts/e2e-phase1555.sh
bash webui/scripts/e2e-phase1556.sh
bash webui/scripts/e2e-phase1557.sh
bash webui/scripts/e2e-phase1558.sh
bash webui/scripts/e2e-phase1559.sh
bash webui/scripts/e2e-phase1560.sh
bash webui/scripts/e2e-phase1561.sh
bash webui/scripts/e2e-phase1562.sh
bash webui/scripts/e2e-phase1563.sh
bash webui/scripts/e2e-phase1564.sh
bash webui/scripts/e2e-phase1565.sh
bash webui/scripts/e2e-phase1566.sh
bash webui/scripts/e2e-phase1567.sh
bash webui/scripts/e2e-phase1568.sh
bash webui/scripts/e2e-phase1569.sh
bash webui/scripts/e2e-phase1570.sh
bash webui/scripts/e2e-phase1571.sh
bash webui/scripts/e2e-phase1572.sh
bash webui/scripts/e2e-phase1573.sh
bash webui/scripts/e2e-phase1574.sh
bash webui/scripts/e2e-phase1575.sh
bash webui/scripts/e2e-phase1576.sh
bash webui/scripts/e2e-phase1577.sh
bash webui/scripts/e2e-phase1578.sh
bash webui/scripts/e2e-phase1579.sh
bash webui/scripts/e2e-phase1580.sh
bash webui/scripts/e2e-phase1581.sh
bash webui/scripts/e2e-phase1582.sh
bash webui/scripts/e2e-phase1583.sh
bash webui/scripts/e2e-phase1584.sh
bash webui/scripts/e2e-phase1585.sh
bash webui/scripts/e2e-phase1586.sh
bash webui/scripts/e2e-phase1587.sh
bash webui/scripts/e2e-phase1588.sh
bash webui/scripts/e2e-phase1589.sh
bash webui/scripts/e2e-phase1590.sh
bash webui/scripts/e2e-phase1591.sh
bash webui/scripts/e2e-phase1592.sh
bash webui/scripts/e2e-phase1593.sh
bash webui/scripts/e2e-phase1594.sh
bash webui/scripts/e2e-phase1595.sh
bash webui/scripts/e2e-phase1596.sh
bash webui/scripts/e2e-phase1597.sh
bash webui/scripts/e2e-phase1598.sh
bash webui/scripts/e2e-phase1599.sh
bash webui/scripts/e2e-phase1600.sh
bash webui/scripts/e2e-phase1601.sh
bash webui/scripts/e2e-phase1602.sh
bash webui/scripts/e2e-phase1603.sh
bash webui/scripts/e2e-phase1604.sh
bash webui/scripts/e2e-phase1605.sh
bash webui/scripts/e2e-phase1606.sh
bash webui/scripts/e2e-phase1607.sh
bash webui/scripts/e2e-phase1608.sh
bash webui/scripts/e2e-phase1609.sh
bash webui/scripts/e2e-phase1610.sh
bash webui/scripts/e2e-phase1611.sh
bash webui/scripts/e2e-phase1612.sh
bash webui/scripts/e2e-phase1613.sh
bash webui/scripts/e2e-phase1614.sh
bash webui/scripts/e2e-phase1615.sh
bash webui/scripts/e2e-phase1616.sh
bash webui/scripts/e2e-phase1617.sh
bash webui/scripts/e2e-phase1618.sh
bash webui/scripts/e2e-phase1619.sh
bash webui/scripts/e2e-phase1620.sh
bash webui/scripts/e2e-phase1621.sh
bash webui/scripts/e2e-phase1622.sh
bash webui/scripts/e2e-phase1623.sh
bash webui/scripts/e2e-phase1624.sh
bash webui/scripts/e2e-phase1625.sh
bash webui/scripts/e2e-phase1626.sh
bash webui/scripts/e2e-phase1627.sh
bash webui/scripts/e2e-phase1628.sh
bash webui/scripts/e2e-phase1629.sh
bash webui/scripts/e2e-phase1630.sh
bash webui/scripts/e2e-phase1631.sh
bash webui/scripts/e2e-phase1632.sh
bash webui/scripts/e2e-phase1633.sh
bash webui/scripts/e2e-phase1634.sh
bash webui/scripts/e2e-phase1635.sh
bash webui/scripts/e2e-phase1636.sh
bash webui/scripts/e2e-phase1637.sh
bash webui/scripts/e2e-phase1638.sh
bash webui/scripts/e2e-phase1639.sh
bash webui/scripts/e2e-phase1640.sh
bash webui/scripts/e2e-phase1641.sh
bash webui/scripts/e2e-phase1642.sh
bash webui/scripts/e2e-phase1643.sh
bash webui/scripts/e2e-phase1644.sh
bash webui/scripts/e2e-phase1645.sh
bash webui/scripts/e2e-phase1646.sh
bash webui/scripts/e2e-phase1647.sh
bash webui/scripts/e2e-phase1648.sh
bash webui/scripts/e2e-phase1649.sh
bash webui/scripts/e2e-phase1650.sh
bash webui/scripts/e2e-phase1651.sh
bash webui/scripts/e2e-phase1652.sh
bash webui/scripts/e2e-phase1653.sh
bash webui/scripts/e2e-phase1654.sh
bash webui/scripts/e2e-phase1655.sh
bash webui/scripts/e2e-phase1656.sh
bash webui/scripts/e2e-phase1657.sh
bash webui/scripts/e2e-phase1658.sh
bash webui/scripts/e2e-phase1659.sh
bash webui/scripts/e2e-phase1660.sh
bash webui/scripts/e2e-phase1661.sh
bash webui/scripts/e2e-phase1662.sh
bash webui/scripts/e2e-phase1663.sh
bash webui/scripts/e2e-phase1664.sh
bash webui/scripts/e2e-phase1665.sh
bash webui/scripts/e2e-phase1666.sh
bash webui/scripts/e2e-phase1667.sh
bash webui/scripts/e2e-phase1668.sh
bash webui/scripts/e2e-phase1669.sh
bash webui/scripts/e2e-phase1670.sh
bash webui/scripts/e2e-phase1671.sh
bash webui/scripts/e2e-phase1672.sh
bash webui/scripts/e2e-phase1673.sh
bash webui/scripts/e2e-phase1674.sh
bash webui/scripts/e2e-phase1675.sh
bash webui/scripts/e2e-phase1676.sh
bash webui/scripts/e2e-phase1677.sh
bash webui/scripts/e2e-phase1678.sh
bash webui/scripts/e2e-phase1679.sh
bash webui/scripts/e2e-phase1680.sh
bash webui/scripts/e2e-phase1681.sh
bash webui/scripts/e2e-phase1682.sh
bash webui/scripts/e2e-phase1683.sh
bash webui/scripts/e2e-phase1684.sh
bash webui/scripts/e2e-phase1685.sh
bash webui/scripts/e2e-phase1686.sh
bash webui/scripts/e2e-phase1687.sh
bash webui/scripts/e2e-phase1688.sh
bash webui/scripts/e2e-phase1689.sh
bash webui/scripts/e2e-phase1690.sh
bash webui/scripts/e2e-phase1691.sh
bash webui/scripts/e2e-phase1692.sh
bash webui/scripts/e2e-phase1693.sh
bash webui/scripts/e2e-phase1694.sh
bash webui/scripts/e2e-phase1695.sh
bash webui/scripts/e2e-phase1696.sh
bash webui/scripts/e2e-phase1697.sh
bash webui/scripts/e2e-phase1698.sh
bash webui/scripts/e2e-phase1699.sh
bash webui/scripts/e2e-phase1700.sh
bash webui/scripts/e2e-phase1701.sh
bash webui/scripts/e2e-phase1702.sh
bash webui/scripts/e2e-phase1703.sh
bash webui/scripts/e2e-phase1704.sh
bash webui/scripts/e2e-phase1705.sh
bash webui/scripts/e2e-phase1706.sh
bash webui/scripts/e2e-phase1707.sh
bash webui/scripts/e2e-phase1708.sh
bash webui/scripts/e2e-phase1709.sh
bash webui/scripts/e2e-phase1710.sh
bash webui/scripts/e2e-phase1711.sh
bash webui/scripts/e2e-phase1712.sh
bash webui/scripts/e2e-phase1713.sh
bash webui/scripts/e2e-phase1714.sh
bash webui/scripts/e2e-phase1715.sh
bash webui/scripts/e2e-phase1716.sh
bash webui/scripts/e2e-phase1717.sh
bash webui/scripts/e2e-phase1718.sh
bash webui/scripts/e2e-phase1719.sh
bash webui/scripts/e2e-phase1720.sh
bash webui/scripts/e2e-phase1721.sh
bash webui/scripts/e2e-phase1722.sh
bash webui/scripts/e2e-phase1723.sh
bash webui/scripts/e2e-phase1724.sh
bash webui/scripts/e2e-phase1725.sh
bash webui/scripts/e2e-phase1726.sh
bash webui/scripts/e2e-phase1727.sh
bash webui/scripts/e2e-phase1728.sh
bash webui/scripts/e2e-phase1729.sh
bash webui/scripts/e2e-phase1730.sh
bash webui/scripts/e2e-phase1731.sh
bash webui/scripts/e2e-phase1732.sh
bash webui/scripts/e2e-phase1733.sh
bash webui/scripts/e2e-phase1734.sh
bash webui/scripts/e2e-phase1735.sh
bash webui/scripts/e2e-phase1736.sh
bash webui/scripts/e2e-phase1737.sh
bash webui/scripts/e2e-phase1738.sh
bash webui/scripts/e2e-phase1739.sh
bash webui/scripts/e2e-phase1740.sh
bash webui/scripts/e2e-phase1741.sh
bash webui/scripts/e2e-phase1742.sh
bash webui/scripts/e2e-phase1743.sh
bash webui/scripts/e2e-phase1744.sh
bash webui/scripts/e2e-phase1745.sh
bash webui/scripts/e2e-phase1746.sh
bash webui/scripts/e2e-phase1747.sh
bash webui/scripts/e2e-phase1748.sh
bash webui/scripts/e2e-phase1749.sh
bash webui/scripts/e2e-phase1750.sh
bash webui/scripts/e2e-phase1751.sh
bash webui/scripts/e2e-phase1752.sh
bash webui/scripts/e2e-phase1753.sh
bash webui/scripts/e2e-phase1754.sh
bash webui/scripts/e2e-phase1755.sh
bash webui/scripts/e2e-phase1756.sh
bash webui/scripts/e2e-phase1757.sh
bash webui/scripts/e2e-phase1758.sh
bash webui/scripts/e2e-phase1759.sh
bash webui/scripts/e2e-phase1760.sh
bash webui/scripts/e2e-phase1761.sh
bash webui/scripts/e2e-phase1762.sh
bash webui/scripts/e2e-phase1763.sh
bash webui/scripts/e2e-phase1764.sh
bash webui/scripts/e2e-phase1765.sh
bash webui/scripts/e2e-phase1766.sh
bash webui/scripts/e2e-phase1767.sh
bash webui/scripts/e2e-phase1768.sh
bash webui/scripts/e2e-phase1769.sh
bash webui/scripts/e2e-phase1770.sh
bash webui/scripts/e2e-phase1771.sh
bash webui/scripts/e2e-phase1772.sh
bash webui/scripts/e2e-phase1773.sh
bash webui/scripts/e2e-phase1774.sh
bash webui/scripts/e2e-phase1775.sh
bash webui/scripts/e2e-phase1776.sh
bash webui/scripts/e2e-phase1777.sh
bash webui/scripts/e2e-phase1778.sh
bash webui/scripts/e2e-phase1779.sh
bash webui/scripts/e2e-phase1780.sh
bash webui/scripts/e2e-phase1781.sh
bash webui/scripts/e2e-phase1782.sh
bash webui/scripts/e2e-phase1783.sh
bash webui/scripts/e2e-phase1784.sh
bash webui/scripts/e2e-phase1785.sh
bash webui/scripts/e2e-phase1786.sh
bash webui/scripts/e2e-phase1787.sh
bash webui/scripts/e2e-phase1788.sh
bash webui/scripts/e2e-phase1789.sh
bash webui/scripts/e2e-phase1790.sh
bash webui/scripts/e2e-phase1791.sh
bash webui/scripts/e2e-phase1792.sh
bash webui/scripts/e2e-phase1793.sh
bash webui/scripts/e2e-phase1794.sh
bash webui/scripts/e2e-phase1795.sh
bash webui/scripts/e2e-phase1796.sh
bash webui/scripts/e2e-phase1797.sh
bash webui/scripts/e2e-phase1798.sh
bash webui/scripts/e2e-phase1799.sh
bash webui/scripts/e2e-phase1800.sh
bash webui/scripts/e2e-phase1801.sh
bash webui/scripts/e2e-phase1802.sh
bash webui/scripts/e2e-phase1803.sh
bash webui/scripts/e2e-phase1804.sh
bash webui/scripts/e2e-phase1805.sh
bash webui/scripts/e2e-phase1806.sh
bash webui/scripts/e2e-phase1807.sh
bash webui/scripts/e2e-phase1808.sh
bash webui/scripts/e2e-phase1809.sh
bash webui/scripts/e2e-phase1810.sh
bash webui/scripts/e2e-phase1811.sh
bash webui/scripts/e2e-phase1812.sh
bash webui/scripts/e2e-phase1813.sh
bash webui/scripts/e2e-phase1814.sh
bash webui/scripts/e2e-phase1815.sh
bash webui/scripts/e2e-phase1816.sh
bash webui/scripts/e2e-phase1817.sh
bash webui/scripts/e2e-phase1818.sh
bash webui/scripts/e2e-phase1819.sh
bash webui/scripts/e2e-phase1820.sh
bash webui/scripts/e2e-phase1821.sh
bash webui/scripts/e2e-phase1822.sh
bash webui/scripts/e2e-phase1823.sh
bash webui/scripts/e2e-phase1824.sh
bash webui/scripts/e2e-phase1825.sh
bash webui/scripts/e2e-phase1826.sh
bash webui/scripts/e2e-phase1827.sh
bash webui/scripts/e2e-phase1828.sh
bash webui/scripts/e2e-phase1829.sh
bash webui/scripts/e2e-phase1830.sh
bash webui/scripts/e2e-phase1831.sh
bash webui/scripts/e2e-phase1832.sh
bash webui/scripts/e2e-phase1833.sh
bash webui/scripts/e2e-phase1834.sh
bash webui/scripts/e2e-phase1835.sh
bash webui/scripts/e2e-phase1836.sh
bash webui/scripts/e2e-phase1837.sh
bash webui/scripts/e2e-phase1838.sh
bash webui/scripts/e2e-phase1839.sh
bash webui/scripts/e2e-phase1840.sh
bash webui/scripts/e2e-phase1841.sh
bash webui/scripts/e2e-phase1842.sh
bash webui/scripts/e2e-phase1843.sh
bash webui/scripts/e2e-phase1844.sh
bash webui/scripts/e2e-phase1845.sh
bash webui/scripts/e2e-phase1846.sh
bash webui/scripts/e2e-phase1847.sh
bash webui/scripts/e2e-phase1848.sh
bash webui/scripts/e2e-phase1849.sh
bash webui/scripts/e2e-phase1850.sh
bash webui/scripts/e2e-phase1851.sh
bash webui/scripts/e2e-phase1852.sh
bash webui/scripts/e2e-phase1853.sh
bash webui/scripts/e2e-phase1854.sh
bash webui/scripts/e2e-phase1855.sh
bash webui/scripts/e2e-phase1856.sh
bash webui/scripts/e2e-phase1857.sh
bash webui/scripts/e2e-phase1858.sh
bash webui/scripts/e2e-phase1859.sh
bash webui/scripts/e2e-phase1860.sh
bash webui/scripts/e2e-phase1861.sh
bash webui/scripts/e2e-phase1862.sh
bash webui/scripts/e2e-phase1863.sh
bash webui/scripts/e2e-phase1864.sh
bash webui/scripts/e2e-phase1865.sh
bash webui/scripts/e2e-phase1866.sh
bash webui/scripts/e2e-phase1867.sh
bash webui/scripts/e2e-phase1868.sh
bash webui/scripts/e2e-phase1869.sh
bash webui/scripts/e2e-phase1870.sh
bash webui/scripts/e2e-phase1871.sh
bash webui/scripts/e2e-phase1872.sh
bash webui/scripts/e2e-phase1873.sh
bash webui/scripts/e2e-phase1874.sh
bash webui/scripts/e2e-phase1875.sh
bash webui/scripts/e2e-phase1876.sh
bash webui/scripts/e2e-phase1877.sh
bash webui/scripts/e2e-phase1878.sh
bash webui/scripts/e2e-phase1879.sh
bash webui/scripts/e2e-phase1880.sh
bash webui/scripts/e2e-phase1881.sh
bash webui/scripts/e2e-phase1882.sh
bash webui/scripts/e2e-phase1883.sh
bash webui/scripts/e2e-phase1884.sh
bash webui/scripts/e2e-phase1885.sh
bash webui/scripts/e2e-phase1886.sh
bash webui/scripts/e2e-phase1887.sh
bash webui/scripts/e2e-phase1888.sh
bash webui/scripts/e2e-phase1889.sh
bash webui/scripts/e2e-phase1890.sh
bash webui/scripts/e2e-phase1891.sh
bash webui/scripts/e2e-phase1892.sh
bash webui/scripts/e2e-phase1893.sh
bash webui/scripts/e2e-phase1894.sh
bash webui/scripts/e2e-phase1895.sh
bash webui/scripts/e2e-phase1896.sh
bash webui/scripts/e2e-phase1897.sh
bash webui/scripts/e2e-phase1898.sh
bash webui/scripts/e2e-phase1899.sh
bash webui/scripts/e2e-phase1900.sh
bash webui/scripts/e2e-phase1901.sh
bash webui/scripts/e2e-phase1902.sh
bash webui/scripts/e2e-phase1903.sh
bash webui/scripts/e2e-phase1904.sh
bash webui/scripts/e2e-phase1905.sh
bash webui/scripts/e2e-phase1906.sh
bash webui/scripts/e2e-phase1907.sh
bash webui/scripts/e2e-phase1908.sh
bash webui/scripts/e2e-phase1909.sh
bash webui/scripts/e2e-phase1910.sh
bash webui/scripts/e2e-phase1911.sh
bash webui/scripts/e2e-phase1912.sh
bash webui/scripts/e2e-phase1913.sh
bash webui/scripts/e2e-phase1914.sh
bash webui/scripts/e2e-phase1915.sh
bash webui/scripts/e2e-phase1916.sh
bash webui/scripts/e2e-phase1917.sh
bash webui/scripts/e2e-phase1918.sh
bash webui/scripts/e2e-phase1919.sh
bash webui/scripts/e2e-phase1920.sh
bash webui/scripts/e2e-phase1921.sh
bash webui/scripts/e2e-phase1922.sh
bash webui/scripts/e2e-phase1923.sh
bash webui/scripts/e2e-phase1924.sh
bash webui/scripts/e2e-phase1925.sh
bash webui/scripts/e2e-phase1926.sh
bash webui/scripts/e2e-phase1927.sh
bash webui/scripts/e2e-phase1928.sh
bash webui/scripts/e2e-phase1929.sh
bash webui/scripts/e2e-phase1930.sh
bash webui/scripts/e2e-phase1931.sh
bash webui/scripts/e2e-phase1932.sh
bash webui/scripts/e2e-phase1933.sh
bash webui/scripts/e2e-phase1934.sh
bash webui/scripts/e2e-phase1935.sh
bash webui/scripts/e2e-phase1936.sh
bash webui/scripts/e2e-phase1937.sh
bash webui/scripts/e2e-phase1938.sh
bash webui/scripts/e2e-phase1939.sh
bash webui/scripts/e2e-phase1940.sh
bash webui/scripts/e2e-phase1941.sh
bash webui/scripts/e2e-phase1942.sh
bash webui/scripts/e2e-phase1943.sh
bash webui/scripts/e2e-phase1944.sh
bash webui/scripts/e2e-phase1945.sh
bash webui/scripts/e2e-phase1946.sh
bash webui/scripts/e2e-phase1947.sh
bash webui/scripts/e2e-phase1948.sh
bash webui/scripts/e2e-phase1949.sh
bash webui/scripts/e2e-phase1950.sh
bash webui/scripts/e2e-phase1951.sh
bash webui/scripts/e2e-phase1952.sh
bash webui/scripts/e2e-phase1953.sh
bash webui/scripts/e2e-phase1954.sh
bash webui/scripts/e2e-phase1955.sh
bash webui/scripts/e2e-phase1956.sh
bash webui/scripts/e2e-phase1957.sh
bash webui/scripts/e2e-phase1958.sh
bash webui/scripts/e2e-phase1959.sh
bash webui/scripts/e2e-phase1960.sh
bash webui/scripts/e2e-phase1961.sh
bash webui/scripts/e2e-phase1962.sh
bash webui/scripts/e2e-phase1963.sh
bash webui/scripts/e2e-phase1964.sh
bash webui/scripts/e2e-phase1965.sh
bash webui/scripts/e2e-phase1966.sh
bash webui/scripts/e2e-phase1967.sh
bash webui/scripts/e2e-phase1968.sh
bash webui/scripts/e2e-phase1969.sh
bash webui/scripts/e2e-phase1970.sh
bash webui/scripts/e2e-phase1971.sh
bash webui/scripts/e2e-phase1972.sh
bash webui/scripts/e2e-phase1973.sh
bash webui/scripts/e2e-phase1974.sh
bash webui/scripts/e2e-phase1975.sh
bash webui/scripts/e2e-phase1976.sh
bash webui/scripts/e2e-phase1977.sh
bash webui/scripts/e2e-phase1978.sh
bash webui/scripts/e2e-phase1979.sh
bash webui/scripts/e2e-phase1980.sh
bash webui/scripts/e2e-phase1981.sh
bash webui/scripts/e2e-phase1982.sh
bash webui/scripts/e2e-phase1983.sh
bash webui/scripts/e2e-phase1984.sh
bash webui/scripts/e2e-phase1985.sh
bash webui/scripts/e2e-phase1986.sh
bash webui/scripts/e2e-phase1987.sh
bash webui/scripts/e2e-phase1988.sh
bash webui/scripts/e2e-phase1989.sh
bash webui/scripts/e2e-phase1990.sh
bash webui/scripts/e2e-phase1991.sh
bash webui/scripts/e2e-phase1992.sh
bash webui/scripts/e2e-phase1993.sh
bash webui/scripts/e2e-phase1994.sh
bash webui/scripts/e2e-phase1995.sh
bash webui/scripts/e2e-phase1996.sh
bash webui/scripts/e2e-phase1997.sh
bash webui/scripts/e2e-phase1998.sh
bash webui/scripts/e2e-phase1999.sh
bash webui/scripts/e2e-phase2000.sh
bash webui/scripts/e2e-phase2001.sh
bash webui/scripts/e2e-phase2002.sh
bash webui/scripts/e2e-phase2003.sh
bash webui/scripts/e2e-phase2004.sh
bash webui/scripts/e2e-phase2005.sh
bash webui/scripts/e2e-phase2006.sh
bash webui/scripts/e2e-phase2007.sh
bash webui/scripts/e2e-phase2008.sh
bash webui/scripts/e2e-phase2009.sh
bash webui/scripts/e2e-phase2010.sh
bash webui/scripts/e2e-phase2011.sh
bash webui/scripts/e2e-phase2012.sh
bash webui/scripts/e2e-phase2013.sh
bash webui/scripts/e2e-phase2014.sh
bash webui/scripts/e2e-phase2015.sh
bash webui/scripts/e2e-phase2016.sh
bash webui/scripts/e2e-phase2017.sh
bash webui/scripts/e2e-phase2018.sh
bash webui/scripts/e2e-phase2019.sh
bash webui/scripts/e2e-phase2020.sh
bash webui/scripts/e2e-phase2021.sh
bash webui/scripts/e2e-phase2022.sh
bash webui/scripts/e2e-phase2023.sh
bash webui/scripts/e2e-phase2024.sh
bash webui/scripts/e2e-phase2025.sh
bash webui/scripts/e2e-phase2026.sh
bash webui/scripts/e2e-phase2027.sh
bash webui/scripts/e2e-phase2028.sh
bash webui/scripts/e2e-phase2029.sh
bash webui/scripts/e2e-phase2030.sh
bash webui/scripts/e2e-phase2031.sh
bash webui/scripts/e2e-phase2032.sh
bash webui/scripts/e2e-phase2033.sh
bash webui/scripts/e2e-phase2034.sh
bash webui/scripts/e2e-phase2035.sh
bash webui/scripts/e2e-phase2036.sh
bash webui/scripts/e2e-phase2037.sh
bash webui/scripts/e2e-phase2038.sh
bash webui/scripts/e2e-phase2039.sh
bash webui/scripts/e2e-phase2040.sh
bash webui/scripts/e2e-phase2041.sh
bash webui/scripts/e2e-phase2042.sh
bash webui/scripts/e2e-phase2043.sh
bash webui/scripts/e2e-phase2044.sh
bash webui/scripts/e2e-phase2045.sh
bash webui/scripts/e2e-phase2046.sh
bash webui/scripts/e2e-phase2047.sh
bash webui/scripts/e2e-phase2048.sh
bash webui/scripts/e2e-phase2049.sh
bash webui/scripts/e2e-phase2050.sh
bash webui/scripts/e2e-phase2051.sh
bash webui/scripts/e2e-phase2052.sh
bash webui/scripts/e2e-phase2053.sh
bash webui/scripts/e2e-phase2054.sh
bash webui/scripts/e2e-phase2055.sh
bash webui/scripts/e2e-phase2056.sh
bash webui/scripts/e2e-phase2057.sh
bash webui/scripts/e2e-phase2058.sh
bash webui/scripts/e2e-phase2059.sh
bash webui/scripts/e2e-phase2060.sh
bash webui/scripts/e2e-phase2061.sh
bash webui/scripts/e2e-phase2062.sh
bash webui/scripts/e2e-phase2063.sh
bash webui/scripts/e2e-phase2064.sh
bash webui/scripts/e2e-phase2065.sh
bash webui/scripts/e2e-phase2066.sh
bash webui/scripts/e2e-phase2067.sh
bash webui/scripts/e2e-phase2068.sh
bash webui/scripts/e2e-phase2069.sh
bash webui/scripts/e2e-phase2070.sh
bash webui/scripts/e2e-phase2071.sh
bash webui/scripts/e2e-phase2072.sh
bash webui/scripts/e2e-phase2073.sh
bash webui/scripts/e2e-phase2074.sh
bash webui/scripts/e2e-phase2075.sh
bash webui/scripts/e2e-phase2076.sh
bash webui/scripts/e2e-phase2077.sh
bash webui/scripts/e2e-phase2078.sh
bash webui/scripts/e2e-phase2079.sh
bash webui/scripts/e2e-phase2080.sh
bash webui/scripts/e2e-phase2081.sh
bash webui/scripts/e2e-phase2082.sh
bash webui/scripts/e2e-phase2083.sh
bash webui/scripts/e2e-phase2084.sh
bash webui/scripts/e2e-phase2085.sh
bash webui/scripts/e2e-phase2086.sh
bash webui/scripts/e2e-phase2087.sh
bash webui/scripts/e2e-phase2088.sh
bash webui/scripts/e2e-phase2089.sh
bash webui/scripts/e2e-phase2090.sh
bash webui/scripts/e2e-phase2091.sh
bash webui/scripts/e2e-phase2092.sh
bash webui/scripts/e2e-phase2093.sh
bash webui/scripts/e2e-phase2094.sh
bash webui/scripts/e2e-phase2095.sh
bash webui/scripts/e2e-phase2096.sh
bash webui/scripts/e2e-phase2097.sh
bash webui/scripts/e2e-phase2098.sh
bash webui/scripts/e2e-phase2099.sh
bash webui/scripts/e2e-phase2100.sh
bash webui/scripts/e2e-phase2101.sh
bash webui/scripts/e2e-phase2102.sh
bash webui/scripts/e2e-phase2103.sh
bash webui/scripts/e2e-phase2104.sh
bash webui/scripts/e2e-phase2105.sh
bash webui/scripts/e2e-phase2106.sh
bash webui/scripts/e2e-phase2107.sh
bash webui/scripts/e2e-phase2108.sh
bash webui/scripts/e2e-phase2109.sh
bash webui/scripts/e2e-phase2110.sh
bash webui/scripts/e2e-phase2111.sh
bash webui/scripts/e2e-phase2112.sh
bash webui/scripts/e2e-phase2113.sh
bash webui/scripts/e2e-phase2114.sh
bash webui/scripts/e2e-phase2115.sh
bash webui/scripts/e2e-phase2116.sh
bash webui/scripts/e2e-phase2117.sh
bash webui/scripts/e2e-phase2118.sh
bash webui/scripts/e2e-phase2119.sh
bash webui/scripts/e2e-phase2120.sh
bash webui/scripts/e2e-phase2121.sh
bash webui/scripts/e2e-phase2122.sh
bash webui/scripts/e2e-phase2123.sh
bash webui/scripts/e2e-phase2124.sh
bash webui/scripts/e2e-phase2125.sh
bash webui/scripts/e2e-phase2126.sh
bash webui/scripts/e2e-phase2127.sh
bash webui/scripts/e2e-phase2128.sh
bash webui/scripts/e2e-phase2129.sh
bash webui/scripts/e2e-phase2130.sh
bash webui/scripts/e2e-phase2131.sh
bash webui/scripts/e2e-phase2132.sh
bash webui/scripts/e2e-phase2133.sh
bash webui/scripts/e2e-phase2134.sh
bash webui/scripts/e2e-phase2135.sh
bash webui/scripts/e2e-phase2136.sh
bash webui/scripts/e2e-phase2137.sh
bash webui/scripts/e2e-phase2138.sh
bash webui/scripts/e2e-phase2139.sh
bash webui/scripts/e2e-phase2140.sh
bash webui/scripts/e2e-phase2141.sh
bash webui/scripts/e2e-phase2142.sh
bash webui/scripts/e2e-phase2143.sh
bash webui/scripts/e2e-phase2144.sh
bash webui/scripts/e2e-phase2145.sh
bash webui/scripts/e2e-phase2146.sh
bash webui/scripts/e2e-phase2147.sh
bash webui/scripts/e2e-phase2148.sh
bash webui/scripts/e2e-phase2149.sh
bash webui/scripts/e2e-phase2150.sh
bash webui/scripts/e2e-phase2151.sh
bash webui/scripts/e2e-phase2152.sh
bash webui/scripts/e2e-phase2153.sh
bash webui/scripts/e2e-phase2154.sh
bash webui/scripts/e2e-phase2155.sh
bash webui/scripts/e2e-phase2156.sh
bash webui/scripts/e2e-phase2157.sh
bash webui/scripts/e2e-phase2158.sh
bash webui/scripts/e2e-phase2159.sh
bash webui/scripts/e2e-phase2160.sh
bash webui/scripts/e2e-phase2161.sh
bash webui/scripts/e2e-phase2162.sh
bash webui/scripts/e2e-phase2163.sh
bash webui/scripts/e2e-phase2164.sh
bash webui/scripts/e2e-phase2165.sh
bash webui/scripts/e2e-phase2166.sh
bash webui/scripts/e2e-phase2167.sh
bash webui/scripts/e2e-phase2168.sh
bash webui/scripts/e2e-phase2169.sh
bash webui/scripts/e2e-phase2170.sh
bash webui/scripts/e2e-phase2171.sh
bash webui/scripts/e2e-phase2172.sh
bash webui/scripts/e2e-phase2173.sh
bash webui/scripts/e2e-phase2174.sh
bash webui/scripts/e2e-phase2175.sh
bash webui/scripts/e2e-phase2176.sh
bash webui/scripts/e2e-phase2177.sh
bash webui/scripts/e2e-phase2178.sh
bash webui/scripts/e2e-phase2179.sh
bash webui/scripts/e2e-phase2180.sh
bash webui/scripts/e2e-phase2181.sh
bash webui/scripts/e2e-phase2182.sh
bash webui/scripts/e2e-phase2183.sh
bash webui/scripts/e2e-phase2184.sh
bash webui/scripts/e2e-phase2185.sh
bash webui/scripts/e2e-phase2186.sh
bash webui/scripts/e2e-phase2187.sh
bash webui/scripts/e2e-phase2188.sh
bash webui/scripts/e2e-phase2189.sh
bash webui/scripts/e2e-phase2190.sh
bash webui/scripts/e2e-phase2191.sh
bash webui/scripts/e2e-phase2192.sh
bash webui/scripts/e2e-phase2193.sh
bash webui/scripts/e2e-phase2194.sh
bash webui/scripts/e2e-phase2195.sh
bash webui/scripts/e2e-phase2196.sh
bash webui/scripts/e2e-phase2197.sh
bash webui/scripts/e2e-phase2198.sh
bash webui/scripts/e2e-phase2199.sh
bash webui/scripts/e2e-phase2200.sh
bash webui/scripts/e2e-phase2201.sh
bash webui/scripts/e2e-phase2202.sh
bash webui/scripts/e2e-phase2203.sh
bash webui/scripts/e2e-phase2204.sh
bash webui/scripts/e2e-phase2205.sh
bash webui/scripts/e2e-phase2206.sh
bash webui/scripts/e2e-phase2207.sh
bash webui/scripts/e2e-phase2208.sh
bash webui/scripts/e2e-phase2209.sh
bash webui/scripts/e2e-phase2210.sh
bash webui/scripts/e2e-phase2211.sh
bash webui/scripts/e2e-phase2212.sh
bash webui/scripts/e2e-phase2213.sh
bash webui/scripts/e2e-phase2214.sh
bash webui/scripts/e2e-phase2215.sh
bash webui/scripts/e2e-phase2216.sh
bash webui/scripts/e2e-phase2217.sh
bash webui/scripts/e2e-phase2218.sh
bash webui/scripts/e2e-phase2219.sh
bash webui/scripts/e2e-phase2220.sh
bash webui/scripts/e2e-phase2221.sh
bash webui/scripts/e2e-phase2222.sh
bash webui/scripts/e2e-phase2223.sh
bash webui/scripts/e2e-phase2224.sh
bash webui/scripts/e2e-phase2225.sh
bash webui/scripts/e2e-phase2226.sh
bash webui/scripts/e2e-phase2227.sh
bash webui/scripts/e2e-phase2228.sh
bash webui/scripts/e2e-phase2229.sh
bash webui/scripts/e2e-phase2230.sh
bash webui/scripts/e2e-phase2231.sh
bash webui/scripts/e2e-phase2232.sh
bash webui/scripts/e2e-phase2233.sh
bash webui/scripts/e2e-phase2234.sh
bash webui/scripts/e2e-phase2235.sh
bash webui/scripts/e2e-phase2236.sh
bash webui/scripts/e2e-phase2237.sh
bash webui/scripts/e2e-phase2238.sh
bash webui/scripts/e2e-phase2239.sh
bash webui/scripts/e2e-phase2240.sh
bash webui/scripts/e2e-phase2241.sh
bash webui/scripts/e2e-phase2242.sh
bash webui/scripts/e2e-phase2243.sh
bash webui/scripts/e2e-phase2244.sh
bash webui/scripts/e2e-phase2245.sh
bash webui/scripts/e2e-phase2246.sh
bash webui/scripts/e2e-phase2247.sh
bash webui/scripts/e2e-phase2248.sh
bash webui/scripts/e2e-phase2249.sh
bash webui/scripts/e2e-phase2250.sh
bash webui/scripts/e2e-phase2251.sh
bash webui/scripts/e2e-phase2252.sh
bash webui/scripts/e2e-phase2253.sh
bash webui/scripts/e2e-phase2254.sh
bash webui/scripts/e2e-phase2255.sh
bash webui/scripts/e2e-phase2256.sh
bash webui/scripts/e2e-phase2257.sh
bash webui/scripts/e2e-phase2258.sh
bash webui/scripts/e2e-phase2259.sh
bash webui/scripts/e2e-phase2260.sh
bash webui/scripts/e2e-phase2261.sh
bash webui/scripts/e2e-phase2262.sh
bash webui/scripts/e2e-phase2263.sh
bash webui/scripts/e2e-phase2264.sh
bash webui/scripts/e2e-phase2265.sh
bash webui/scripts/e2e-phase2266.sh
bash webui/scripts/e2e-phase2267.sh
bash webui/scripts/e2e-phase2268.sh
bash webui/scripts/e2e-phase2269.sh
bash webui/scripts/e2e-phase2270.sh
bash webui/scripts/e2e-phase2271.sh
bash webui/scripts/e2e-phase2272.sh
bash webui/scripts/e2e-phase2273.sh
bash webui/scripts/e2e-phase2274.sh
bash webui/scripts/e2e-phase2275.sh
bash webui/scripts/e2e-phase2276.sh
bash webui/scripts/e2e-phase2277.sh
bash webui/scripts/e2e-phase2278.sh
bash webui/scripts/e2e-phase2279.sh
bash webui/scripts/e2e-phase2280.sh
bash webui/scripts/e2e-phase2281.sh
bash webui/scripts/e2e-phase2282.sh
bash webui/scripts/e2e-phase2283.sh
bash webui/scripts/e2e-phase2284.sh
bash webui/scripts/e2e-phase2285.sh
bash webui/scripts/e2e-phase2286.sh
bash webui/scripts/e2e-phase2287.sh
bash webui/scripts/e2e-phase2288.sh
bash webui/scripts/e2e-phase2289.sh
bash webui/scripts/e2e-phase2290.sh
bash webui/scripts/e2e-phase2291.sh
bash webui/scripts/e2e-phase2292.sh
bash webui/scripts/e2e-phase2293.sh
bash webui/scripts/e2e-phase2294.sh
bash webui/scripts/e2e-phase2295.sh
bash webui/scripts/e2e-phase2296.sh
bash webui/scripts/e2e-phase2297.sh
bash webui/scripts/e2e-phase2298.sh
bash webui/scripts/e2e-phase2299.sh
bash webui/scripts/e2e-phase2300.sh
bash webui/scripts/e2e-phase2301.sh
bash webui/scripts/e2e-phase2302.sh
bash webui/scripts/e2e-phase2303.sh
bash webui/scripts/e2e-phase2304.sh
bash webui/scripts/e2e-phase2305.sh
bash webui/scripts/e2e-phase2306.sh
bash webui/scripts/e2e-phase2307.sh
bash webui/scripts/e2e-phase2308.sh
bash webui/scripts/e2e-phase2309.sh
bash webui/scripts/e2e-phase2310.sh
bash webui/scripts/e2e-phase2311.sh
bash webui/scripts/e2e-phase2312.sh
bash webui/scripts/e2e-phase2313.sh
bash webui/scripts/e2e-phase2314.sh
bash webui/scripts/e2e-phase2315.sh
bash webui/scripts/e2e-phase2316.sh
bash webui/scripts/e2e-phase2317.sh
bash webui/scripts/e2e-phase2318.sh
bash webui/scripts/e2e-phase2319.sh
bash webui/scripts/e2e-phase2320.sh
bash webui/scripts/e2e-phase2321.sh
bash webui/scripts/e2e-phase2322.sh
bash webui/scripts/e2e-phase2323.sh
bash webui/scripts/e2e-phase2324.sh
bash webui/scripts/e2e-phase2325.sh
bash webui/scripts/e2e-phase2326.sh
bash webui/scripts/e2e-phase2327.sh
bash webui/scripts/e2e-phase2328.sh
bash webui/scripts/e2e-phase2329.sh
bash webui/scripts/e2e-phase2330.sh
bash webui/scripts/e2e-phase2331.sh
bash webui/scripts/e2e-phase2332.sh
bash webui/scripts/e2e-phase2333.sh
bash webui/scripts/e2e-phase2334.sh
bash webui/scripts/e2e-phase2335.sh
bash webui/scripts/e2e-phase2336.sh
bash webui/scripts/e2e-phase2337.sh
bash webui/scripts/e2e-phase2338.sh
bash webui/scripts/e2e-phase2339.sh
bash webui/scripts/e2e-phase2340.sh
bash webui/scripts/e2e-phase2341.sh
bash webui/scripts/e2e-phase2342.sh
bash webui/scripts/e2e-phase2343.sh
bash webui/scripts/e2e-phase2344.sh
bash webui/scripts/e2e-phase2345.sh
bash webui/scripts/e2e-phase2346.sh
bash webui/scripts/e2e-phase2347.sh
bash webui/scripts/e2e-phase2348.sh
bash webui/scripts/e2e-phase2349.sh
bash webui/scripts/e2e-phase2350.sh
bash webui/scripts/e2e-phase2351.sh
bash webui/scripts/e2e-phase2352.sh
bash webui/scripts/e2e-phase2353.sh
bash webui/scripts/e2e-phase2354.sh
bash webui/scripts/e2e-phase2355.sh
bash webui/scripts/e2e-phase2356.sh
bash webui/scripts/e2e-phase2357.sh
bash webui/scripts/e2e-phase2358.sh
bash webui/scripts/e2e-phase2359.sh
bash webui/scripts/e2e-phase2360.sh
bash webui/scripts/e2e-phase2361.sh
bash webui/scripts/e2e-phase2362.sh
bash webui/scripts/e2e-phase2363.sh
bash webui/scripts/e2e-phase2364.sh
bash webui/scripts/e2e-phase2365.sh
bash webui/scripts/e2e-phase2366.sh
bash webui/scripts/e2e-phase2367.sh
bash webui/scripts/e2e-phase2368.sh
bash webui/scripts/e2e-phase2369.sh
bash webui/scripts/e2e-phase2370.sh
bash webui/scripts/e2e-phase2371.sh
bash webui/scripts/e2e-phase2372.sh
bash webui/scripts/e2e-phase2373.sh
bash webui/scripts/e2e-phase2374.sh
bash webui/scripts/e2e-phase2375.sh
bash webui/scripts/e2e-phase2376.sh
bash webui/scripts/e2e-phase2377.sh
bash webui/scripts/e2e-phase2378.sh
bash webui/scripts/e2e-phase2379.sh
bash webui/scripts/e2e-phase2380.sh
bash webui/scripts/e2e-phase2381.sh
bash webui/scripts/e2e-phase2382.sh
bash webui/scripts/e2e-phase2383.sh
bash webui/scripts/e2e-phase2384.sh
bash webui/scripts/e2e-phase2385.sh
bash webui/scripts/e2e-phase2386.sh
bash webui/scripts/e2e-phase2387.sh
bash webui/scripts/e2e-phase2388.sh
bash webui/scripts/e2e-phase2389.sh
bash webui/scripts/e2e-phase2390.sh
bash webui/scripts/e2e-phase2391.sh
bash webui/scripts/e2e-phase2392.sh
bash webui/scripts/e2e-phase2393.sh
bash webui/scripts/e2e-phase2394.sh
bash webui/scripts/e2e-phase2395.sh
bash webui/scripts/e2e-phase2396.sh
bash webui/scripts/e2e-phase2397.sh
bash webui/scripts/e2e-phase2398.sh
bash webui/scripts/e2e-phase2399.sh
bash webui/scripts/e2e-phase2400.sh
bash webui/scripts/e2e-phase2401.sh
bash webui/scripts/e2e-phase2402.sh
bash webui/scripts/e2e-phase2403.sh
bash webui/scripts/e2e-phase2404.sh
bash webui/scripts/e2e-phase2405.sh
bash webui/scripts/e2e-phase2406.sh
bash webui/scripts/e2e-phase2407.sh
bash webui/scripts/e2e-phase2408.sh
bash webui/scripts/e2e-phase2409.sh
bash webui/scripts/e2e-phase2410.sh
bash webui/scripts/e2e-phase2411.sh
bash webui/scripts/e2e-phase2412.sh
bash webui/scripts/e2e-phase2413.sh
bash webui/scripts/e2e-phase2414.sh
bash webui/scripts/e2e-phase2415.sh
bash webui/scripts/e2e-phase2416.sh
bash webui/scripts/e2e-phase2417.sh
bash webui/scripts/e2e-phase2418.sh
bash webui/scripts/e2e-phase2419.sh
bash webui/scripts/e2e-phase2420.sh
bash webui/scripts/e2e-phase2421.sh
bash webui/scripts/e2e-phase2422.sh
bash webui/scripts/e2e-phase2423.sh
bash webui/scripts/e2e-phase2424.sh
bash webui/scripts/e2e-phase2425.sh
bash webui/scripts/e2e-phase2426.sh
bash webui/scripts/e2e-phase2427.sh
bash webui/scripts/e2e-phase2428.sh
bash webui/scripts/e2e-phase2429.sh
bash webui/scripts/e2e-phase2430.sh
bash webui/scripts/e2e-phase2431.sh
bash webui/scripts/e2e-phase2432.sh
bash webui/scripts/e2e-phase2433.sh
bash webui/scripts/e2e-phase2434.sh
bash webui/scripts/e2e-phase2435.sh
bash webui/scripts/e2e-phase2436.sh
bash webui/scripts/e2e-phase2437.sh
bash webui/scripts/e2e-phase2438.sh
bash webui/scripts/e2e-phase2439.sh
bash webui/scripts/e2e-phase2440.sh
bash webui/scripts/e2e-phase2441.sh
bash webui/scripts/e2e-phase2442.sh
bash webui/scripts/e2e-phase2443.sh
bash webui/scripts/e2e-phase2444.sh
bash webui/scripts/e2e-phase2445.sh
bash webui/scripts/e2e-phase2446.sh
bash webui/scripts/e2e-phase2447.sh
bash webui/scripts/e2e-phase2448.sh
bash webui/scripts/e2e-phase2449.sh
bash webui/scripts/e2e-phase2450.sh
bash webui/scripts/e2e-phase2451.sh
bash webui/scripts/e2e-phase2452.sh
bash webui/scripts/e2e-phase2453.sh
bash webui/scripts/e2e-phase2454.sh
bash webui/scripts/e2e-phase2455.sh
bash webui/scripts/e2e-phase2456.sh
bash webui/scripts/e2e-phase2457.sh
bash webui/scripts/e2e-phase2458.sh
bash webui/scripts/e2e-phase2459.sh
bash webui/scripts/e2e-phase2460.sh
bash webui/scripts/e2e-phase2461.sh
bash webui/scripts/e2e-phase2462.sh
bash webui/scripts/e2e-phase2463.sh
bash webui/scripts/e2e-phase2464.sh
bash webui/scripts/e2e-phase2465.sh
bash webui/scripts/e2e-phase2466.sh
bash webui/scripts/e2e-phase2467.sh
bash webui/scripts/e2e-phase2468.sh
bash webui/scripts/e2e-phase2469.sh
bash webui/scripts/e2e-phase2470.sh
bash webui/scripts/e2e-phase2471.sh
bash webui/scripts/e2e-phase2472.sh
bash webui/scripts/e2e-phase2473.sh
bash webui/scripts/e2e-phase2474.sh
bash webui/scripts/e2e-phase2475.sh
bash webui/scripts/e2e-phase2476.sh
bash webui/scripts/e2e-phase2477.sh
bash webui/scripts/e2e-phase2478.sh
bash webui/scripts/e2e-phase2479.sh
bash webui/scripts/e2e-phase2480.sh
bash webui/scripts/e2e-phase2481.sh
bash webui/scripts/e2e-phase2482.sh
bash webui/scripts/e2e-phase2483.sh
bash webui/scripts/e2e-phase2484.sh
bash webui/scripts/e2e-phase2485.sh
bash webui/scripts/e2e-phase2486.sh
bash webui/scripts/e2e-phase2487.sh
bash webui/scripts/e2e-phase2488.sh
bash webui/scripts/e2e-phase2489.sh
bash webui/scripts/e2e-phase2490.sh
bash webui/scripts/e2e-phase2491.sh
bash webui/scripts/e2e-phase2492.sh
bash webui/scripts/e2e-phase2493.sh
bash webui/scripts/e2e-phase2494.sh
bash webui/scripts/e2e-phase2495.sh
bash webui/scripts/e2e-phase2496.sh
bash webui/scripts/e2e-phase2497.sh
bash webui/scripts/e2e-phase2498.sh
bash webui/scripts/e2e-phase2499.sh
bash webui/scripts/e2e-phase2500.sh
bash webui/scripts/e2e-phase2501.sh
bash webui/scripts/e2e-phase2502.sh
bash webui/scripts/e2e-phase2503.sh
bash webui/scripts/e2e-phase2504.sh
bash webui/scripts/e2e-phase2505.sh
bash webui/scripts/e2e-phase2506.sh
bash webui/scripts/e2e-phase2507.sh
bash webui/scripts/e2e-phase2508.sh
bash webui/scripts/e2e-phase2509.sh
bash webui/scripts/e2e-phase2510.sh
bash webui/scripts/e2e-phase2511.sh
bash webui/scripts/e2e-phase2512.sh
bash webui/scripts/e2e-phase2513.sh
bash webui/scripts/e2e-phase2514.sh
bash webui/scripts/e2e-phase2515.sh
bash webui/scripts/e2e-phase2516.sh
bash webui/scripts/e2e-phase2517.sh
bash webui/scripts/e2e-phase2518.sh
bash webui/scripts/e2e-phase2519.sh
bash webui/scripts/e2e-phase2520.sh
bash webui/scripts/e2e-phase2521.sh
bash webui/scripts/e2e-phase2522.sh
bash webui/scripts/e2e-phase2523.sh
bash webui/scripts/e2e-phase2524.sh
bash webui/scripts/e2e-phase2525.sh
bash webui/scripts/e2e-phase2526.sh
bash webui/scripts/e2e-phase2527.sh
bash webui/scripts/e2e-phase2528.sh
bash webui/scripts/e2e-phase2529.sh
bash webui/scripts/e2e-phase2530.sh
bash webui/scripts/e2e-phase2531.sh
bash webui/scripts/e2e-phase2532.sh
bash webui/scripts/e2e-phase2533.sh
bash webui/scripts/e2e-phase2534.sh
bash webui/scripts/e2e-phase2535.sh
bash webui/scripts/e2e-phase2536.sh
bash webui/scripts/e2e-phase2537.sh
bash webui/scripts/e2e-phase2538.sh
bash webui/scripts/e2e-phase2539.sh
bash webui/scripts/e2e-phase2540.sh
bash webui/scripts/e2e-phase2541.sh
bash webui/scripts/e2e-phase2542.sh
bash webui/scripts/e2e-phase2543.sh
bash webui/scripts/e2e-phase2544.sh
bash webui/scripts/e2e-phase2545.sh
bash webui/scripts/e2e-phase2546.sh
bash webui/scripts/e2e-phase2547.sh
bash webui/scripts/e2e-phase2548.sh
bash webui/scripts/e2e-phase2549.sh
bash webui/scripts/e2e-phase2550.sh
bash webui/scripts/e2e-phase2551.sh
bash webui/scripts/e2e-phase2552.sh
bash webui/scripts/e2e-phase2553.sh
bash webui/scripts/e2e-phase2554.sh
bash webui/scripts/e2e-phase2555.sh
bash webui/scripts/e2e-phase2556.sh
bash webui/scripts/e2e-phase2557.sh
bash webui/scripts/e2e-phase2558.sh
bash webui/scripts/e2e-phase2559.sh
bash webui/scripts/e2e-phase2560.sh
bash webui/scripts/e2e-phase2561.sh
bash webui/scripts/e2e-phase2562.sh
bash webui/scripts/e2e-phase2563.sh
bash webui/scripts/e2e-phase2564.sh
bash webui/scripts/e2e-phase2565.sh
bash webui/scripts/e2e-phase2566.sh
bash webui/scripts/e2e-phase2567.sh
bash webui/scripts/e2e-phase2568.sh
bash webui/scripts/e2e-phase2569.sh
bash webui/scripts/e2e-phase2570.sh
bash webui/scripts/e2e-phase2571.sh
bash webui/scripts/e2e-phase2572.sh
bash webui/scripts/e2e-phase2573.sh
bash webui/scripts/e2e-phase2574.sh
bash webui/scripts/e2e-phase2575.sh
bash webui/scripts/e2e-phase2576.sh
bash webui/scripts/e2e-phase2577.sh
bash webui/scripts/e2e-phase2578.sh
bash webui/scripts/e2e-phase2579.sh
bash webui/scripts/e2e-phase2580.sh
bash webui/scripts/e2e-phase2581.sh
bash webui/scripts/e2e-phase2582.sh
bash webui/scripts/e2e-phase2583.sh
bash webui/scripts/e2e-phase2584.sh
bash webui/scripts/e2e-phase2585.sh
bash webui/scripts/e2e-phase2586.sh
bash webui/scripts/e2e-phase2587.sh
bash webui/scripts/e2e-phase2588.sh
bash webui/scripts/e2e-phase2589.sh
bash webui/scripts/e2e-phase2590.sh
bash webui/scripts/e2e-phase2591.sh
bash webui/scripts/e2e-phase2592.sh
bash webui/scripts/e2e-phase2593.sh
bash webui/scripts/e2e-phase2594.sh
bash webui/scripts/e2e-phase2595.sh
bash webui/scripts/e2e-phase2596.sh
bash webui/scripts/e2e-phase2597.sh
bash webui/scripts/e2e-phase2598.sh
bash webui/scripts/e2e-phase2599.sh
bash webui/scripts/e2e-phase2600.sh
bash webui/scripts/e2e-phase2601.sh
bash webui/scripts/e2e-phase2602.sh
bash webui/scripts/e2e-phase2603.sh
bash webui/scripts/e2e-phase2604.sh
bash webui/scripts/e2e-phase2605.sh
bash webui/scripts/e2e-phase2606.sh
bash webui/scripts/e2e-phase2607.sh
bash webui/scripts/e2e-phase2608.sh
bash webui/scripts/e2e-phase2609.sh
bash webui/scripts/e2e-phase2610.sh
bash webui/scripts/e2e-phase2611.sh
bash webui/scripts/e2e-phase2612.sh
bash webui/scripts/e2e-phase2613.sh
bash webui/scripts/e2e-phase2614.sh
bash webui/scripts/e2e-phase2615.sh
bash webui/scripts/e2e-phase2616.sh
bash webui/scripts/e2e-phase2617.sh
bash webui/scripts/e2e-phase2618.sh
bash webui/scripts/e2e-phase2619.sh
bash webui/scripts/e2e-phase2620.sh
bash webui/scripts/e2e-phase2621.sh
bash webui/scripts/e2e-phase2622.sh
bash webui/scripts/e2e-phase2623.sh
bash webui/scripts/e2e-phase2624.sh
bash webui/scripts/e2e-phase2625.sh
bash webui/scripts/e2e-phase2626.sh
bash webui/scripts/e2e-phase2627.sh
bash webui/scripts/e2e-phase2628.sh
bash webui/scripts/e2e-phase2629.sh
bash webui/scripts/e2e-phase2630.sh
bash webui/scripts/e2e-phase2631.sh
bash webui/scripts/e2e-phase2632.sh
bash webui/scripts/e2e-phase2633.sh
bash webui/scripts/e2e-phase2634.sh
bash webui/scripts/e2e-phase2635.sh
bash webui/scripts/e2e-phase2636.sh
bash webui/scripts/e2e-phase2637.sh
bash webui/scripts/e2e-phase2638.sh
bash webui/scripts/e2e-phase2639.sh
bash webui/scripts/e2e-phase2640.sh
bash webui/scripts/e2e-phase2641.sh
bash webui/scripts/e2e-phase2642.sh
bash webui/scripts/e2e-phase2643.sh
bash webui/scripts/e2e-phase2644.sh
bash webui/scripts/e2e-phase2645.sh
bash webui/scripts/e2e-phase2646.sh
bash webui/scripts/e2e-phase2647.sh
bash webui/scripts/e2e-phase2648.sh
bash webui/scripts/e2e-phase2649.sh
bash webui/scripts/e2e-phase2650.sh
bash webui/scripts/e2e-phase2651.sh
bash webui/scripts/e2e-phase2652.sh
bash webui/scripts/e2e-phase2653.sh
bash webui/scripts/e2e-phase2654.sh
bash webui/scripts/e2e-phase2655.sh
bash webui/scripts/e2e-phase2656.sh
bash webui/scripts/e2e-phase2657.sh
bash webui/scripts/e2e-phase2658.sh
bash webui/scripts/e2e-phase2659.sh
bash webui/scripts/e2e-phase2660.sh
bash webui/scripts/e2e-phase2661.sh
bash webui/scripts/e2e-phase2662.sh
bash webui/scripts/e2e-phase2663.sh
bash webui/scripts/e2e-phase2664.sh
bash webui/scripts/e2e-phase2665.sh
bash webui/scripts/e2e-phase2666.sh
bash webui/scripts/e2e-phase2667.sh
bash webui/scripts/e2e-phase2668.sh
bash webui/scripts/e2e-phase2669.sh
bash webui/scripts/e2e-phase2670.sh
bash webui/scripts/e2e-phase2671.sh
bash webui/scripts/e2e-phase2672.sh
bash webui/scripts/e2e-phase2673.sh
bash webui/scripts/e2e-phase2674.sh
bash webui/scripts/e2e-phase2675.sh
bash webui/scripts/e2e-phase2676.sh
bash webui/scripts/e2e-phase2677.sh
bash webui/scripts/e2e-phase2678.sh
bash webui/scripts/e2e-phase2679.sh
bash webui/scripts/e2e-phase2680.sh
bash webui/scripts/e2e-phase2681.sh
bash webui/scripts/e2e-phase2682.sh
bash webui/scripts/e2e-phase2683.sh
bash webui/scripts/e2e-phase2684.sh
bash webui/scripts/e2e-phase2685.sh
bash webui/scripts/e2e-phase2686.sh
bash webui/scripts/e2e-phase2687.sh
bash webui/scripts/e2e-phase2688.sh
bash webui/scripts/e2e-phase2689.sh
bash webui/scripts/e2e-phase2690.sh
bash webui/scripts/e2e-phase2691.sh
bash webui/scripts/e2e-phase2692.sh
bash webui/scripts/e2e-phase2693.sh
bash webui/scripts/e2e-phase2694.sh
bash webui/scripts/e2e-phase2695.sh
bash webui/scripts/e2e-phase2696.sh
bash webui/scripts/e2e-phase2697.sh
bash webui/scripts/e2e-phase2698.sh
bash webui/scripts/e2e-phase2699.sh
bash webui/scripts/e2e-phase2700.sh
bash webui/scripts/e2e-phase2701.sh
bash webui/scripts/e2e-phase2702.sh
bash webui/scripts/e2e-phase2703.sh
bash webui/scripts/e2e-phase2704.sh
bash webui/scripts/e2e-phase2705.sh
bash webui/scripts/e2e-phase2706.sh
bash webui/scripts/e2e-phase2707.sh
bash webui/scripts/e2e-phase2708.sh
bash webui/scripts/e2e-phase2709.sh
bash webui/scripts/e2e-phase2710.sh
bash webui/scripts/e2e-phase2711.sh
bash webui/scripts/e2e-phase2712.sh
bash webui/scripts/e2e-phase2713.sh
bash webui/scripts/e2e-phase2714.sh
bash webui/scripts/e2e-phase2715.sh
bash webui/scripts/e2e-phase2716.sh
bash webui/scripts/e2e-phase2717.sh
bash webui/scripts/e2e-phase2718.sh
bash webui/scripts/e2e-phase2719.sh
bash webui/scripts/e2e-phase2720.sh
bash webui/scripts/e2e-phase2721.sh
bash webui/scripts/e2e-phase2722.sh
bash webui/scripts/e2e-phase2723.sh
bash webui/scripts/e2e-phase2724.sh
bash webui/scripts/e2e-phase2725.sh
bash webui/scripts/e2e-phase2726.sh
bash webui/scripts/e2e-phase2727.sh
bash webui/scripts/e2e-phase2728.sh
bash webui/scripts/e2e-phase2729.sh
bash webui/scripts/e2e-phase2730.sh
bash webui/scripts/e2e-phase2731.sh
bash webui/scripts/e2e-phase2732.sh
bash webui/scripts/e2e-phase2733.sh
bash webui/scripts/e2e-phase2734.sh
bash webui/scripts/e2e-phase2735.sh
bash webui/scripts/e2e-phase2736.sh
bash webui/scripts/e2e-phase2737.sh
bash webui/scripts/e2e-phase2738.sh
bash webui/scripts/e2e-phase2739.sh
bash webui/scripts/e2e-phase2740.sh
bash webui/scripts/e2e-phase2741.sh
bash webui/scripts/e2e-phase2742.sh
bash webui/scripts/e2e-phase2743.sh
bash webui/scripts/e2e-phase2744.sh
bash webui/scripts/e2e-phase2745.sh
bash webui/scripts/e2e-phase2746.sh
bash webui/scripts/e2e-phase2747.sh
bash webui/scripts/e2e-phase2748.sh
bash webui/scripts/e2e-phase2749.sh
bash webui/scripts/e2e-phase2750.sh
bash webui/scripts/e2e-phase2751.sh
bash webui/scripts/e2e-phase2752.sh
bash webui/scripts/e2e-phase2753.sh
bash webui/scripts/e2e-phase2754.sh
bash webui/scripts/e2e-phase2755.sh
bash webui/scripts/e2e-phase2756.sh
bash webui/scripts/e2e-phase2757.sh
bash webui/scripts/e2e-phase2758.sh
bash webui/scripts/e2e-phase2759.sh
bash webui/scripts/e2e-phase2760.sh
bash webui/scripts/e2e-phase2761.sh
bash webui/scripts/e2e-phase2762.sh
bash webui/scripts/e2e-phase2763.sh
bash webui/scripts/e2e-phase2764.sh
bash webui/scripts/e2e-phase2765.sh
bash webui/scripts/e2e-phase2766.sh
bash webui/scripts/e2e-phase2767.sh
bash webui/scripts/e2e-phase2768.sh
bash webui/scripts/e2e-phase2769.sh
bash webui/scripts/e2e-phase2770.sh
bash webui/scripts/e2e-phase2771.sh
bash webui/scripts/e2e-phase2772.sh
bash webui/scripts/e2e-phase2773.sh
bash webui/scripts/e2e-phase2774.sh
bash webui/scripts/e2e-phase2775.sh
bash webui/scripts/e2e-phase2776.sh
bash webui/scripts/e2e-phase2777.sh
bash webui/scripts/e2e-phase2778.sh
bash webui/scripts/e2e-phase2779.sh
bash webui/scripts/e2e-phase2780.sh
bash webui/scripts/e2e-phase2781.sh
bash webui/scripts/e2e-phase2782.sh
bash webui/scripts/e2e-phase2783.sh
bash webui/scripts/e2e-phase2784.sh
bash webui/scripts/e2e-phase2785.sh
bash webui/scripts/e2e-phase2786.sh
bash webui/scripts/e2e-phase2787.sh
bash webui/scripts/e2e-phase2788.sh
bash webui/scripts/e2e-phase2789.sh
bash webui/scripts/e2e-phase2790.sh
bash webui/scripts/e2e-phase2791.sh
bash webui/scripts/e2e-phase2792.sh
bash webui/scripts/e2e-phase2793.sh
bash webui/scripts/e2e-phase2794.sh
bash webui/scripts/e2e-phase2795.sh
bash webui/scripts/e2e-phase2796.sh
bash webui/scripts/e2e-phase2797.sh
bash webui/scripts/e2e-phase2798.sh
bash webui/scripts/e2e-phase2799.sh
bash webui/scripts/e2e-phase2800.sh
bash webui/scripts/e2e-phase2801.sh
bash webui/scripts/e2e-phase2802.sh
bash webui/scripts/e2e-phase2803.sh
bash webui/scripts/e2e-phase2804.sh
bash webui/scripts/e2e-phase2805.sh
bash webui/scripts/e2e-phase2806.sh
bash webui/scripts/e2e-phase2807.sh
bash webui/scripts/e2e-phase2808.sh
bash webui/scripts/e2e-phase2809.sh
bash webui/scripts/e2e-phase2810.sh
bash webui/scripts/e2e-phase2811.sh
bash webui/scripts/e2e-phase2812.sh
bash webui/scripts/e2e-phase2813.sh
bash webui/scripts/e2e-phase2814.sh
bash webui/scripts/e2e-phase2815.sh
bash webui/scripts/e2e-phase2816.sh
bash webui/scripts/e2e-phase2817.sh
bash webui/scripts/e2e-phase2818.sh
bash webui/scripts/e2e-phase2819.sh
bash webui/scripts/e2e-phase2820.sh
bash webui/scripts/e2e-phase2821.sh
bash webui/scripts/e2e-phase2822.sh
bash webui/scripts/e2e-phase2823.sh
bash webui/scripts/e2e-phase2824.sh
bash webui/scripts/e2e-phase2825.sh
bash webui/scripts/e2e-phase2826.sh
bash webui/scripts/e2e-phase2827.sh
bash webui/scripts/e2e-phase2828.sh
bash webui/scripts/e2e-phase2829.sh
bash webui/scripts/e2e-phase2830.sh
bash webui/scripts/e2e-phase2831.sh
bash webui/scripts/e2e-phase2832.sh
bash webui/scripts/e2e-phase2833.sh
bash webui/scripts/e2e-phase2834.sh
bash webui/scripts/e2e-phase2835.sh
bash webui/scripts/e2e-phase2836.sh
bash webui/scripts/e2e-phase2837.sh
bash webui/scripts/e2e-phase2838.sh
bash webui/scripts/e2e-phase2839.sh
bash webui/scripts/e2e-phase2840.sh
bash webui/scripts/e2e-phase2841.sh
bash webui/scripts/e2e-phase2842.sh
bash webui/scripts/e2e-phase2843.sh
bash webui/scripts/e2e-phase2844.sh
bash webui/scripts/e2e-phase2845.sh
bash webui/scripts/e2e-phase2846.sh
bash webui/scripts/e2e-phase2847.sh
bash webui/scripts/e2e-phase2848.sh
bash webui/scripts/e2e-phase2849.sh
bash webui/scripts/e2e-phase2850.sh
bash webui/scripts/e2e-phase2851.sh
bash webui/scripts/e2e-phase2852.sh
bash webui/scripts/e2e-phase2853.sh
bash webui/scripts/e2e-phase2854.sh
bash webui/scripts/e2e-phase2855.sh
bash webui/scripts/e2e-phase2856.sh
bash webui/scripts/e2e-phase2857.sh
bash webui/scripts/e2e-phase2858.sh
bash webui/scripts/e2e-phase2859.sh
bash webui/scripts/e2e-phase2860.sh
bash webui/scripts/e2e-phase2861.sh
bash webui/scripts/e2e-phase2862.sh
bash webui/scripts/e2e-phase2863.sh
bash webui/scripts/e2e-phase2864.sh
bash webui/scripts/e2e-phase2865.sh
bash webui/scripts/e2e-phase2866.sh
bash webui/scripts/e2e-phase2867.sh
bash webui/scripts/e2e-phase2868.sh
bash webui/scripts/e2e-phase2869.sh
bash webui/scripts/e2e-phase2870.sh
bash webui/scripts/e2e-phase2871.sh
bash webui/scripts/e2e-phase2872.sh
bash webui/scripts/e2e-phase2873.sh
bash webui/scripts/e2e-phase2874.sh
bash webui/scripts/e2e-phase2875.sh
bash webui/scripts/e2e-phase2876.sh
bash webui/scripts/e2e-phase2877.sh
bash webui/scripts/e2e-phase2878.sh
bash webui/scripts/e2e-phase2879.sh
bash webui/scripts/e2e-phase2880.sh
bash webui/scripts/e2e-phase2881.sh
bash webui/scripts/e2e-phase2882.sh
bash webui/scripts/e2e-phase2883.sh
bash webui/scripts/e2e-phase2884.sh
bash webui/scripts/e2e-phase2885.sh
bash webui/scripts/e2e-phase2886.sh
bash webui/scripts/e2e-phase2887.sh
bash webui/scripts/e2e-phase2888.sh
bash webui/scripts/e2e-phase2889.sh
bash webui/scripts/e2e-phase2890.sh
bash webui/scripts/e2e-phase2891.sh
bash webui/scripts/e2e-phase2892.sh
bash webui/scripts/e2e-phase2893.sh
bash webui/scripts/e2e-phase2894.sh
bash webui/scripts/e2e-phase2895.sh
bash webui/scripts/e2e-phase2896.sh
bash webui/scripts/e2e-phase2897.sh
bash webui/scripts/e2e-phase2898.sh
bash webui/scripts/e2e-phase2899.sh
bash webui/scripts/e2e-phase2900.sh
bash webui/scripts/e2e-phase2901.sh
bash webui/scripts/e2e-phase2902.sh
bash webui/scripts/e2e-phase2903.sh
bash webui/scripts/e2e-phase2904.sh
bash webui/scripts/e2e-phase2905.sh
bash webui/scripts/e2e-phase2906.sh
bash webui/scripts/e2e-phase2907.sh
bash webui/scripts/e2e-phase2908.sh
bash webui/scripts/e2e-phase2909.sh
bash webui/scripts/e2e-phase2910.sh
bash webui/scripts/e2e-phase2911.sh
bash webui/scripts/e2e-phase2912.sh
bash webui/scripts/e2e-phase2913.sh
bash webui/scripts/e2e-phase2914.sh
bash webui/scripts/e2e-phase2915.sh
bash webui/scripts/e2e-phase2916.sh
bash webui/scripts/e2e-phase2917.sh
bash webui/scripts/e2e-phase2918.sh
bash webui/scripts/e2e-phase2919.sh
bash webui/scripts/e2e-phase2920.sh
bash webui/scripts/e2e-phase2921.sh
bash webui/scripts/e2e-phase2922.sh
bash webui/scripts/e2e-phase2923.sh
bash webui/scripts/e2e-phase2924.sh
bash webui/scripts/e2e-phase2925.sh
bash webui/scripts/e2e-phase2926.sh
bash webui/scripts/e2e-phase2927.sh
bash webui/scripts/e2e-phase2928.sh
bash webui/scripts/e2e-phase2929.sh
bash webui/scripts/e2e-phase2930.sh
bash webui/scripts/e2e-phase2931.sh
bash webui/scripts/e2e-phase2932.sh
bash webui/scripts/e2e-phase2933.sh
bash webui/scripts/e2e-phase2934.sh
bash webui/scripts/e2e-phase2935.sh
bash webui/scripts/e2e-phase2936.sh
bash webui/scripts/e2e-phase2937.sh
bash webui/scripts/e2e-phase2938.sh
bash webui/scripts/e2e-phase2939.sh
bash webui/scripts/e2e-phase2940.sh
bash webui/scripts/e2e-phase2941.sh
bash webui/scripts/e2e-phase2942.sh
bash webui/scripts/e2e-phase2943.sh
bash webui/scripts/e2e-phase2944.sh
bash webui/scripts/e2e-phase2945.sh
bash webui/scripts/e2e-phase2946.sh
bash webui/scripts/e2e-phase2947.sh
bash webui/scripts/e2e-phase2948.sh
bash webui/scripts/e2e-phase2949.sh
bash webui/scripts/e2e-phase2950.sh
bash webui/scripts/e2e-phase2951.sh
bash webui/scripts/e2e-phase2952.sh
bash webui/scripts/e2e-phase2953.sh
bash webui/scripts/e2e-phase2954.sh
bash webui/scripts/e2e-phase2955.sh
bash webui/scripts/e2e-phase2956.sh
bash webui/scripts/e2e-phase2957.sh
bash webui/scripts/e2e-phase2958.sh
bash webui/scripts/e2e-phase2959.sh
bash webui/scripts/e2e-phase2960.sh
bash webui/scripts/e2e-phase2961.sh
bash webui/scripts/e2e-phase2962.sh
bash webui/scripts/e2e-phase2963.sh
bash webui/scripts/e2e-phase2964.sh
bash webui/scripts/e2e-phase2965.sh
bash webui/scripts/e2e-phase2966.sh
bash webui/scripts/e2e-phase2967.sh
bash webui/scripts/e2e-phase2968.sh
bash webui/scripts/e2e-phase2969.sh
bash webui/scripts/e2e-phase2970.sh
bash webui/scripts/e2e-phase2971.sh
bash webui/scripts/e2e-phase2972.sh
bash webui/scripts/e2e-phase2973.sh
bash webui/scripts/e2e-phase2974.sh
bash webui/scripts/e2e-phase2975.sh
bash webui/scripts/e2e-phase2976.sh
bash webui/scripts/e2e-phase2977.sh
bash webui/scripts/e2e-phase2978.sh
bash webui/scripts/e2e-phase2979.sh
bash webui/scripts/e2e-phase2980.sh
bash webui/scripts/e2e-phase2981.sh
bash webui/scripts/e2e-phase2982.sh
bash webui/scripts/e2e-phase2983.sh
bash webui/scripts/e2e-phase2984.sh
bash webui/scripts/e2e-phase2985.sh
bash webui/scripts/e2e-phase2986.sh
bash webui/scripts/e2e-phase2987.sh
bash webui/scripts/e2e-phase2988.sh
bash webui/scripts/e2e-phase2989.sh
bash webui/scripts/e2e-phase2990.sh
bash webui/scripts/e2e-phase2991.sh
bash webui/scripts/e2e-phase2992.sh
bash webui/scripts/e2e-phase2993.sh
bash webui/scripts/e2e-phase2994.sh
bash webui/scripts/e2e-phase2995.sh
bash webui/scripts/e2e-phase2996.sh
bash webui/scripts/e2e-phase2997.sh
bash webui/scripts/e2e-phase2998.sh
bash webui/scripts/e2e-phase2999.sh
bash webui/scripts/e2e-phase3000.sh
bash webui/scripts/e2e-phase3001.sh
bash webui/scripts/e2e-phase3002.sh
bash webui/scripts/e2e-phase3003.sh
bash webui/scripts/e2e-phase3004.sh
bash webui/scripts/e2e-phase3005.sh
bash webui/scripts/e2e-phase3006.sh
bash webui/scripts/e2e-phase3007.sh
bash webui/scripts/e2e-phase3008.sh
bash webui/scripts/e2e-phase3009.sh
bash webui/scripts/e2e-phase3010.sh
bash webui/scripts/e2e-phase3011.sh
bash webui/scripts/e2e-phase3012.sh
bash webui/scripts/e2e-phase3013.sh
bash webui/scripts/e2e-phase3014.sh
bash webui/scripts/e2e-phase3015.sh
bash webui/scripts/e2e-phase3016.sh
bash webui/scripts/e2e-phase3017.sh
bash webui/scripts/e2e-phase3018.sh
bash webui/scripts/e2e-phase3019.sh
bash webui/scripts/e2e-phase3020.sh
bash webui/scripts/e2e-phase3021.sh
bash webui/scripts/e2e-phase3022.sh
bash webui/scripts/e2e-phase3023.sh
bash webui/scripts/e2e-phase3024.sh
bash webui/scripts/e2e-phase3025.sh
bash webui/scripts/e2e-phase3026.sh
bash webui/scripts/e2e-phase3027.sh
bash webui/scripts/e2e-phase3028.sh
bash webui/scripts/e2e-phase3029.sh
bash webui/scripts/e2e-phase3030.sh
bash webui/scripts/e2e-phase3031.sh
bash webui/scripts/e2e-phase3032.sh
bash webui/scripts/e2e-phase3033.sh
bash webui/scripts/e2e-phase3034.sh
bash webui/scripts/e2e-phase3035.sh
bash webui/scripts/e2e-phase3036.sh
bash webui/scripts/e2e-phase3037.sh
bash webui/scripts/e2e-phase3038.sh
bash webui/scripts/e2e-phase3039.sh
bash webui/scripts/e2e-phase3040.sh
bash webui/scripts/e2e-phase3041.sh
bash webui/scripts/e2e-phase3042.sh
bash webui/scripts/e2e-phase3043.sh
bash webui/scripts/e2e-phase3044.sh
bash webui/scripts/e2e-phase3045.sh
bash webui/scripts/e2e-phase3046.sh
bash webui/scripts/e2e-phase3047.sh
bash webui/scripts/e2e-phase3048.sh
bash webui/scripts/e2e-phase3049.sh
bash webui/scripts/e2e-phase3050.sh
bash webui/scripts/e2e-phase3051.sh
bash webui/scripts/e2e-phase3052.sh
bash webui/scripts/e2e-phase3053.sh
bash webui/scripts/e2e-phase3054.sh
bash webui/scripts/e2e-phase3055.sh
bash webui/scripts/e2e-phase3056.sh
bash webui/scripts/e2e-phase3057.sh
bash webui/scripts/e2e-phase3058.sh
bash webui/scripts/e2e-phase3059.sh
bash webui/scripts/e2e-phase3060.sh
bash webui/scripts/e2e-phase3061.sh
bash webui/scripts/e2e-phase3062.sh
bash webui/scripts/e2e-phase3063.sh
bash webui/scripts/e2e-phase3064.sh
bash webui/scripts/e2e-phase3065.sh
bash webui/scripts/e2e-phase3066.sh
bash webui/scripts/e2e-phase3067.sh
bash webui/scripts/e2e-phase3068.sh
bash webui/scripts/e2e-phase3069.sh
bash webui/scripts/e2e-phase3070.sh
bash webui/scripts/e2e-phase3071.sh
bash webui/scripts/e2e-phase3072.sh
bash webui/scripts/e2e-phase3073.sh
bash webui/scripts/e2e-phase3074.sh
bash webui/scripts/e2e-phase3075.sh
bash webui/scripts/e2e-phase3076.sh
bash webui/scripts/e2e-phase3077.sh
bash webui/scripts/e2e-phase3078.sh
bash webui/scripts/e2e-phase3079.sh
bash webui/scripts/e2e-phase3080.sh
bash webui/scripts/e2e-phase3081.sh
bash webui/scripts/e2e-phase3082.sh
bash webui/scripts/e2e-phase3083.sh
bash webui/scripts/e2e-phase3084.sh
bash webui/scripts/e2e-phase3085.sh
bash webui/scripts/e2e-phase3086.sh
bash webui/scripts/e2e-phase3087.sh
bash webui/scripts/e2e-phase3088.sh
bash webui/scripts/e2e-phase3089.sh
bash webui/scripts/e2e-phase3090.sh
bash webui/scripts/e2e-phase3091.sh
bash webui/scripts/e2e-phase3092.sh
bash webui/scripts/e2e-phase3093.sh
bash webui/scripts/e2e-phase3094.sh
bash webui/scripts/e2e-phase3095.sh
bash webui/scripts/e2e-phase3096.sh
bash webui/scripts/e2e-phase3097.sh
bash webui/scripts/e2e-phase3098.sh
bash webui/scripts/e2e-phase3099.sh
bash webui/scripts/e2e-phase3100.sh
bash webui/scripts/e2e-phase3101.sh
bash webui/scripts/e2e-phase3102.sh
bash webui/scripts/e2e-phase3103.sh
bash webui/scripts/e2e-phase3104.sh
bash webui/scripts/e2e-phase3105.sh
bash webui/scripts/e2e-phase3106.sh
bash webui/scripts/e2e-phase3107.sh
bash webui/scripts/e2e-phase3108.sh
bash webui/scripts/e2e-phase3109.sh
bash webui/scripts/e2e-phase3110.sh
bash webui/scripts/e2e-phase3111.sh
bash webui/scripts/e2e-phase3112.sh
bash webui/scripts/e2e-phase3113.sh
bash webui/scripts/e2e-phase3114.sh
bash webui/scripts/e2e-phase3115.sh
bash webui/scripts/e2e-phase3116.sh
bash webui/scripts/e2e-phase3117.sh
bash webui/scripts/e2e-phase3118.sh
bash webui/scripts/e2e-phase3119.sh
bash webui/scripts/e2e-phase3120.sh
bash webui/scripts/e2e-phase3121.sh
bash webui/scripts/e2e-phase3122.sh
bash webui/scripts/e2e-phase3123.sh
bash webui/scripts/e2e-phase3124.sh
bash webui/scripts/e2e-phase3125.sh
bash webui/scripts/e2e-phase3126.sh
bash webui/scripts/e2e-phase3127.sh
bash webui/scripts/e2e-phase3128.sh
bash webui/scripts/e2e-phase3129.sh
bash webui/scripts/e2e-phase3130.sh
bash webui/scripts/e2e-phase3131.sh
bash webui/scripts/e2e-phase3132.sh
bash webui/scripts/e2e-phase3133.sh
bash webui/scripts/e2e-phase3134.sh
bash webui/scripts/e2e-phase3135.sh
bash webui/scripts/e2e-phase3136.sh
bash webui/scripts/e2e-phase3137.sh
bash webui/scripts/e2e-phase3138.sh
bash webui/scripts/e2e-phase3139.sh
bash webui/scripts/e2e-phase3140.sh
bash webui/scripts/e2e-phase3141.sh
bash webui/scripts/e2e-phase3142.sh
bash webui/scripts/e2e-phase3143.sh
bash webui/scripts/e2e-phase3144.sh
bash webui/scripts/e2e-phase3145.sh
bash webui/scripts/e2e-phase3146.sh
bash webui/scripts/e2e-phase3147.sh
bash webui/scripts/e2e-phase3148.sh
bash webui/scripts/e2e-phase3149.sh
bash webui/scripts/e2e-phase3150.sh
bash webui/scripts/e2e-phase3151.sh
bash webui/scripts/e2e-phase3152.sh
bash webui/scripts/e2e-phase3153.sh
bash webui/scripts/e2e-phase3154.sh
bash webui/scripts/e2e-phase3155.sh
bash webui/scripts/e2e-phase3156.sh
bash webui/scripts/e2e-phase3157.sh
bash webui/scripts/e2e-phase3158.sh
bash webui/scripts/e2e-phase3159.sh
bash webui/scripts/e2e-phase3160.sh
bash webui/scripts/e2e-phase3161.sh
bash webui/scripts/e2e-phase3162.sh
bash webui/scripts/e2e-phase3163.sh
bash webui/scripts/e2e-phase3164.sh
bash webui/scripts/e2e-phase3165.sh
bash webui/scripts/e2e-phase3166.sh
bash webui/scripts/e2e-phase3167.sh
bash webui/scripts/e2e-phase3168.sh
bash webui/scripts/e2e-phase3169.sh
bash webui/scripts/e2e-phase3170.sh
bash webui/scripts/e2e-phase3171.sh
bash webui/scripts/e2e-phase3172.sh
bash webui/scripts/e2e-phase3173.sh
bash webui/scripts/e2e-phase3174.sh
bash webui/scripts/e2e-phase3175.sh
bash webui/scripts/e2e-phase3176.sh
bash webui/scripts/e2e-phase3177.sh
bash webui/scripts/e2e-phase3178.sh
bash webui/scripts/e2e-phase3179.sh
bash webui/scripts/e2e-phase3180.sh
bash webui/scripts/e2e-phase3181.sh
bash webui/scripts/e2e-phase3182.sh
bash webui/scripts/e2e-phase3183.sh
bash webui/scripts/e2e-phase3184.sh
bash webui/scripts/e2e-phase3185.sh
bash webui/scripts/e2e-phase3186.sh
bash webui/scripts/e2e-phase3187.sh
bash webui/scripts/e2e-phase3188.sh
bash webui/scripts/e2e-phase3189.sh
bash webui/scripts/e2e-phase3190.sh
bash webui/scripts/e2e-phase3191.sh
bash webui/scripts/e2e-phase3192.sh
bash webui/scripts/e2e-phase3193.sh
bash webui/scripts/e2e-phase3194.sh
bash webui/scripts/e2e-phase3195.sh
bash webui/scripts/e2e-phase3196.sh
bash webui/scripts/e2e-phase3197.sh
bash webui/scripts/e2e-phase3198.sh
bash webui/scripts/e2e-phase3199.sh
bash webui/scripts/e2e-phase3200.sh
bash webui/scripts/e2e-phase3201.sh
bash webui/scripts/e2e-phase3202.sh
bash webui/scripts/e2e-phase3203.sh
bash webui/scripts/e2e-phase3204.sh
bash webui/scripts/e2e-phase3205.sh
bash webui/scripts/e2e-phase3206.sh
bash webui/scripts/e2e-phase3207.sh
bash webui/scripts/e2e-phase3208.sh
bash webui/scripts/e2e-phase3209.sh
bash webui/scripts/e2e-phase3210.sh
bash webui/scripts/e2e-phase3211.sh
bash webui/scripts/e2e-phase3212.sh
bash webui/scripts/e2e-phase3213.sh
bash webui/scripts/e2e-phase3214.sh
bash webui/scripts/e2e-phase3215.sh
bash webui/scripts/e2e-phase3216.sh
bash webui/scripts/e2e-phase3217.sh
bash webui/scripts/e2e-phase3218.sh
bash webui/scripts/e2e-phase3219.sh
bash webui/scripts/e2e-phase3220.sh
bash webui/scripts/e2e-phase3221.sh
bash webui/scripts/e2e-phase3222.sh
bash webui/scripts/e2e-phase3223.sh
bash webui/scripts/e2e-phase3224.sh
bash webui/scripts/e2e-phase3225.sh
bash webui/scripts/e2e-phase3226.sh
bash webui/scripts/e2e-phase3227.sh
bash webui/scripts/e2e-phase3228.sh
bash webui/scripts/e2e-phase3229.sh
bash webui/scripts/e2e-phase3230.sh
bash webui/scripts/e2e-phase3231.sh
bash webui/scripts/e2e-phase3232.sh
bash webui/scripts/e2e-phase3233.sh
bash webui/scripts/e2e-phase3234.sh
bash webui/scripts/e2e-phase3235.sh
bash webui/scripts/e2e-phase3236.sh
bash webui/scripts/e2e-phase3237.sh
bash webui/scripts/e2e-phase3238.sh
bash webui/scripts/e2e-phase3239.sh
bash webui/scripts/e2e-phase3240.sh
bash webui/scripts/e2e-phase3241.sh
bash webui/scripts/e2e-phase3242.sh
bash webui/scripts/e2e-phase3243.sh
bash webui/scripts/e2e-phase3244.sh
bash webui/scripts/e2e-phase3245.sh
bash webui/scripts/e2e-phase3246.sh
bash webui/scripts/e2e-phase3247.sh
bash webui/scripts/e2e-phase3248.sh
bash webui/scripts/e2e-phase3249.sh
bash webui/scripts/e2e-phase3250.sh
bash webui/scripts/e2e-phase3251.sh
bash webui/scripts/e2e-phase3252.sh
bash webui/scripts/e2e-phase3253.sh
bash webui/scripts/e2e-phase3254.sh
bash webui/scripts/e2e-phase3255.sh
bash webui/scripts/e2e-phase3256.sh
bash webui/scripts/e2e-phase3257.sh
bash webui/scripts/e2e-phase3258.sh
bash webui/scripts/e2e-phase3259.sh
bash webui/scripts/e2e-phase3260.sh
bash webui/scripts/e2e-phase3261.sh
bash webui/scripts/e2e-phase3262.sh
bash webui/scripts/e2e-phase3263.sh
bash webui/scripts/e2e-phase3264.sh
bash webui/scripts/e2e-phase3265.sh
bash webui/scripts/e2e-phase3266.sh
bash webui/scripts/e2e-phase3267.sh
bash webui/scripts/e2e-phase3268.sh
bash webui/scripts/e2e-phase3269.sh
bash webui/scripts/e2e-phase3270.sh
bash webui/scripts/e2e-phase3271.sh
bash webui/scripts/e2e-phase3272.sh
bash webui/scripts/e2e-phase3273.sh
bash webui/scripts/e2e-phase3274.sh
bash webui/scripts/e2e-phase3275.sh
bash webui/scripts/e2e-phase3276.sh
bash webui/scripts/e2e-phase3277.sh
bash webui/scripts/e2e-phase3278.sh
bash webui/scripts/e2e-phase3279.sh
bash webui/scripts/e2e-phase3280.sh
bash webui/scripts/e2e-phase3281.sh
bash webui/scripts/e2e-phase3282.sh
bash webui/scripts/e2e-phase3283.sh
bash webui/scripts/e2e-phase3284.sh
bash webui/scripts/e2e-phase3285.sh
bash webui/scripts/e2e-phase3286.sh
bash webui/scripts/e2e-phase3287.sh
bash webui/scripts/e2e-phase3288.sh
bash webui/scripts/e2e-phase3289.sh
bash webui/scripts/e2e-phase3290.sh
bash webui/scripts/e2e-phase3291.sh
bash webui/scripts/e2e-phase3292.sh
bash webui/scripts/e2e-phase3293.sh
bash webui/scripts/e2e-phase3294.sh
bash webui/scripts/e2e-phase3295.sh
bash webui/scripts/e2e-phase3296.sh
bash webui/scripts/e2e-phase3297.sh
bash webui/scripts/e2e-phase3298.sh
bash webui/scripts/e2e-phase3299.sh
bash webui/scripts/e2e-phase3300.sh
bash webui/scripts/e2e-phase3301.sh
bash webui/scripts/e2e-phase3302.sh
bash webui/scripts/e2e-phase3303.sh
bash webui/scripts/e2e-phase3304.sh
bash webui/scripts/e2e-phase3305.sh
bash webui/scripts/e2e-phase3306.sh
bash webui/scripts/e2e-phase3307.sh
bash webui/scripts/e2e-phase3308.sh
bash webui/scripts/e2e-phase3309.sh
bash webui/scripts/e2e-phase3310.sh
bash webui/scripts/e2e-phase3311.sh
bash webui/scripts/e2e-phase3312.sh
bash webui/scripts/e2e-phase3313.sh
bash webui/scripts/e2e-phase3314.sh
bash webui/scripts/e2e-phase3315.sh
bash webui/scripts/e2e-phase3316.sh
bash webui/scripts/e2e-phase3317.sh
bash webui/scripts/e2e-phase3318.sh
bash webui/scripts/e2e-phase3319.sh
bash webui/scripts/e2e-phase3320.sh
bash webui/scripts/e2e-phase3321.sh
bash webui/scripts/e2e-phase3322.sh
bash webui/scripts/e2e-phase3323.sh
bash webui/scripts/e2e-phase3324.sh
bash webui/scripts/e2e-phase3325.sh
bash webui/scripts/e2e-phase3326.sh
bash webui/scripts/e2e-phase3327.sh
bash webui/scripts/e2e-phase3328.sh
bash webui/scripts/e2e-phase3329.sh
bash webui/scripts/e2e-phase3330.sh
bash webui/scripts/e2e-phase3331.sh
bash webui/scripts/e2e-phase3332.sh
bash webui/scripts/e2e-phase3333.sh
bash webui/scripts/e2e-phase3334.sh
bash webui/scripts/e2e-phase3335.sh
bash webui/scripts/e2e-phase3336.sh
bash webui/scripts/e2e-phase3337.sh
bash webui/scripts/e2e-phase3338.sh
bash webui/scripts/e2e-phase3339.sh
bash webui/scripts/e2e-phase3340.sh
bash webui/scripts/e2e-phase3341.sh
bash webui/scripts/e2e-phase3342.sh
bash webui/scripts/e2e-phase3343.sh
bash webui/scripts/e2e-phase3344.sh
bash webui/scripts/e2e-phase3345.sh
bash webui/scripts/e2e-phase3346.sh
bash webui/scripts/e2e-phase3347.sh
bash webui/scripts/e2e-phase3348.sh
bash webui/scripts/e2e-phase3349.sh
bash webui/scripts/e2e-phase3350.sh
bash webui/scripts/e2e-phase3351.sh
bash webui/scripts/e2e-phase3352.sh
bash webui/scripts/e2e-phase3353.sh
bash webui/scripts/e2e-phase3354.sh
bash webui/scripts/e2e-phase3355.sh
bash webui/scripts/e2e-phase3356.sh
bash webui/scripts/e2e-phase3357.sh
bash webui/scripts/e2e-phase3358.sh
bash webui/scripts/e2e-phase3359.sh
bash webui/scripts/e2e-phase3360.sh
bash webui/scripts/e2e-phase3361.sh
bash webui/scripts/e2e-phase3362.sh
bash webui/scripts/e2e-phase3363.sh
bash webui/scripts/e2e-phase3364.sh
bash webui/scripts/e2e-phase3365.sh
bash webui/scripts/e2e-phase3366.sh
bash webui/scripts/e2e-phase3367.sh
bash webui/scripts/e2e-phase3368.sh
bash webui/scripts/e2e-phase3369.sh
bash webui/scripts/e2e-phase3370.sh
bash webui/scripts/e2e-phase3371.sh
bash webui/scripts/e2e-phase3372.sh
bash webui/scripts/e2e-phase3373.sh
bash webui/scripts/e2e-phase3374.sh
bash webui/scripts/e2e-phase3375.sh
bash webui/scripts/e2e-phase3376.sh
bash webui/scripts/e2e-phase3377.sh
bash webui/scripts/e2e-phase3378.sh
bash webui/scripts/e2e-phase3379.sh
bash webui/scripts/e2e-phase3380.sh
bash webui/scripts/e2e-phase3381.sh
bash webui/scripts/e2e-phase3382.sh
bash webui/scripts/e2e-phase3383.sh
bash webui/scripts/e2e-phase3384.sh
bash webui/scripts/e2e-phase3385.sh
bash webui/scripts/e2e-phase3386.sh
bash webui/scripts/e2e-phase3387.sh
bash webui/scripts/e2e-phase3388.sh
bash webui/scripts/e2e-phase3389.sh
bash webui/scripts/e2e-phase3390.sh
bash webui/scripts/e2e-phase3391.sh
bash webui/scripts/e2e-phase3392.sh
bash webui/scripts/e2e-phase3393.sh
bash webui/scripts/e2e-phase3394.sh
bash webui/scripts/e2e-phase3395.sh
bash webui/scripts/e2e-phase3396.sh
bash webui/scripts/e2e-phase3397.sh
bash webui/scripts/e2e-phase3398.sh
bash webui/scripts/e2e-phase3399.sh
bash webui/scripts/e2e-phase3400.sh
bash webui/scripts/e2e-phase3401.sh
bash webui/scripts/e2e-phase3402.sh
bash webui/scripts/e2e-phase3403.sh
bash webui/scripts/e2e-phase3404.sh
bash webui/scripts/e2e-phase3405.sh
bash webui/scripts/e2e-phase3406.sh
bash webui/scripts/e2e-phase3407.sh
bash webui/scripts/e2e-phase3408.sh
bash webui/scripts/e2e-phase3409.sh
bash webui/scripts/e2e-phase3410.sh
bash webui/scripts/e2e-phase3411.sh
bash webui/scripts/e2e-phase3412.sh
bash webui/scripts/e2e-phase3413.sh
bash webui/scripts/e2e-phase3414.sh
bash webui/scripts/e2e-phase3415.sh
bash webui/scripts/e2e-phase3416.sh
bash webui/scripts/e2e-phase3417.sh
bash webui/scripts/e2e-phase3418.sh
bash webui/scripts/e2e-phase3419.sh
bash webui/scripts/e2e-phase3420.sh
bash webui/scripts/e2e-phase3421.sh
bash webui/scripts/e2e-phase3422.sh
bash webui/scripts/e2e-phase3423.sh
bash webui/scripts/e2e-phase3424.sh
bash webui/scripts/e2e-phase3425.sh
bash webui/scripts/e2e-phase3426.sh
bash webui/scripts/e2e-phase3427.sh
bash webui/scripts/e2e-phase3428.sh
bash webui/scripts/e2e-phase3429.sh
bash webui/scripts/e2e-phase3430.sh
bash webui/scripts/e2e-phase3431.sh
bash webui/scripts/e2e-phase3432.sh
bash webui/scripts/e2e-phase3433.sh
bash webui/scripts/e2e-phase3434.sh
bash webui/scripts/e2e-phase3435.sh
bash webui/scripts/e2e-phase3436.sh
bash webui/scripts/e2e-phase3437.sh
bash webui/scripts/e2e-phase3438.sh
bash webui/scripts/e2e-phase3439.sh
bash webui/scripts/e2e-phase3440.sh
bash webui/scripts/e2e-phase3441.sh
bash webui/scripts/e2e-phase3442.sh
bash webui/scripts/e2e-phase3443.sh
bash webui/scripts/e2e-phase3444.sh
bash webui/scripts/e2e-phase3445.sh
bash webui/scripts/e2e-phase3446.sh
bash webui/scripts/e2e-phase3447.sh
bash webui/scripts/e2e-phase3448.sh
bash webui/scripts/e2e-phase3449.sh
bash webui/scripts/e2e-phase3450.sh
bash webui/scripts/e2e-phase3451.sh
bash webui/scripts/e2e-phase3452.sh
bash webui/scripts/e2e-phase3453.sh
bash webui/scripts/e2e-phase3454.sh
bash webui/scripts/e2e-phase3455.sh
bash webui/scripts/e2e-phase3456.sh
bash webui/scripts/e2e-phase3457.sh
bash webui/scripts/e2e-phase3458.sh
bash webui/scripts/e2e-phase3459.sh
bash webui/scripts/e2e-phase3460.sh
bash webui/scripts/e2e-phase3461.sh
bash webui/scripts/e2e-phase3462.sh
bash webui/scripts/e2e-phase3463.sh
bash webui/scripts/e2e-phase3464.sh
bash webui/scripts/e2e-phase3465.sh
bash webui/scripts/e2e-phase3466.sh
bash webui/scripts/e2e-phase3467.sh
bash webui/scripts/e2e-phase3468.sh
bash webui/scripts/e2e-phase3469.sh
bash webui/scripts/e2e-phase3470.sh
bash webui/scripts/e2e-phase3471.sh
bash webui/scripts/e2e-phase3472.sh
bash webui/scripts/e2e-phase3473.sh
bash webui/scripts/e2e-phase3474.sh
bash webui/scripts/e2e-phase3475.sh
bash webui/scripts/e2e-phase3476.sh
bash webui/scripts/e2e-phase3477.sh
bash webui/scripts/e2e-phase3478.sh
bash webui/scripts/e2e-phase3479.sh
bash webui/scripts/e2e-phase3480.sh
bash webui/scripts/e2e-phase3481.sh
bash webui/scripts/e2e-phase3482.sh
bash webui/scripts/e2e-phase3483.sh
bash webui/scripts/e2e-phase3484.sh
bash webui/scripts/e2e-phase3485.sh
bash webui/scripts/e2e-phase3486.sh
bash webui/scripts/e2e-phase3487.sh
bash webui/scripts/e2e-phase3488.sh
bash webui/scripts/e2e-phase3489.sh
bash webui/scripts/e2e-phase3490.sh
bash webui/scripts/e2e-phase3491.sh
bash webui/scripts/e2e-phase3492.sh
bash webui/scripts/e2e-phase3493.sh
bash webui/scripts/e2e-phase3494.sh
bash webui/scripts/e2e-phase3495.sh
bash webui/scripts/e2e-phase3496.sh
bash webui/scripts/e2e-phase3497.sh
bash webui/scripts/e2e-phase3498.sh
bash webui/scripts/e2e-phase3499.sh
bash webui/scripts/e2e-phase3500.sh
bash webui/scripts/e2e-phase3501.sh
bash webui/scripts/e2e-phase3502.sh
bash webui/scripts/e2e-phase3503.sh
bash webui/scripts/e2e-phase3504.sh
bash webui/scripts/e2e-phase3505.sh
bash webui/scripts/e2e-phase3506.sh
bash webui/scripts/e2e-phase3507.sh
bash webui/scripts/e2e-phase3508.sh
bash webui/scripts/e2e-phase3509.sh
bash webui/scripts/e2e-phase3510.sh
bash webui/scripts/e2e-phase3511.sh
bash webui/scripts/e2e-phase3512.sh
bash webui/scripts/e2e-phase3513.sh
bash webui/scripts/e2e-phase3514.sh
bash webui/scripts/e2e-phase3515.sh
bash webui/scripts/e2e-phase3516.sh
bash webui/scripts/e2e-phase3517.sh
bash webui/scripts/e2e-phase3518.sh
bash webui/scripts/e2e-phase3519.sh
bash webui/scripts/e2e-phase3520.sh
bash webui/scripts/e2e-phase3521.sh
bash webui/scripts/e2e-phase3522.sh
bash webui/scripts/e2e-phase3523.sh
bash webui/scripts/e2e-phase3524.sh
bash webui/scripts/e2e-phase3525.sh
bash webui/scripts/e2e-phase3526.sh
bash webui/scripts/e2e-phase3527.sh
bash webui/scripts/e2e-phase3528.sh
bash webui/scripts/e2e-phase3529.sh
bash webui/scripts/e2e-phase3530.sh
bash webui/scripts/e2e-phase3531.sh
bash webui/scripts/e2e-phase3532.sh
bash webui/scripts/e2e-phase3533.sh
bash webui/scripts/e2e-phase3534.sh
bash webui/scripts/e2e-phase3535.sh
bash webui/scripts/e2e-phase3536.sh
bash webui/scripts/e2e-phase3537.sh
bash webui/scripts/e2e-phase3538.sh
bash webui/scripts/e2e-phase3539.sh
bash webui/scripts/e2e-phase3540.sh
bash webui/scripts/e2e-phase3541.sh
bash webui/scripts/e2e-phase3542.sh
bash webui/scripts/e2e-phase3543.sh
bash webui/scripts/e2e-phase3544.sh
bash webui/scripts/e2e-phase3545.sh
bash webui/scripts/e2e-phase3546.sh
bash webui/scripts/e2e-phase3547.sh
bash webui/scripts/e2e-phase3548.sh
bash webui/scripts/e2e-phase3549.sh
bash webui/scripts/e2e-phase3550.sh
bash webui/scripts/e2e-phase3551.sh
bash webui/scripts/e2e-phase3552.sh
bash webui/scripts/e2e-phase3553.sh
bash webui/scripts/e2e-phase3554.sh
bash webui/scripts/e2e-phase3555.sh
bash webui/scripts/e2e-phase3556.sh
bash webui/scripts/e2e-phase3557.sh
bash webui/scripts/e2e-phase3558.sh
bash webui/scripts/e2e-phase3559.sh
bash webui/scripts/e2e-phase3560.sh
bash webui/scripts/e2e-phase3561.sh
bash webui/scripts/e2e-phase3562.sh
bash webui/scripts/e2e-phase3563.sh
bash webui/scripts/e2e-phase3564.sh
bash webui/scripts/e2e-phase3565.sh
bash webui/scripts/e2e-phase3566.sh
bash webui/scripts/e2e-phase3567.sh
bash webui/scripts/e2e-phase3568.sh
bash webui/scripts/e2e-phase3569.sh
bash webui/scripts/e2e-phase3570.sh
bash webui/scripts/e2e-phase3571.sh
bash webui/scripts/e2e-phase3572.sh
bash webui/scripts/e2e-phase3573.sh
bash webui/scripts/e2e-phase3574.sh
bash webui/scripts/e2e-phase3575.sh
bash webui/scripts/e2e-phase3576.sh
bash webui/scripts/e2e-phase3577.sh
bash webui/scripts/e2e-phase3578.sh
bash webui/scripts/e2e-phase3579.sh
bash webui/scripts/e2e-phase3580.sh
bash webui/scripts/e2e-phase3581.sh
bash webui/scripts/e2e-phase3582.sh
bash webui/scripts/e2e-phase3583.sh
bash webui/scripts/e2e-phase3584.sh
bash webui/scripts/e2e-phase3585.sh
bash webui/scripts/e2e-phase3586.sh
bash webui/scripts/e2e-phase3587.sh
bash webui/scripts/e2e-phase3588.sh
bash webui/scripts/e2e-phase3589.sh
bash webui/scripts/e2e-phase3590.sh
bash webui/scripts/e2e-phase3591.sh
bash webui/scripts/e2e-phase3592.sh
bash webui/scripts/e2e-phase3593.sh
bash webui/scripts/e2e-phase3594.sh
bash webui/scripts/e2e-phase3595.sh
bash webui/scripts/e2e-phase3596.sh
bash webui/scripts/e2e-phase3597.sh
bash webui/scripts/e2e-phase3598.sh
bash webui/scripts/e2e-phase3599.sh
bash webui/scripts/e2e-phase3600.sh
bash webui/scripts/e2e-phase3601.sh
bash webui/scripts/e2e-phase3602.sh
bash webui/scripts/e2e-phase3603.sh
bash webui/scripts/e2e-phase3604.sh
bash webui/scripts/e2e-phase3605.sh
bash webui/scripts/e2e-phase3606.sh
bash webui/scripts/e2e-phase3607.sh
bash webui/scripts/e2e-phase3608.sh
bash webui/scripts/e2e-phase3609.sh
bash webui/scripts/e2e-phase3610.sh
bash webui/scripts/e2e-phase3611.sh
bash webui/scripts/e2e-phase3612.sh
bash webui/scripts/e2e-phase3613.sh
bash webui/scripts/e2e-phase3614.sh
bash webui/scripts/e2e-phase3615.sh
bash webui/scripts/e2e-phase3616.sh
bash webui/scripts/e2e-phase3617.sh
bash webui/scripts/e2e-phase3618.sh
bash webui/scripts/e2e-phase3619.sh
bash webui/scripts/e2e-phase3620.sh
bash webui/scripts/e2e-phase3621.sh
bash webui/scripts/e2e-phase3622.sh
bash webui/scripts/e2e-phase3623.sh
bash webui/scripts/e2e-phase3624.sh
bash webui/scripts/e2e-phase3625.sh
bash webui/scripts/e2e-phase3626.sh
bash webui/scripts/e2e-phase3627.sh
bash webui/scripts/e2e-phase3628.sh
bash webui/scripts/e2e-phase3629.sh
bash webui/scripts/e2e-phase3630.sh
bash webui/scripts/e2e-phase3631.sh
bash webui/scripts/e2e-phase3632.sh
bash webui/scripts/e2e-phase3633.sh
bash webui/scripts/e2e-phase3634.sh
bash webui/scripts/e2e-phase3635.sh
bash webui/scripts/e2e-phase3636.sh
bash webui/scripts/e2e-phase3637.sh
bash webui/scripts/e2e-phase3638.sh
bash webui/scripts/e2e-phase3639.sh
bash webui/scripts/e2e-phase3640.sh
bash webui/scripts/e2e-phase3641.sh
bash webui/scripts/e2e-phase3642.sh
bash webui/scripts/e2e-phase3643.sh
bash webui/scripts/e2e-phase3644.sh
bash webui/scripts/e2e-phase3645.sh
bash webui/scripts/e2e-phase3646.sh
bash webui/scripts/e2e-phase3647.sh
bash webui/scripts/e2e-phase3648.sh
bash webui/scripts/e2e-phase3649.sh
bash webui/scripts/e2e-phase3650.sh
bash webui/scripts/e2e-phase3651.sh
bash webui/scripts/e2e-phase3652.sh
bash webui/scripts/e2e-phase3653.sh
bash webui/scripts/e2e-phase3654.sh
bash webui/scripts/e2e-phase3655.sh
bash webui/scripts/e2e-phase3656.sh
bash webui/scripts/e2e-phase3657.sh
bash webui/scripts/e2e-phase3658.sh
bash webui/scripts/e2e-phase3659.sh
bash webui/scripts/e2e-phase3660.sh
bash webui/scripts/e2e-phase3661.sh
bash webui/scripts/e2e-phase3662.sh
bash webui/scripts/e2e-phase3663.sh
bash webui/scripts/e2e-phase3664.sh
bash webui/scripts/e2e-phase3665.sh
bash webui/scripts/e2e-phase3666.sh
bash webui/scripts/e2e-phase3667.sh
bash webui/scripts/e2e-phase3668.sh
bash webui/scripts/e2e-phase3669.sh
bash webui/scripts/e2e-phase3670.sh
bash webui/scripts/e2e-phase3671.sh
bash webui/scripts/e2e-phase3672.sh
bash webui/scripts/e2e-phase3673.sh
bash webui/scripts/e2e-phase3674.sh
bash webui/scripts/e2e-phase3675.sh
bash webui/scripts/e2e-phase3676.sh
bash webui/scripts/e2e-phase3677.sh
bash webui/scripts/e2e-phase3678.sh
bash webui/scripts/e2e-phase3679.sh
bash webui/scripts/e2e-phase3680.sh
bash webui/scripts/e2e-phase3681.sh
bash webui/scripts/e2e-phase3682.sh
bash webui/scripts/e2e-phase3683.sh
bash webui/scripts/e2e-phase3684.sh
bash webui/scripts/e2e-phase3685.sh
bash webui/scripts/e2e-phase3686.sh
bash webui/scripts/e2e-phase3687.sh
bash webui/scripts/e2e-phase3688.sh
bash webui/scripts/e2e-phase3689.sh
bash webui/scripts/e2e-phase3690.sh
bash webui/scripts/e2e-phase3691.sh
bash webui/scripts/e2e-phase3692.sh
bash webui/scripts/e2e-phase3693.sh
bash webui/scripts/e2e-phase3694.sh
bash webui/scripts/e2e-phase3695.sh
bash webui/scripts/e2e-phase3696.sh
bash webui/scripts/e2e-phase3697.sh
bash webui/scripts/e2e-phase3698.sh
bash webui/scripts/e2e-phase3699.sh
bash webui/scripts/e2e-phase3700.sh
bash webui/scripts/e2e-phase3701.sh
bash webui/scripts/e2e-phase3702.sh
bash webui/scripts/e2e-phase3703.sh
bash webui/scripts/e2e-phase3704.sh
bash webui/scripts/e2e-phase3705.sh
bash webui/scripts/e2e-phase3706.sh
bash webui/scripts/e2e-phase3707.sh
bash webui/scripts/e2e-phase3708.sh
bash webui/scripts/e2e-phase3709.sh
bash webui/scripts/e2e-phase3710.sh
bash webui/scripts/e2e-phase3711.sh
bash webui/scripts/e2e-phase3712.sh
bash webui/scripts/e2e-phase3713.sh
bash webui/scripts/e2e-phase3714.sh
bash webui/scripts/e2e-phase3715.sh
bash webui/scripts/e2e-phase3716.sh
bash webui/scripts/e2e-phase3717.sh
bash webui/scripts/e2e-phase3718.sh
bash webui/scripts/e2e-phase3719.sh
bash webui/scripts/e2e-phase3720.sh
bash webui/scripts/e2e-phase3721.sh
bash webui/scripts/e2e-phase3722.sh
bash webui/scripts/e2e-phase3723.sh
bash webui/scripts/e2e-phase3724.sh
bash webui/scripts/e2e-phase3725.sh
bash webui/scripts/e2e-phase3726.sh
bash webui/scripts/e2e-phase3727.sh
bash webui/scripts/e2e-phase3728.sh
bash webui/scripts/e2e-phase3729.sh
bash webui/scripts/e2e-phase3730.sh
bash webui/scripts/e2e-phase3731.sh
bash webui/scripts/e2e-phase3732.sh
bash webui/scripts/e2e-phase3733.sh
bash webui/scripts/e2e-phase3734.sh
bash webui/scripts/e2e-phase3735.sh
bash webui/scripts/e2e-phase3736.sh
bash webui/scripts/e2e-phase3737.sh
bash webui/scripts/e2e-phase3738.sh
bash webui/scripts/e2e-phase3739.sh
bash webui/scripts/e2e-phase3740.sh
bash webui/scripts/e2e-phase3741.sh
bash webui/scripts/e2e-phase3742.sh
bash webui/scripts/e2e-phase3743.sh
bash webui/scripts/e2e-phase3744.sh
bash webui/scripts/e2e-phase3745.sh
bash webui/scripts/e2e-phase3746.sh
bash webui/scripts/e2e-phase3747.sh
bash webui/scripts/e2e-phase3748.sh
bash webui/scripts/e2e-phase3749.sh
bash webui/scripts/e2e-phase3750.sh
bash webui/scripts/e2e-phase3751.sh
bash webui/scripts/e2e-phase3752.sh
bash webui/scripts/e2e-phase3753.sh
bash webui/scripts/e2e-phase3754.sh
bash webui/scripts/e2e-phase3755.sh
bash webui/scripts/e2e-phase3756.sh
bash webui/scripts/e2e-phase3757.sh
bash webui/scripts/e2e-phase3758.sh
bash webui/scripts/e2e-phase3759.sh
bash webui/scripts/e2e-phase3760.sh
bash webui/scripts/e2e-phase3761.sh
bash webui/scripts/e2e-phase3762.sh
bash webui/scripts/e2e-phase3763.sh
bash webui/scripts/e2e-phase3764.sh
bash webui/scripts/e2e-phase3765.sh
bash webui/scripts/e2e-phase3766.sh
bash webui/scripts/e2e-phase3767.sh
bash webui/scripts/e2e-phase3768.sh
# or everything:
bash webui/scripts/e2e-all.sh
```
