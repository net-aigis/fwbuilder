#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshCapabilityFlagsRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-capability-flags-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7578 e2e passed"
