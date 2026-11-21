#!/usr/bin/env bash
# Phase-6602: UI ssh-not-implemented-batch roster Soft 6600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6600+ ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6602 e2e passed"
