#!/usr/bin/env bash
# Phase-578: UI closure text includes note + parent.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'parent_path' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'parent=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gap_notes' webui/frontend/src/api/client.ts
echo "closure notes UI ok"
echo "cleaned"
echo "OK: phase578 e2e passed"
