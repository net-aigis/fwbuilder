# FWB 5.3.8: compiler-output capture (first stage)

The first successful original Qt5 build is GitHub Actions run `39030130856`.
The preserved FWB 5.3.8 source ancestor is `46d2f67e9d7929c10791bb6747627066a3ea5c26`.

This first-stage recorder runs after the existing baseline build. It:

- requires all seven policy compiler executables discovered by the real build;
- invokes each compiler's supported `-V` command, failing CI if it fails;
- scans only checked-in `src/unit_tests/**/*.fwb` XML fixtures;
- attempts to compile a matching firewall in a separate diagnostic directory;
- records the input fixture hash, exit code, output-file SHA256 checksums,
  and compiler diagnostic output in `ci-logs/compiler-output-capture/`;
- NEVER executes, installs, uploads, or deploys a generated firewall script.

**Important:** Attempts with unsuccessful fixture compilation are recorded but do
not yet fail the build. A successful `-V` for all seven executables is an
executable-load smoke test, not a semantic regression test. Any captured output
is exploratory and **NOT an approved golden reference**. Review compiler logs,
coverage, reproducibility, and dynamic output fields before freezing comparison
baselines and making fixture-compilation success mandatory. Do not silently
normalize policy-changing statements.

The existing 516-path compatibility-presence guard continues unchanged.

CI remains limited to the openSUSE Leap 16.0 reference environment. Other OSes
are later compatibility test targets; this does not limit the firewall backends.

The second CI capture confirmed that source fixtures (XML v22) require
conversion to this build's XML v24 schema. CLI compilers refuse to upgrade
input files in place. CI installs the original XSLT migration resources,
copies fixtures to scratch storage, and runs the existing `fwbedit upgrade`
with explicit confirmation on the **copy only**. Original `.fwb` files remain
unchanged. Original/prepared SHA256 hashes and schema versions are recorded.
An empty baseline capture is now a CI failure, not a false success.
