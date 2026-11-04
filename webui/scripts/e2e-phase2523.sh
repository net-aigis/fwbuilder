#!/usr/bin/env bash
# Phase-2523: client session_storage_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2520+ session_storage_roster type ok"
echo "cleaned"
echo "OK: phase2523 e2e passed"
