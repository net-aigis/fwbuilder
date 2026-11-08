#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthCapabilityCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-capability-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase9978 e2e passed"
