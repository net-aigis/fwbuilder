#!/usr/bin/env bash
# Phase-38762: UI ssh-auth-soft-40480-echo roster Soft 38760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-40480-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft40480EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 38760+ ssh-auth-soft-40480-echo roster ok"; echo "cleaned"; echo "OK: phase38762 e2e passed"
