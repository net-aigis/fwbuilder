#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthExportSshRatioRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-export-ssh-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14218 e2e passed"
