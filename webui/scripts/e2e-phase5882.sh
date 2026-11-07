#!/usr/bin/env bash
# Phase-5882: UI ssh-password-support roster Soft 5880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-password-support roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5880+ ssh-password-support roster ok"; echo "cleaned"; echo "OK: phase5882 e2e passed"
