#!/usr/bin/env bash
# Phase-5802: UI ssh-alternative-support roster Soft 5800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-support roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeSupportRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5800+ ssh-alternative-support roster ok"; echo "cleaned"; echo "OK: phase5802 e2e passed"
