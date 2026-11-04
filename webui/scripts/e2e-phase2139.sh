#!/usr/bin/env bash
# Phase-2139: client honesty operator brief type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_operator_brief?:' webui/frontend/src/api/client.ts
echo "client operator brief type ok"
echo "cleaned"
echo "OK: phase2139 e2e passed"
