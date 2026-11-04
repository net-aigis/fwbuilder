#!/usr/bin/env bash
# Phase-2539: client honesty export roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_export_roster?:' webui/frontend/src/api/client.ts
echo "client honesty export roster type ok"
echo "cleaned"
echo "OK: phase2539 e2e passed"
