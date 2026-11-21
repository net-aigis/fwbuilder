#!/usr/bin/env bash
# Phase-485: client plan/walkthrough types include canonical_step_ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -c 'canonical_step_ids' webui/frontend/src/api/client.ts | awk '{exit !($1>=2)}'
echo "client canonical_step_ids types ok"
echo "cleaned"
echo "OK: phase485 e2e passed"
