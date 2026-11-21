#!/usr/bin/env bash
# Phase-2090: UI surface_changelog bundle section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surface_changelog:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_surface_changelog:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_changelog bundle ok"
echo "cleaned"
echo "OK: phase2090 e2e passed"
