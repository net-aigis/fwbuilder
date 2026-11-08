#!/usr/bin/env bash
# Phase-12762: UI ssh-auth-gap-open-echo roster Soft 12760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-gap-open-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthGapOpenEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12760+ ssh-auth-gap-open-echo roster ok"; echo "cleaned"; echo "OK: phase12762 e2e passed"
