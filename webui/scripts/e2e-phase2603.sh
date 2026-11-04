#!/usr/bin/env bash
# Phase-2603: client honesty_export_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_export_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2600+ honesty_export_roster type ok"
echo "cleaned"
echo "OK: phase2603 e2e passed"
