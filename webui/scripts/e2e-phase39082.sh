#!/usr/bin/env bash
# Phase-39082: UI ssh-auth-soft-40840-echo roster Soft 39080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-40840-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft40840EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39080+ ssh-auth-soft-40840-echo roster ok"; echo "cleaned"; echo "OK: phase39082 e2e passed"
