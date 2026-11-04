#!/usr/bin/env bash
# Phase-1434: UI honesty path fields referenced.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_path_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_path_notes_count' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty path fields ok"
echo "cleaned"
echo "OK: phase1434 e2e passed"
