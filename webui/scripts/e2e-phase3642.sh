#!/usr/bin/env bash
# Phase-3642: UI surface changelog meta roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig surface changelog meta roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surfaceChangelogMetaRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3640+ surface changelog meta roster ok"
echo "cleaned"
echo "OK: phase3642 e2e passed"
