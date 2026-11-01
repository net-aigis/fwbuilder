# Central prolog/epilog hooks

Compile-time inclusion of shell fragments from a configured directory on
the **compiler host**. The text is embedded in the generated firewall
script. No extra file is transferred to the target.

## When nothing is configured

If `FWBUILDER_HOOKS_DIR` is unset and Preferences → Central hooks
directory is empty, behaviour is unchanged: only the per-object
`prolog_script` / `epilog_script` options are used.

## Configuration

1. Environment variable `FWBUILDER_HOOKS_DIR` (highest priority).
2. Preferences setting `Environment/HooksBaseDir` (GUI: Central hooks
   directory). Relative paths are resolved against the process current
   directory at compile time.

The configured base directory must exist and must not be a symbolic
link. Missing optional subdirectories are ignored. Unreadable hook
files and symbolic links inside the tree abort the compile.

## Directory layout

```text
<base>/
├── prolog.d/                 # global prolog, all shell backends
├── epilog.d/                 # global epilog
├── profiles.map              # optional: firewall_name profile_name
├── platforms/
│   └── <platform>/           # iptables | nftables | pf | ipf | ipfw
│       ├── prolog.d/
│       └── epilog.d/
└── profiles/
    └── <profile>/            # explicit profile only
        ├── prolog.d/
        └── epilog.d/
```

## File rules

- Regular files ending in `.sh` only.
- Lexicographic order by file name.
- Hidden names and non-`.sh` files are ignored (so README files may sit
  beside hooks).
- Symbolic links are refused.
- The same canonical path is included at most once per compile.

## Composition order

1. `<base>/prolog.d/` (or `epilog.d/`)
2. `<base>/platforms/<platform>/...`
3. `<base>/profiles/<profile>/...` when a profile is selected
4. Existing per-object GUI script

Each fragment is wrapped with `# begin/end fwbuilder central hook`
comments so the generated script shows provenance.

## Profile selection

Profiles are **never** inferred from hostname or distribution probing.

1. Firewall option `hooks_profile` (iptables advanced dialog), if set.
2. Otherwise a line in `<base>/profiles.map`:
   `firewall_name profile_name`

## Supported backends

Shell activation scripts only:

- iptables
- nftables (wire the same `CentralHooks::composeOrAbort` call when the
  native nftables branch is integrated; helper already allows the
  platform name)
- pf / ipf / ipfw — only when the hook is placed in the **shell**
  activation script (`prolog_place=fw_file`). Hooks are not injected
  into PF/device policy languages.

Device-CLI backends (PIX, IOS ACL, Junos, …) are not modified.

## Security notes

- Hook text is not executed during compilation.
- Existing start/reload/rollback semantics of the generated script are
  unchanged; hooks run at the historical prolog/epilog points.
- A general shell syntax guarantee is not claimed.
