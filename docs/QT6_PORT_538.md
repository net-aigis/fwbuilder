# Qt6 port of preserved FWB 5.3.8

Merged via PR #9; product line is **`main`** / tag **v6.0.0**.
Qt5 remains the supported CI path until this branch is green.

## Not in scope here

The Leap Qt6 **reference** job that builds upstream `master` with CMake
`UseQt6=ON` (pin `8013c00e…`) is a comparison only. Patches:
`~/MyGIT/patches/fwbuilder-leap16-qt6-reference-*.patch`. This branch ports the
**5.3.8 autotools/qmake tree**.

## First scaffolding (this branch)

- `configure.in` accepts Qt 6.x and prefers `qmake6` / `qmake-qt6`.
- `qmake.inc.in` enables `c++17` when `QT_MAJOR_VERSION > 5` (no `core5compat`).
- CI: `.github/workflows/fwbuilder-538-qt6-port.yml` builds this tree with Qt6.
- Local `autogen.sh --with-qmake=qmake6` reaches the Qt version check; full
  compile needs Leap devel packages (`libxml2-devel` …) — CI installs those.

## Inventory (approx., on #8 tip)

| API / pattern | Status | Qt6 direction |
|---------------|--------|---------------|
| `toAscii()` / `fromAscii` | done (~55 files → `toLatin1`/`fromLatin1`) | — |
| `QDesktopWidget` | done (GUI uses `QScreen`; Qt&lt;5.14 kept behind `#if`) | — |
| `QRegExp` | done | Fully migrated to `QRegularExpression` (FilterDialog uses `wildcardToRegularExpression`) |
| `QTextCodec` | done for Qt6 | Calls guarded to Qt5; Qt6 uses UTF-8 defaults, `core5compat` dropped |
| `endl` on streams | open (many) | Prefer `Qt::endl` where needed |

Qt6 preferred on this branch; Qt5 path must stay buildable (CI baseline still uses
`--with-qmake=qmake-qt5`).

## Build status (local Leap 16 + qmake6)

- Full tree builds with `qmake6` (EXIT 0), including `src/gui/fwbuilder` and policy compilers (`fwb_nft`, `fwb_ipt`, …).
- `QMAKE_UIC_FLAGS += -c string` required so `.ui` subclass slots compile.
- Remaining work: Windows/macOS smoke; keep PR #9 CI green.

## Next code passes

1. Drive Qt6 CI green (fix remaining compile breaks after first CI run).
2. Windows/macOS smoke builds.
3. Windows/macOS Qt6 smoke once Linux CI is green.
