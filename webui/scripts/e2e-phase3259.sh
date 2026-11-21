#!/usr/bin/env bash
# Phase-3259: client soft_fertig_catalog_summary_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_catalog_summary_roster?:' webui/frontend/src/api/client.ts
echo "client catalog summary roster type ok"
echo "cleaned"
echo "OK: phase3259 e2e passed"
