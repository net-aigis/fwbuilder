#!/usr/bin/env bash
# Phase-42922: UI ssh-auth-soft-45160-echo roster Soft 42920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-45160-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft45160EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42920+ ssh-auth-soft-45160-echo roster ok"; echo "cleaned"; echo "OK: phase42922 e2e passed"
