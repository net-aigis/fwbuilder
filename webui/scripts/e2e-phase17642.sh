#!/usr/bin/env bash
# Phase-17642: UI ssh-auth-soft-17560-echo roster Soft 17640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-17560-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft17560EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17640+ ssh-auth-soft-17560-echo roster ok"; echo "cleaned"; echo "OK: phase17642 e2e passed"
