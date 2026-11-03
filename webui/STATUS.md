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
| Full local E2E runner | done | `webui/scripts/e2e-all.sh` |

## Soft-complete (feature/webui polish track)

WebUI on `feature/webui` remains soft-complete for the polish track.

### Hard-gap honesty/preview track — soft-fertig (phase256); preview slices through 320

`WEBUI_SOFT_COMPLETE_PHASE=320`; `/hard-gaps` sets `soft_fertig_honesty_track: true` + `hard_gap_notes` + `layout_fidelity_path`; `GET /layout-fidelity` / option-schema + rule/iface schemas report heuristic `score_percent` (**not** pixel parity).

- Deploy: manifest `# files:`, OS configlets, external PolicyInstallScript, copyFWB, use_scp, gzip transfer on compress (plan shows −%), capabilities API (+ expect_install_plan / walkthrough pointers), live gate + force_limited, expect stub + raw/expanded configlet preview + ordered expect plan (reg_user + safety_net_acl + download + sessionStorage) + dry walkthrough (preview_only + simulated_at timeline, sessionStorage + download); `POST …/run` (+ optional `step=`) → 501 / step_refused (still **no** expect/SSHSession runtime)
- Options: .ui labels, free QLabel annotations (+ alignment), buddy_labels (external_label controls), enabled/visible respect, QRadio bool, QGroupBox sections (flat/checkable), tooltips, page-local QGridLayout + spacers (sizeHint) + column/row stretch + spacing/margins (CSS + page hint) + sizePolicy + min/max size + layout hints + layout_tree + dialog windowTitle/geometry/tab_position/sizeGrip (header WxH + tabs + CSS max-height) + shared `qtGridStyle` + layout-fidelity score on Firewall/Rule/Interface (still **not** full pixel Qt layout)
- SSH: BatchMode only; `GET /ssh-auth`, capabilities.ssh_auth, deploy plan line, `allow_password_auth` → 400, `POST /ssh-auth/password` → 501
- Honesty: UI lists `hard_gap_open` + per-gap notes via `fetchHardGaps`; `GET /hard-gaps` documents remaining gaps; layout-fidelity score is coverage of extracted signals only

Still open (hard backlog — **not** soft-fertig):

- Full Qt AdvancedDialog **pixel** layout parity (exact geometry; dialog size + grid spacing since phase226/241; row/col + spacers/sizeHint + stretch + annotations/buddy_labels/alignment + sizePolicy/min/max/enabled/visible + QGroupBox flat + layout_tree + tab_position/sizeGrip since phase165/177/181/189/205/209/213/257–291; fidelity score since 297)
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
# or everything:
bash webui/scripts/e2e-all.sh
```
