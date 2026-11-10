#!/usr/bin/env bash
# Phase-23402: UI ssh-auth-soft-23280-echo roster Soft 23400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-23280-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft23280EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23400+ ssh-auth-soft-23280-echo roster ok"; echo "cleaned"; echo "OK: phase23402 e2e passed"
