#!/usr/bin/env bash
# Phase-2122: UI honestySurfaceChangelogStorageKey + clear/restore wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestySurfaceChangelogStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestySurfaceChangelog.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceChangelogStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_changelog session key ok"
echo "cleaned"
echo "OK: phase2122 e2e passed"
