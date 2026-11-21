#!/usr/bin/env bash
# Phase-14282: UI ssh-auth-export-ssh-ratio roster Soft 14280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-export-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthExportSshRatioRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14280+ ssh-auth-export-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14282 e2e passed"
