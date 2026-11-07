#!/usr/bin/env bash
# Phase-4219: client option_enable_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_option_enable_roster?:' webui/frontend/src/api/client.ts
echo "client option-enable roster type ok"
echo "cleaned"
echo "OK: phase4219 e2e passed"
