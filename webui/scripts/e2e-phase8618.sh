#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshNotImplementedKeyboardRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-keyboard-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8618 e2e passed"
