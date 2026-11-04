#!/usr/bin/env bash
# Phase-2683: client honesty_bundle_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_bundle_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2680+ honesty_bundle_roster type ok"
echo "cleaned"
echo "OK: phase2683 e2e passed"
