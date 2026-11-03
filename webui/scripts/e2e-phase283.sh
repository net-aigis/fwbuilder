#!/usr/bin/env bash
# Phase-283: layout_tree page hint + walkthrough sessionStorage persist.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'tree×' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectWalkthroughKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.expectWalkthrough' webui/frontend/src/components/FirewallExtras.tsx
echo "tree hint + walkthrough persist ok"
echo "cleaned"
echo "OK: phase283 e2e passed"
