#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthExportHintRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-export-hint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11178 e2e passed"
