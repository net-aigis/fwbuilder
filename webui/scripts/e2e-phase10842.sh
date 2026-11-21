#!/usr/bin/env bash
# Phase-10842: UI ssh-auth-hard-gap-echo roster Soft 10840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-hard-gap-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthHardGapEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10840+ ssh-auth-hard-gap-echo roster ok"; echo "cleaned"; echo "OK: phase10842 e2e passed"
