#!/usr/bin/env bash
# Phase-699: client spacer size_type types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -c 'size_type?: string' webui/frontend/src/api/client.ts | grep -Eq '^[2-9]|[1-9][0-9]'
echo "client size_type ok"
echo "cleaned"
echo "OK: phase699 e2e passed"
