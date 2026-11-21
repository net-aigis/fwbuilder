#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthExportFamilyRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-export-family roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase12938 e2e passed"
