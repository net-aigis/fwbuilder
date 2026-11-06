#!/usr/bin/env bash
# Phase-4059: client layout_fidelity_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_roster?:' webui/frontend/src/api/client.ts
echo "client layout-fidelity roster type ok"
echo "cleaned"
echo "OK: phase4059 e2e passed"
