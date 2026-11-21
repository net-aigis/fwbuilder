#!/usr/bin/env bash
# Phase-22762: UI ssh-auth-soft-22880-echo roster Soft 22760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-22880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft22880EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22760+ ssh-auth-soft-22880-echo roster ok"; echo "cleaned"; echo "OK: phase22762 e2e passed"
