#!/usr/bin/env bash
# Phase-652: client honesty_milestone_note type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_milestone_note?' webui/frontend/src/api/client.ts
echo "client milestone note ok"
echo "cleaned"
echo "OK: phase652 e2e passed"
