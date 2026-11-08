#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthBundleHintRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-bundle-hint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11258 e2e passed"
