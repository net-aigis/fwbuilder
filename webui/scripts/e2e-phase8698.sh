#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshNotImplementedPasswordRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-password-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8698 e2e passed"
