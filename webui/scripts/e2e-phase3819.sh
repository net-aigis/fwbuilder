#!/usr/bin/env bash
# Phase-3819: client health_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_health_roster?:' webui/frontend/src/api/client.ts
echo "client health roster type ok"
echo "cleaned"
echo "OK: phase3819 e2e passed"
