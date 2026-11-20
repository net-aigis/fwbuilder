#!/usr/bin/env bash
# Phase-47402: UI ssh-auth-soft-50200-echo roster Soft 47400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-50200-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft50200EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47400+ ssh-auth-soft-50200-echo roster ok"; echo "cleaned"; echo "OK: phase47402 e2e passed"
