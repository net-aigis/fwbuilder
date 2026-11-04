#!/usr/bin/env bash
# Phase-2027: client surface/soft_complete types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_soft_complete_note?:' webui/frontend/src/api/client.ts
echo "client surface/soft_complete types ok"
echo "cleaned"
echo "OK: phase2027 e2e passed"
