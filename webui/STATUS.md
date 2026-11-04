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
| Full local E2E runner | done | `webui/scripts/e2e-all.sh` |

## Soft-complete (feature/webui polish track)

WebUI on `feature/webui` remains soft-complete for the polish track.

### Hard-gap honesty/preview track — soft-fertig (phase256); preview slices through 1384

`WEBUI_SOFT_COMPLETE_PHASE=1384`; `WEBUI_HONESTY_MILESTONE=2400` (+ `honesty_milestone_note` checkpoint text on `/health`, `/res-status`, `/hard-gaps`, summary, closure; UI shows truncated note); `/health` and `/res-status` expose `honesty_milestone` + `soft_fertig_honesty_track` + `hard_gap_count`; `/hard-gaps` (+ `/hard-gaps/summary` compact snapshot with `layout_fidelity_sample_score_percent` / `score_parts_count` / `layout_fidelity_pixel_parity: false` + `layout_fidelity_sample_spacers` / `spacers_with_orientation` / `spacers_with_size_type` / `with_size_policy_expanding` / `with_size_policy_fixed` / `with_size_policy_minimum` + `with_minimum_size` / `with_maximum_size` + `expect_plan_step_count` for iptables/linux24 + `/hard-gaps/closure` with `hard_gap_notes` + `parent_path` + `hard_gap_count` + `honesty_milestone` + `soft_fertig_honesty_track` + `summary_path`) sets `soft_fertig_honesty_track: true` + `honesty_milestone: 2400` + `honesty_paths` / `honesty_paths_count` / `summary_path` (catalog of honesty/preview endpoints; expandable in UI) + `layout_fidelity_sample_*` including spacer + expanding sizePolicy counts on both `/hard-gaps` and summary (UI seeds sample fidelity + spacer/expanding bits on load; **not pixel**; score weights now include `spacers_with_orientation` / `spacers_with_size_type` / `with_size_policy_expanding` — more weights can lower % without feature loss; UI `qtSpacerStyle` + `data-size-type` apply Expanding/Fixed hints; field CSS maps size-h/v Expanding/Minimum/Preferred/Fixed) + `expect_plan_step_ids` / `expect_plan_step_notes` / `expect_plan_step_notes_count` (expandable per-step refusal descriptions; also on GET …/steps `step_notes`) + `ssh_alternative_notes` / `ssh_refusal_path_notes` (expandable SSH BatchMode honesty; also on GET `/ssh-auth`) + `hard_gap_notes` + `hard_gap_closure` + `closure_path` (shown in UI with `hard_gap_count`; **Show hard-gap closure** / **Download closure**, **Show hard-gaps summary** / **Download summary** / **Clear hard-gaps snapshot**, sessionStorage) + `layout_fidelity_path` + `layout_fidelity_signal_catalog` (expandable key list in UI) + `stack_switch_path` + `option_enable_path` + `expect_run_path` + `expect_steps_path` + `expect_steps_refusals_path` + `ssh_auth_path` + `password_ssh_path` + `ssh_batch_mode_only` / `ssh_alternatives` / `ssh_refusal_paths`; UI can download/copy `/hard-gaps` JSON (sessionStorage `fwbweb.hardGaps.*`) and preview/download expect step refusals (incl. `unknown_step_probe`, sessionStorage); soft-fertig track flag shown in UI; `GET /layout-fidelity` / option-schema + rule/iface schemas report heuristic `score_percent` (**not** pixel parity; `score_parts_count` documents weight count — more weights can lower % without feature loss; weights include `with_whats_this` / `with_tooltip` / `with_enabled` / `with_alignment` / `tab_position` / `pages_with_tooltip` plus `stacked_sections` / `with_visible` / `pages_with_buddy_labels` / `sections_with_flat|checkable` / `layout_tree_max_depth`; schemas expose compact summary with `signal_key_count` + `score_parts_count`); `visible=false` keeps `field-ui-hidden` grid holes; `GET /stack-switch` + `GET /option-enable` expose desktop maps; `option_enable` follows bonding→xmit and LOG/ULOG (ipt/ipcop/secuwall); iface Device type writes `options.type` and drives stack (no duplicate type field); Firewall/Interface/Rule UI show rich fidelity + refuse paths + soft-complete phase + enable-rules summary + canonical expect step ids/catalog + probe-step select (incl. unknown) + SSH refusal map; `GET /expect-install-plan/steps` lists refused ids; `GET …/steps/refusals` previews per-step 501 payloads + unknown probe; capabilities carry `canonical_step_ids`; unknown `step=` → `expect_installer_unknown_step`; SSH `batch_mode_only` + `alternatives` + `refusal_paths` (deploy 400 / password 501); read_only fields use `field-ui-readonly`.

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
# or everything:
bash webui/scripts/e2e-all.sh
```
