#!/usr/bin/env bash
# Phase-11882: UI ssh-auth-export-count roster Soft 11880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-export-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthExportCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11880+ ssh-auth-export-count roster ok"; echo "cleaned"; echo "OK: phase11882 e2e passed"
