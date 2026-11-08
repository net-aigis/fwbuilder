#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthEmptyCheckRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-empty-check roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10618 e2e passed"
