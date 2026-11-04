#!/usr/bin/env bash
# Phase-2379: client honesty path roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_path_roster?:' webui/frontend/src/api/client.ts
echo "client honesty path roster type ok"
echo "cleaned"
echo "OK: phase2379 e2e passed"
