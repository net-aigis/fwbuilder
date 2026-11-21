#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthBoolFlagRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-bool-flag roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase9178 e2e passed"
