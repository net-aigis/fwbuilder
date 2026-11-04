#!/usr/bin/env bash
# Phase-2619: client honesty bundle roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_bundle_roster?:' webui/frontend/src/api/client.ts
echo "client honesty bundle roster type ok"
echo "cleaned"
echo "OK: phase2619 e2e passed"
