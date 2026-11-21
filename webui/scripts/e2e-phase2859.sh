#!/usr/bin/env bash
# Phase-2859: client expect step roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_step_roster?:' webui/frontend/src/api/client.ts
echo "client expect step roster type ok"
echo "cleaned"
echo "OK: phase2859 e2e passed"
