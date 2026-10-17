# Candidate fork changes – audit snapshot

Source: `comparisons.json`, `forks.json` and `report.txt` from the GitHub API audit of 2026-10-17T08:51:25Z. GitHub `ahead` means divergent commits, not verified improvements. No foreign code has been merged yet.

| Candidate | Observed evidence | Next review step | Status |
| --- | --- | --- | --- |
| `computersalat/fwbuilder:5.3.x` | 34 commits ahead / 190 behind upstream `master`; includes `46d2f67e9d7929c10791bb6747627066a3ea5c26` (`fwadmin_known_hosts`, 2024-08-30) | Keep as baseline, prove known-hosts regression test | Baseline; not runtime-tested |
| `computersalat/fwbuilder:master` | 0 ahead / 0 behind upstream `master` in the audit | Reference only; must not replace brother's `5.3.x` | Unmodified versus upstream |
| `amarce/fwbuilder:master` | 88 commits ahead; native nftables compiler, importer, sets, maps and unit-test files | Separate source/build/security review; compare behavior against stock and FWF | Candidate only |
| `haubentaucher/fwbuilder:master` | 10 ahead; `iptables-translate`, IPv6 translation, comments, `onlink` routing; also RADView branding | Separate vendor customization from general fixes; test translators | Candidate only |
| `ams-tschoening/fwbuilder` | Separate PuTTY/SSH, routing and Windows build branches | Examine individual commits, do not merge `local_dev` en bloc | Candidate only |
| `seanms/fwbuilder:redhat` | Seven ahead of old shared ancestor; Fedora 34 packaging work | Assess compatibility with current RPM/openSUSE packaging | Candidate only |
| `Tobix99/fwbuilder:master` | Three ahead; CI/Qt5, Win/macOS build metadata | Review only if applicable | Candidate only |

## Gates before integration

For each candidate: capture SHA; inspect commit diff and attribution; compare with baseline and upstream; resolve overlap; compile; test negative and positive fixtures; isolate merge in its own branch; never assert a feature is supported merely from commit subject lines.

Open issue: `Sjenica1/fwbuilder` returned GitHub 404 in branch listing/comparison; the audit contained 81 visible forks, with 55 having unique commits on checked branches, 25 without, and one unresolved.
