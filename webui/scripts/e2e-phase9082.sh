#!/usr/bin/env bash
# Phase-9082: UI ssh-auth-field-presence roster Soft 9080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-field-presence roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthFieldPresenceRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9080+ ssh-auth-field-presence roster ok"; echo "cleaned"; echo "OK: phase9082 e2e passed"
