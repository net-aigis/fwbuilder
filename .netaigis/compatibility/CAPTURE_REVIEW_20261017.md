# FWB 5.3.8 compiler capture review — 2026-10-17

Source: GitHub Actions run 39040220614, artifact 12104306655,
SHA-256 digest 43e00e9dce1dde33380480805211a434f88f7d6740454dc08cd647b2bde87971.
Head commit: 9b2e85ad6e884f9545a360c0c7b5e0b997b803a4.
The capture is exploratory and is **not** a golden baseline.

## Observed results

- Exit 0 with generated output: fwb_ipt, fwb_ipf, fwb_ipfw, fwb_iosacl.
- fwb_pf: three attempts generated files and printed "Compiled successfully",
  but each process exited 1. The PF executable returns driver->getStatus()
  directly; BaseCompiler defines 0=SUCCESS, 1=WARNING, 2=ERROR.
  CompilerDriver_pf_run.cpp sets WARNING when all_errors is nonempty.
  Thus these are warning-status outputs, **not** error-free baselines.
  The saved logs alone do not identify the individual warning source.
- fwb_pix: three importer-derived fixtures exited 2 before generating output.
  Each log specifically reports missing network-zone definitions on inside
  interfaces. Do not silently invent network-zone assignments or change
  source policy semantics to turn these into successful tests.
- fwb_junosacl: binary version probe works; no matching firewall object
  was found in checked-in unit-test fixtures.

## Follow-up required before approval

1. Establish a valid, explicitly reviewed PIX/ASA policy fixture with
   populated network zones; preferably from a purpose-built compiler test,
   not by modifying imported policy silently.
2. Trace PF all_errors for the warning-status cases; accept or resolve
   warnings based on source evidence and explicit test expectations.
3. Add a Junos ACL firewall fixture or document the coverage exception.
4. Rerun identical inputs independently and compare hashes for reproducibility.
   Then obtain a separately built preserved-original reference and compare
   outputs semantically; never normalize policy-changing lines.
5. Only after review introduce mandatory golden assertions.

No legacy compiler or tracked policy fixture is modified by this report.
