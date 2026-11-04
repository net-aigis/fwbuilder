#!/usr/bin/env bash
# Phase-846: UI still shows minSize=/maxSize= after score weight.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'minSize=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'maxSize=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI min/max size bits still present"
echo "cleaned"
echo "OK: phase846 e2e passed"
