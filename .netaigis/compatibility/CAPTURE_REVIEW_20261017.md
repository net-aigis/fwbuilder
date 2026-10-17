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

## Rechecked after commit 480f18b1 (run 39041823343)

Downloaded artifact 12104662917, digest
sha256:689235d1b8611e001f77df97b79ab1e1e261c781276fd1c8a6f04a77f179a178.

Actual manifest records:
- fwb_pf: pf1, pf2, pf2a each `exit=1`, `compiler_status=warning`,
  `eligible_for_golden_review=false`; the three compiler logs contain
  "Compiled successfully" but **no diagnostic explaining the warning**.
  The original driver aggregates `all_errors` and sets WARNING if nonempty.
  Exact causes remain unverified.
- fwb_pix: `test_fw` from pix7.fwb, asa8.0-names.fwb and asa8.0.fwb
  each `exit=2`, `compiler_status=nonzero`. All three logs explicitly
  report missing inside-interface network zones; pix7 additionally warns
  Ethernet0 with VLAN subinterfaces cannot be used for ACL.
- fwb_junosacl: no matching policy fixture.
- fwb_ipt, fwb_ipf, fwb_ipfw, fwb_iosacl: exit 0 with output.

The newly added status classification is therefore verified by the CI
artifact; no semantic equivalence claim is implied.

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
