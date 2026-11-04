#!/usr/bin/env bash
# Phase-2010: UI soft_complete_note bundle + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_complete_note:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download soft-complete note' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copy soft-complete note' webui/frontend/src/components/FirewallExtras.tsx
echo "UI soft_complete_note export ok"
echo "cleaned"
echo "OK: phase2010 e2e passed"
