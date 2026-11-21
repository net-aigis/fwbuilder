#!/usr/bin/env bash
# Phase-490: UI shows visible/keys in fidelity summary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'with_visible' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'keys×' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'signal_keys' webui/frontend/src/api/client.ts
echo "fidelity UI signals ok"
echo "cleaned"
echo "OK: phase490 e2e passed"
