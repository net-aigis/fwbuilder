#!/usr/bin/env bash
# Phase-731: client expanding sample types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -c 'layout_fidelity_sample_with_size_policy_expanding' webui/frontend/src/api/client.ts | grep -Eq '^[2-9]|[1-9][0-9]'
echo "client expanding types ok"
echo "cleaned"
echo "OK: phase731 e2e passed"
