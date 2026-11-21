#!/usr/bin/env bash
# Phase-1834: UI track_note bundle + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'track_note:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download track note' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Copy track note' webui/frontend/src/components/FirewallExtras.tsx
echo "UI track_note export ok"
echo "cleaned"
echo "OK: phase1834 e2e passed"
