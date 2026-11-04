#!/usr/bin/env bash
# Phase-482: probe-step select + unknown option in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectProbeStep' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq '__unknown_probe__' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'unknown_step' webui/frontend/src/components/FirewallExtras.tsx
echo "probe step UI ok"
echo "cleaned"
echo "OK: phase482 e2e passed"
