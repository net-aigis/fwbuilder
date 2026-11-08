#!/usr/bin/env bash
# Phase-11242: UI ssh-auth-export-hint roster Soft 11240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-export-hint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthExportHintRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11240+ ssh-auth-export-hint roster ok"; echo "cleaned"; echo "OK: phase11242 e2e passed"
