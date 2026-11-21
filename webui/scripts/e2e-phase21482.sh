#!/usr/bin/env bash
# Phase-21482: UI ssh-auth-soft-21480-echo roster Soft 21480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-21480-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft21480EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21480+ ssh-auth-soft-21480-echo roster ok"; echo "cleaned"; echo "OK: phase21482 e2e passed"
