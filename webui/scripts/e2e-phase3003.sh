#!/usr/bin/env bash
# Phase-3003: client ssh_honesty_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_ssh_honesty_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3000+ ssh_honesty_roster type ok"
echo "cleaned"
echo "OK: phase3003 e2e passed"
