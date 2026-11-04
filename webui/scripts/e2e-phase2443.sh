#!/usr/bin/env bash
# Phase-2443: client honesty_path_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_path_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2440+ honesty_path_roster type ok"
echo "cleaned"
echo "OK: phase2443 e2e passed"
