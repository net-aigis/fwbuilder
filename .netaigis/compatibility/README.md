# FWB 5.3.8: compatibility preservation

The baseline is `46d2f67e9d7929c10791bb6747627066a3ea5c26`, both
`computersalat/5.3.x` and tag `5.3.8`.

`check_legacy_surface.py` compares tracked files to the baseline using Git.
It rejects silent deletion/renaming of existing platform compilers (Cisco,
iptables, PF/ipfw/ipfilter, Juniper), platform definitions and configlets,
legacy compiler test fixtures, `.fwb` files, and selected XML data-model code.

Run it at repository root:

```sh
python3 .netaigis/compatibility/check_legacy_surface.py
```

**Scope limitation:** Presence of source files is not evidence that generated
rules remain equivalent, or that old project databases remain readable. Before
shipping a modernized version, establish and execute golden-output tests for
iptables, PF, Cisco, Juniper and the other supported compilers, and round-trip
and backward-format compatibility tests using non-sensitive `.fwb` fixtures.

Avoid sweeping branch merges and do not discard legacy `.pro`, `.pri` or
Autotools files until alternative build/test coverage is verified.
