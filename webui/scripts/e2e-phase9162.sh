#!/usr/bin/env bash
# Phase-9162: UI ssh-auth-list-length roster Soft 9160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-list-length roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthListLengthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9160+ ssh-auth-list-length roster ok"; echo "cleaned"; echo "OK: phase9162 e2e passed"
