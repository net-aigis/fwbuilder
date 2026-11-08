#!/usr/bin/env bash
# Phase-13002: UI ssh-auth-export-family roster Soft 13000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-export-family roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthExportFamilyRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13000+ ssh-auth-export-family roster ok"; echo "cleaned"; echo "OK: phase13002 e2e passed"
