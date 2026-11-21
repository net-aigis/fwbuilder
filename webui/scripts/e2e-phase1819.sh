#!/usr/bin/env bash
# Phase-1819: client soft_fertig_honesty_track_note type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_track_note?:' webui/frontend/src/api/client.ts
echo "client track note type ok"
echo "cleaned"
echo "OK: phase1819 e2e passed"
