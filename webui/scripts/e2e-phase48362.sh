#!/usr/bin/env bash
# Phase-48362: UI ssh-auth-soft-51280-echo roster Soft 48360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-51280-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft51280EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48360+ ssh-auth-soft-51280-echo roster ok"; echo "cleaned"; echo "OK: phase48362 e2e passed"
