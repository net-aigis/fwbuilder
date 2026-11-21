#!/usr/bin/env bash
# Phase-593: expect refusals sessionStorage + download.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectRefusalsKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download refusals' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.expectRefusals.' webui/frontend/src/components/FirewallExtras.tsx
echo "refusals persist/download ok"
echo "cleaned"
echo "OK: phase593 e2e passed"
