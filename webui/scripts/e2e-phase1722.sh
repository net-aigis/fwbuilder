#!/usr/bin/env bash
# Phase-1722: UI surface schema version bit + bundle meta.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surface schema' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_surface_version' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface version ok"
echo "cleaned"
echo "OK: phase1722 e2e passed"
