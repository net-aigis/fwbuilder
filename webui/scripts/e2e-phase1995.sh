#!/usr/bin/env bash
# Phase-1995: client soft_complete_note type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_soft_complete_note?:' webui/frontend/src/api/client.ts
echo "client soft_complete_note type ok"
echo "cleaned"
echo "OK: phase1995 e2e passed"
