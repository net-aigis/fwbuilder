#!/usr/bin/env bash
# Phase-4379: client expect_steps_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_expect_steps_roster?:' webui/frontend/src/api/client.ts
echo "client expect-steps roster type ok"
echo "cleaned"
echo "OK: phase4379 e2e passed"
