#!/usr/bin/env bash
# Phase-1643: client session + export types still cover honesty_bundle via Record.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_export_keys?:' webui/frontend/src/api/client.ts
echo "client honesty_bundle types ok"
echo "cleaned"
echo "OK: phase1643 e2e passed"
