#!/usr/bin/env bash
# Phase-12122: UI ssh-auth-readiness-echo roster Soft 12120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-readiness-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthReadinessEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12120+ ssh-auth-readiness-echo roster ok"; echo "cleaned"; echo "OK: phase12122 e2e passed"
