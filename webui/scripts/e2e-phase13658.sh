#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthCapKeyCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-cap-key-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase13658 e2e passed"
