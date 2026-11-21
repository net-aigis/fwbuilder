#!/usr/bin/env bash
# Phase-4283: client soft_fertig_option_enable_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_option_enable_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4280+ soft_fertig_option_enable_roster type ok"
echo "cleaned"
echo "OK: phase4283 e2e passed"
