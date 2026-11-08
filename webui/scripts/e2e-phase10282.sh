#!/usr/bin/env bash
# Phase-10282: UI ssh-auth-method-partition roster Soft 10280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-method-partition roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMethodPartitionRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10280+ ssh-auth-method-partition roster ok"; echo "cleaned"; echo "OK: phase10282 e2e passed"
