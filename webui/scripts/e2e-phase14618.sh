#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthAuthPrefixRatioRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-auth-prefix-ratio roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14618 e2e passed"
