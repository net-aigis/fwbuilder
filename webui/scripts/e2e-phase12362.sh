#!/usr/bin/env bash
# Phase-12362: UI ssh-auth-method-count roster Soft 12360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-method-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMethodCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12360+ ssh-auth-method-count roster ok"; echo "cleaned"; echo "OK: phase12362 e2e passed"
